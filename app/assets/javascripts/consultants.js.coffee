jQuery ($) ->

  # Parent class for dropdown boxes that pull data from API
  class ApiBox
    constructor: ->
      @product_content_container = $("div#product-content")
      @spinner = $("<div class='placeholder'><p><img src='#{ @product_content_container.data('loading') }' alt='loading'></p></div>")

  # Represents software dropdown box
  class SoftwareBox extends ApiBox
    constructor: (form) ->
      @select = $(form).find("select")
      @software_panels = {}
      super
      @load_software()
      @handle_change()

    load_software: =>
      $.getJSON "/consultants/software.json", (data) =>
        $.each data.softwares, (key, software) =>
          @select.append $("<option value='#{software.id}'>#{software.formatted_name}</option>")
          @software_panels[software.id] = @build_panel(software)
        @select.find("option.loading").html('Select Software...').val('')

    build_panel: (software) ->
      $panel = $("<div></div>")
      $panel.append("<h4>#{ software.name }</h4>")
      $panel.append("<p>Version: #{ software.version }<br/>Platform: #{ software.platform }</p>")
      $panel.append("<p><a href=' #{ software.url }' target='_blank'>Software details</a></p>")
      $panel.append("<p><a href=' #{ software.direct_download_url }' target='_blank' class='tiny radius button'>download</a></p>")
      $panel

    handle_change: =>
      @select.change (e) =>
        software_id = @select.val()
        if software_id.length
          @product_content_container.html( @software_panels[software_id] )
          @reset_product_forms()

    reset_product_forms: ->
      $("form.product_selector").each ->
        $(this).find("select option:selected").prop('selected', false)

  # Represents instance of brand-based product dropdown box
  class ProductBox extends ApiBox
    constructor: (@this_form) ->
      @select = $(@this_form).find("select")
      @brand_id =$(@this_form).data("brand-id")
      @product_panels = {}
      super
      @load_products()
      @handle_change()

    load_products: =>
      url = "/brands/#{ @brand_id }/products.json"
      $.getJSON url, (data) =>
        $.each data.products, (key, prod) =>
          @select.append $("<option value='#{prod.id}'>#{prod.name}</option>")
        @select.find("option.loading").html('Select A Product...').val('')

    handle_change: =>
      @select.change (e) =>
        product_id = @select.val()
        if product_id.length
          @product_content_container.html( @spinner )
          @build_or_retrieve_panel(product_id)
          @reset_forms(@brand_id)

    build_or_retrieve_panel: (product_id) =>
      if @product_panels.hasOwnProperty(product_id)
        @product_content_container.html( @product_panels[product_id] )
      else
        @build_panel(product_id)

    build_panel: (product_id) =>
      product_url = "/brands/#{ @brand_id }/products/#{ product_id }.json"
      $.getJSON product_url, (data) =>
        $panel = $("<div></div>")
        if data.images.length > 0
          img = data.images[0].image
          $panel.append("<div class='text-center'><a href='#{ img.url }'><img src='#{ img.medium }'/></a></div><br/>")

        $panel.append("<h4>#{data.name}</h4><p>#{ data.brief }</p>" )

        if data.documents.length > 0
          doclist = $("<ul></ul>")
          $.each data.documents, (key, doc) ->
            doclist.append("<li><a href='#{ doc.document.url }' target='_blank'>#{ doc.document.name }</a></li>")
          $panel.append('<h5>Documentation</h5>')
          $panel.append( doclist )

        if data.software.length > 0
          software_list = $("<ul></ul>")
          $.each data.software, (key, s) ->
            software_list.append("<li><a href='#{ s.software.url }' target='_blank'>#{ s.software.name }</a></li>")
          $panel.append('<h5>Software</h5>')
          $panel.append( software_list )

        $panel.append("<p><a href='#{ data.link }' target='_blank' class='tiny radius button'>more info...</a></p>")
        @product_panels[product_id] = $panel
        @product_content_container.html( $panel )

    reset_forms: (brand_id) ->
      $("form.product_selector").each ->
        unless $(@).data('brand-id') == brand_id
          $(@).find("select option:selected").prop('selected', false)

      $("form#software-menu").each ->
        $(@).find("select option:selected").prop('selected', false)

  $("form.product_selector").each -> new ProductBox(@)
  $("form#software-menu").each -> new SoftwareBox(@)
