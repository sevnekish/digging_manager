import { Loader } from 'google-maps';

$(function(){
  const $mapContainer = $('#ticket-map')

  const initMap = (apiKey, defaultCenter, polygonCoords) => {
    const loader = new Loader(apiKey, {})

    loader.load().then(function (google) {
      const map = new google.maps.Map($mapContainer[0], {
        center: defaultCenter,
        zoom: 5
      })

      const preparedPolygonCoords = $.map(polygonCoords, function(coordinatesArrays) {
        return { lng: coordinatesArrays[0], lat: coordinatesArrays[1] }
      })

      const polygon = new google.maps.Polygon({
        paths: preparedPolygonCoords,
        strokeColor: '#FF0000',
        strokeOpacity: 0.8,
        strokeWeight: 2,
        fillColor: '#FF0000',
        fillOpacity: 0.35
      })
      polygon.setMap(map)

      let bounds = new google.maps.LatLngBounds();

      polygon.getPath().forEach(function (path, index) {
          bounds.extend(path)
      })

      map.fitBounds(bounds)
    })
  }

  if ($mapContainer.length) {
    const apiKey = $mapContainer.data('apiKey')
    const defaultCenter = $mapContainer.data('defaultCenter')
    const polygonCoords = $mapContainer.data('polygonCoordinates')

    initMap(apiKey, defaultCenter, polygonCoords)
  }
})
