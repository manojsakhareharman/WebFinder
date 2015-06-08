jQuery ($) ->

  $(".infographic").hover(
    -> $(@).attr('src', $(@).data('hover'))
    -> $(@).attr('src', $(@).data('original'))
  )
