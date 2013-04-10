class Roundabout.Views.Venue extends Backbone.View
    template: JST['app/templates/venue']
    el: '#venue-container'
    events:
      'click #no-address': 'showAddressForm'
      'submit #form-address': 'saveAddress'
    
    initialize: ->
      super
      Backbone.Mediator.subscribe 'markerClick', @showVenue
      Backbone.Mediator.subscribe 'nameClick', @showVenue
      $(window).resize =>
        @resize()
      @render()
    
    
    hideAddressForm: (model,response) ->
      $('#confirmation').show()
      $('#form-address').hide()
      $('#no-address').hide()
      
    saveAddress: (event) ->
      event.preventDefault()
      address =  $('#form-address #address').val()
      thing = new Roundabout.Models.Thing()
      thing.save {tag: 'address', key: @venue.id, data: address}
        success: @hideAddressForm
    
    showAddressForm: ->
      $('#form-address').toggle()
    
    resize: ->
      roundabout = $('#roundabout').height()
      search = $('#search-container').height()
      r = $('#right-panel').height()
      @$el.css('height', r - roundabout - search)
      
      
    # Note. venue is not a Backbone Model. venue is a JSON
    showVenue: (venue) =>
      @venue = venue
      @$el.html(@template(venue: @venue))
      @resize()
      $('#slider').animate({'margin-left': '0px'}, 'fast');
      @$el.animate({ scrollTop: 0 }, 'fast');
      
      $('#searchbox').hide()
      
    render: ->
      @$el.html(@template(venue: null))
      @
      
