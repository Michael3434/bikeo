app.bikes ||= {}
app.bikes.map =
  init: ->
    console.log "Bikes Map Init"
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

    # Fetch lat-lng attributes for all bikes in the listing and
    # Keep markers in memory
    $(".bike-item").each (index) ->
      lat = $(this).data("lat")
      lng = $(this).data("lng")
      bike_id = $(this).data("bike-id")
      bike_title = $(this).data("bike-title")
      latlng = new google.maps.LatLng(lat, lng)
      marker = new google.maps.Marker {
        position: latlng
        map: map
        icon: markerIcon
      }
      marker.metadata =
        "bike_id": bike_id
        "bike_name": bike_title
      markers.push(marker)

    if (fitBounds)
      # Extend map bounds to fit markers, object used to determine map region
      bounds = new google.maps.LatLngBounds()
      $.each markers, (i,value) ->
        bounds.extend(markers[i].getPosition())
      map.panTo(bounds.getCenter())
      map.fitBounds(bounds)

    @listenForClickOnMarkers(map, markers, markerIcon, markerIconHover)
    @listenForHoverOnMarkers(map, markers, markerIcon, markerIconHover)

  # When a marker is clicked, reproduce a minified version of the listing item
  # in the infobox on the map
  listenForClickOnMarkers: (map, markers, markerIcon, markerIconHover) ->
    infobox = @infobox
    # Attach event listener on markers
    $.each markers, (i, value) ->
      marker = markers[i]
      id = marker.metadata.bike_id
      name = marker.metadata.bike_name

      google.maps.event.addListener marker, 'click', (e) ->
        # Clone bike partial and reproduce it in infobox
        infobox.setContent($("#bike_"+id).clone().addClass("bike-infobox")[0])
        infobox.setPosition(marker.position)
        # infobox.setPixelOffset(new google.maps.Size(10, 50))
        infobox.open(map, this)
        # map.panTo(marker.position)
      # Close infobox on map click
      google.maps.event.addListener map, "click", (e) ->
        infobox.close()

  listenForHoverOnMarkers: (map, markers, markerIcon, markerIconHover) ->
    @maxZIndex = google.maps.Marker.MAX_ZINDEX
    maxZIndex = @maxZIndex
    $.each markers, (i, value) ->
      marker = markers[i]
      google.maps.event.addListener marker, 'mouseover', ->
        maxZIndex++
        @setZIndex(maxZIndex)
        @setIcon(markerIconHover)
      google.maps.event.addListener marker, 'mouseout', ->
        @setIcon(markerIcon)

  hoverInBikeItem: (bikeId) ->
    markerIconHover = SearchMap.bigMarkerIcon
    maxZIndex = @maxZIndex
    if (@markers)
      $.each @markers, (i) ->
        if (@metadata.bike_id == bikeId)
          maxZIndex++
          @setZIndex(maxZIndex)
          @setIcon(markerIconHover)
          # Break the loop
          return false
  hoverOutBikeItem: (bikeId) ->
    markerIcon = SearchMap.markerIcon
    if (@markers)
      $.each @markers, (i) ->
        if (@metadata.bike_id == bikeId)
          @setIcon(markerIcon)
          # Break the loop
          return false






