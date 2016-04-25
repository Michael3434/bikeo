app.bikes ||= {}
app.bikes.map =
  init: ->
    @initMap()
    @addMarkers(true)
  initMap: ->
    canvas = document.getElementById("map")
    # Make sure canvas is empty, this will drop existing map and
    $(canvas).empty()

    position = new google.maps.LatLng(48.859734, 2.336088)
    @map = new google.maps.Map(canvas, SearchMap.buildMap(position))
    @searchMap = new SearchMap(@map)

    # Initialize the infobox
    @infobox = new InfoBox(SearchMap.buildInfobox())
    # Initialize markers
    @markers = []

  # Remove all markers from memory and redraw them from listing
  refreshMarkers: (fitBounds = true) ->
    @removeMarkers()
    @addMarkers(true)

  # Detach markers from map and remove them from memory
  removeMarkers: ->
    $.each @markers, (i, value) ->
      @setMap(null)
    @markers = []

  addMarkers: (fitBounds) ->
    map = @map
    markers = @markers
    markerIcon = SearchMap.markerIcon
    markerIconHover = SearchMap.markerIconHover

    # Fetch lat-lng attributes for all venues in the listing and
    # Keep markers in memory
    $(".bikes-item").each (index) ->
      debugger
