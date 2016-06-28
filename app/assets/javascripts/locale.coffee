jQuery ($) ->

  $("select#locale-switcher").change ->
    window.location  = "/?locale=#{ $(@).val() }"

