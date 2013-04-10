class Roundabout.Views.Markers extends Backbone.View
    initialize: (options)-> 
      super 
      @venues = options.venues
      @map = options.map
      @initMarkers_leaflet()
      Backbone.Mediator.subscribe 'centerMap', @panTo

    initMarkers_leaflet: ->
      @markers = new L.MarkerClusterGroup(spiderfyOnMaxZoom: true)
      @venues.each (venue) =>
        lat = venue.get('lat')
        long = venue.get('long')
        if lat? and long?
          marker = new L.marker([lat, long])
          marker.on 'click',  =>
            @map.panTo(marker.getLatLng())
            Backbone.Mediator.publish 'markerClick', venue.toJSON()
          @markers.addLayer(marker);
        # else
        #   console.log "No address for #{venue.get('name')}"
      @map.addLayer(@markers);
      
      
    panTo: (coords) =>
      if coords and coords.lat and coords.long
        @map.panTo([coords.lat, coords.long])
        @map.setZoom(16)
      # else
      #   console.log "there's no address"