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
          @software_panels[software.id] = new SoftwarePanel(software).panel
        @select.find("option.loading").html('Select Software...').val('')

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
  class BrandProductBox extends ApiBox
    constructor: (@this_form) ->
      @select = $(@this_form).find("select")
      @brand_id =$(@this_form).data("brand-id")
      @products = {}
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

    # Clears out selections in other dropdowns on the page
    reset_forms: (brand_id) ->
      $("form.product_selector").each ->
        unless $(@).data('brand-id') == brand_id
          $(@).find("select option:selected").prop('selected', false)
      $("form#software-menu").each ->
        $(@).find("select option:selected").prop('selected', false)

    build_or_retrieve_panel: (product_id) =>
      unless @products.hasOwnProperty(product_id)
        @products[product_id] = new ProductPanel(@brand_id, product_id, @product_content_container)
      else
        @product_content_container.html( @products[product_id].panel )


  # Represents the panels for software
  class SoftwarePanel
    constructor: (@software) ->
      @panel = $("<div></div>")
      @build_panel()

    build_panel: =>
      @panel.append("<h4>#{ @software.name }</h4>")
      @panel.append("<p>Version: #{ @software.version }<br/>Platform: #{ @software.platform }</p>")
# Turns out, this is a URL to the API
#      @panel.append("<p><a href=' #{ @software.url }' target='_blank'>Software details</a></p>")
      @panel.append("<p><a href=' #{ @software.direct_download_url }' target='_blank' class='tiny radius button'>download</a></p>")


  # Represents the panels that are loaded for products
  class ProductPanel
    constructor: (@brand_id, @product_id, @product_content_container) ->
      @product_url = "/brands/#{ @brand_id }/products/#{ @product_id }.json"
      @panel = $("<div></div>")
      @build_panel()

    build_panel: =>
      $.getJSON @product_url, (data) =>
        @add_image(data) if data.images.length > 0
        @panel.append("<br/><h4>#{data.name}</h4><p>#{ data.brief }</p>" )
        @add_docs(data) if data.documents.length > 0
        @add_software(data) if data.software.length > 0
        @panel.append("<p><a href='#{ data.link }' target='_blank' class='tiny radius button'>more info...</a></p>")

        @product_content_container.html( @panel )

    add_image: (data) =>
      img = data.images[0].image
      @panel.append("<div class='text-center'><a href='#{ img.url }'><img src='#{ img.medium }'/></a></div>")

    add_docs: (data) =>
      doclist = $("<ul></ul>")
      $.each data.documents, (key, doc) ->
        doclist.append("<li><a href='#{ doc.document.url }' target='_blank'>#{ doc.document.name }</a></li>")
      @panel.append('<h5>Documentation</h5>')
      @panel.append( doclist )

    add_software: (data) =>
      software_list = $("<ul></ul>")
      $.each data.software, (key, s) ->
        software_list.append("<li><a href='#{ s.software.url }' target='_blank'>#{ s.software.name }</a></li>")
      @panel.append('<h5>Software</h5>')
      @panel.append( software_list )

  $("form.product_selector").each -> new BrandProductBox(@)
  $("form#software-menu").each -> new SoftwareBox(@)

