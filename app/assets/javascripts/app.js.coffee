window.app ||= {}

app.init = ->
  $(".js-search-autocomplete").each (i, el) ->
    $(el).closest("form").on 'submit', (e) ->
       e.preventDefault() if $(this).find("#search-input").val().length < 1
    google.maps.event.addDomListener window, 'load', $(el).autocomplete()


$(document).on "ready page:load", ->
  app.init()
