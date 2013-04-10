class Roundabout.Views.Search extends Backbone.View
    template: JST['app/templates/search']
    el: '#search-container'
    
    events:
      'click #back': 'showList'
      'keyup #searchVenue' : 'search'
    
    
    initialize: (options)->
      super
      Backbone.Mediator.subscribe 'markerClick', @hideSearch
      Backbone.Mediator.subscribe 'nameClick', @hideSearch
      @venues = options.venues
      @render()

    hideSearch: ->
      $('#searchbox').hide()
      $('#back').show()

      
    showList: ->
      $('#back').hide()
      $('#searchbox').show()
      $('#slider').animate({'margin-left': '-250px'}, 'fast')

    search: (event) ->
      letters = $("#searchVenue").val();
      list = @venues.search(letters)
      
      # Clean up old results and memory
      @filtered_venues.reset()  if @filtered_venues 
        
      if list instanceof Array
        @filtered_venues = new Roundabout.Collections.Venues(list)
        Backbone.Mediator.publish 'refresh', @filtered_venues
      else
        Backbone.Mediator.publish 'renderList'
      
      
    render: ->
      @$el.html(@template())
      @
