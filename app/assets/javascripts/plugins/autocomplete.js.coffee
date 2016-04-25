$.fn.autocomplete = () ->
  self = $(this)
  input = $(this).find('#search_locality').get(0) # get the DOM object in the jQuery collection at index 0
  console.log input
  options =
    types: [ '(regions)' ]
    componentRestrictions: country: 'fr'

  autocomplete = new google.maps.places.Autocomplete(input, options)
  google.maps.event.addListener autocomplete, 'place_changed', ->
    place = autocomplete.getPlace()
    $('#search_locality').closest("form").submit()
