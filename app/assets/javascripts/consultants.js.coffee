jQuery ($) ->

  # Overall software list loaded on page load...
  #$("ul.software_list").each ->
  #  $list = $(@)
  #  brand_id = $(@).data("brand-id")
  #  url = "/brands/#{ brand_id }/softwares.json"
  #  $.getJSON url, (data) ->
  #    console.log data.brands
  #    $.each data.brands, (key, software) ->
  #      $list.append $("<li><a href='#{ software.direct_download_url }'>#{ software.formatted_name }</a></li>")

  $product_content_container = $("div#product-content")
  $spinner = $("<div class='placeholder'><p><img src='#{ $product_content_container.data('loading') }' alt='loading'></p></div>")

  $("form.product_selector").each ->
    $select = $(@).find("select")
    brand_id = $(@).data("brand-id")
    url = "/brands/#{ brand_id }/products.json"

    $.getJSON url, (data) ->
      $.each data.products, (key, prod) ->
        $select.append $("<option value='#{prod.id}'>#{prod.name}</option>")
      $select.find("option.loading").html('Select A Product...')

    $select.change (e) ->
      product_id = $(@).val()
      product_url = "/brands/#{ brand_id }/products/#{ product_id }.json"
      $product_content_container.html( $spinner )

      $.getJSON product_url, (data) ->
        $panel = $("<div></div>")

        if data.images.length > 0
          img = data.images[0].image
          $panel.append("<div class='text-center'><a href='#{ img.original }'><img src='#{ img.medium }'/></a></div>")

        $panel.append("<h4>#{data.name}</h4><p>#{ data.brief }</p>" )

        if data.documents.length > 0
          $doclist = $("<ul></ul>")
          $.each data.documents, (key, doc) ->
            $doclist.append("<li><a href='#{ doc.document.url }' target='_blank'>#{ doc.document.name }</a></li>")
          $panel.append('<h5>Documentation</h5>')
          $panel.append( $doclist )

        if data.software.length > 0
          $software_list = $("<ul></ul>")
          $.each data.software, (key, s) ->
            $software_list.append("<li><a href='#{ s.software.url }' target='_blank'>#{ s.software.name }</a></li>")
          $panel.append('<h5>Software</h5>')
          $panel.append( $software_list )

        $panel.append("<p><a href='#{ data.link }' target='_blank' class='tiny radius button'>more info...</a></p>")
        $product_content_container.html( $panel )

