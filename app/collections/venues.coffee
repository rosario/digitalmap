class Roundabout.Collections.Venues extends Backbone.Collection
    model: Roundabout.Models.Venue
    url: '/venues/index.json'
    
    initialize: ->
      super
      
    # Simple search feature with regexp
    search: (letters) ->
      if letters == ""
        return null

      pattern = new RegExp(letters,"gi")
      @filter (data) ->
        pattern.test( data.get("name"))
