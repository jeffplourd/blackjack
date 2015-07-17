###

this file defines a 'Deck' collection that:
  sets each model to the 'Card' model
  initializes a collection of 'Card' models in a random order
  sets a 'dealPlayer' method that instantiates a new 'Hand' collection and provides it with two cards
  sets a 'dealDealer' method that instantiates a new 'Hand' collection and provides it
  with two cards, with the first being flipped.

###
class window.Deck extends Backbone.Collection
  model: Card

  initialize: ->
    @add _([0...52]).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)

  dealPlayer: -> new Hand [@pop(), @pop()], @

  dealDealer: -> new Hand [@pop().flip(), @pop()], @, true

