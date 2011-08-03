# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#



address ="Martinistraße 43, Onsabrück, Germany"

load =
    map = new GMap2(document.getElementById("map"))
    map.addControl(new GSmallMapControl())
    geocoder = new GClientGeododer()
    geocoder.getLocations(address, addAddressToMap)
  

addAddressToMap = (response) ->
    place = response.Placemark[0]
    point = new GLatLng(place.Point.coordinates[1],place.Pint.coordinates[0])
    map.steCenter(point,15)
    marker = new GMarker(point)
    map.addOverlay(marker)
    marker.openInfoWindowHtml(place.address)




