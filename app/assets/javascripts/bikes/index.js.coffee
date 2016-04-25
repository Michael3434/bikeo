$(document).on "ready page:load", ->
  app.bikes.index.init()

app.bikes ||= {}
app.bikes.index ||= {}
app.bikes.index =
  init: ->
    console.log("In index init")
    app.bikes.map.init()
