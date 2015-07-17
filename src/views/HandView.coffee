###
this file creates a view for the players hand that
  sets the data equal to the 'hand' collection (includes hand values and methods)
  sets the template to return the html for either the dealer or player and the score next to the card
  initializes a listener for an add remove or change event and to render on event, also to render on instantiation
  sets a render method that returns the current html
###

class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change reset', =>
      @render()

    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').text @collection.scores()[0]

