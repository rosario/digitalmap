class Roundabout.Views.Venues extends Backbone.View
    template: JST['app/templates/venues']
    el: '#venues-container'
    className: 'venues'
    events:
      'click .venues li': 'showInfo'
    
    initialize: (options)->
      super
      @venues = options.venues
      Backbone.Mediator.subscribe 'refresh', @refresh
      Backbone.Mediator.subscribe 'renderList', @renderList
      @render()
    
    showInfo: (event) ->
      venue = $(event.currentTarget).data()
      Backbone.Mediator.publish 'nameClick', venue
      Backbone.Mediator.publish 'centerMap', venue
    
    refresh: (venues) =>
      @$el.html(@template(venues: venues.toJSON()))
      @
    
    renderList: =>
      console.log 'render list'
      @$el.html(@template(venues: @venues.toJSON()))
      @
      
    render: ->
      @$el.html(@template(venues: @venues.toJSON()))
      @
