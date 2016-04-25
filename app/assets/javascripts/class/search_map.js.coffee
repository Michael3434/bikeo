class @SearchMap
  constructor: (@map) ->

  # This defines a class variable (SearchMap.scaleFactor)
  @scaleFactor: 0.4

  # https://developers.google.com/maps/documentation/javascript/reference#Icon
  @markerIcon:
    url: 'https://s3-eu-west-1.amazonaws.com/eventcorner/maps/assets/round-marker.png'
    size: new (google.maps.Size)(40 * @scaleFactor, 40 * @scaleFactor)
    scaledSize: new (google.maps.Size)(40 * @scaleFactor, 40 * @scaleFactor)
    anchor: new (google.maps.Point)(20 * @scaleFactor, 20 * @scaleFactor)

  @markerIconHover:
    url: 'https://s3-eu-west-1.amazonaws.com/eventcorner/maps/assets/round-marker-outline.png'
    size: new (google.maps.Size)(40 * @scaleFactor, 40 * @scaleFactor)
    scaledSize: new (google.maps.Size)(40 * @scaleFactor, 40 * @scaleFactor)
    anchor: new (google.maps.Point)(20 * @scaleFactor, 20 * @scaleFactor)

  @bigMarkerIcon:
    url: 'https://s3-eu-west-1.amazonaws.com/eventcorner/maps/assets/marker-hover-salmon.png'
    size: new (google.maps.Size)(60 * 0.4, 80 * 0.4)
    scaledSize: new (google.maps.Size)(60 * 0.4, 80 * 0.4)
    anchor: new (google.maps.Point)(30 * 0.4, 80 * 0.4)

  @buildMap: (startPoint) ->
    stylesArray = [
      {
        'featureType': 'landscape.man_made'
        'stylers': [ { 'visibility': 'off' } ]
      }
      {
        'featureType': 'road.highway'
        'elementType': 'labels'
        'stylers': [ { 'visibility': 'off' } ]
      }
      {
        'featureType': 'poi.business'
        'elementType': 'labels'
        'stylers': [ { 'visibility': 'off' } ]
      }
      {
        'featureType': 'poi.government'
        'stylers': [ { 'visibility': 'off' } ]
      }
      {
        'featureType': 'road.highway'
        'elementType': 'geometry.stroke'
        'stylers': [
          { 'visibility': 'on' }
          { 'weight': 0.1 }
        ]
      }
      {
        'featureType': 'poi.park'
        'elementType': 'labels'
        'stylers': [ { 'visibility': 'off' } ]
      }
      {
        'featureType': 'poi.place_of_worship'
        'elementType': 'labels'
        'stylers': [ { 'visibility': 'off' } ]
      }
      {
        'featureType': 'poi.school'
        'stylers': [ { 'visibility': 'off' } ]
      }
      {
        'featureType': 'poi.sports_complex'
        'stylers': [ { 'visibility': 'off' } ]
      }
      {
        'featureType': 'poi.attraction'
        'stylers': [ { 'visibility': 'off' } ]
      }
      {
        'featureType': 'transit.line'
        'stylers': [ { 'visibility': 'off' } ]
      }
      {
        'featureType': 'road.arterial'
        'elementType': 'labels'
        'stylers': [ { 'visibility': 'off' } ]
      }
    ]
    mapOptions =
      center: startPoint
      zoom: 10
      mapTypeId: google.maps.MapTypeId.ROADMAP
      disableDefaultUI: true
      scrollwheel: false
      zoomControl: true
      zoomControlOptions:
        style: google.maps.ZoomControlStyle.LARGE
        position: google.maps.ControlPosition.RIGHT_TOP
      maxZoom: 16
      mapTypeControl: false
      styles: stylesArray
    mapOptions

  @buildInfobox: ->
    infobox =
      pixelOffset: new (google.maps.Size)(-250 / 2, -238)
      infoBoxClearance: new (google.maps.Size)(10, 50)
      visible: true
      closeBoxURL: ''
      zIndex: 10000
    infobox
