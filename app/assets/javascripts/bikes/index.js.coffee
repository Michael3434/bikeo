$(document).on "ready page:load", ->
  app.bikes.index.init()

app.bikes ||= {}
app.bikes.index ||= {}
app.bikes.index =
  init: ->
    console.log("Bikes Index Init")
    app.bikes.map.init()

    # Show pin on map when hover on venue item in listing
    $(".bikes-wrapper").on "mouseenter", ".bike-item", ->
      app.bikes.map.hoverInBikeItem($(this).data("bike-id"))
    $(".bikes-wrapper").on "mouseleave", ".bike-item", ->
      app.bikes.map.hoverOutBikeItem($(this).data("bike-id"))
