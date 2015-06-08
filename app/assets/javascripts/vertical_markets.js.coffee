jQuery ($) ->

  $("img.infographic").each ->
    i = $(@)
    hover_image = new Image
    hover_image.src = i.data 'hover'
    original_src = i.attr 'src'
    i.hover(
      -> i.attr 'src', hover_image.src
      -> i.attr 'src', original_src
    )
