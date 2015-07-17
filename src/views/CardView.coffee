###
this file creates a 'card view' and:
  sets its model to a 'Card' model
  sets it template to use the underscore template function
  initializes the view to render upon instantiation
  sets a render method that returns html with the current cards 'rank' and 'suit'
###

class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<%= rankName %> of <%= suitName %>'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'

