# Rails Sprockets directives
#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers
#= require_tree ./collections

window.Roundabout =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  init: ->
    
    @map = @initMap()
    @search_view = new Roundabout.Views.Search(venues: @venues)
    @venues_view = new Roundabout.Views.Venues(venues: @venues)
    @venue_view = new Roundabout.Views.Venue()
    @markers_view = new Roundabout.Views.Markers(map: @map, venues: @venues)
    
    Backbone.history.start pushState: yes
    
  initMap: ->
    osmAttr = '&copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>'
    map = new L.Map 'map-canvas',
        center: new L.LatLng(51.525, -0.087)
        zoom: 13
        layers: new L.TileLayer('http://{s}.tiles.mapbox.com/v3/YOUR-MAPBOX-ID/{z}/{x}/{y}.png'
          attribution: osmAttr)
    return map

$ ->
  roundabout = $('#roundabout').height()
  search = $('#search-container').height()
  r = $('#right-panel').height()
  $('#venues-container').css('height', r - roundabout - search)

  $(window).resize ->
    roundabout = $('#roundabout').height()
    search = $('#search-container').height()
    r = $('#right-panel').height()
    $('#venues-container').css('height', r - roundabout - search)
  Roundabout.init()