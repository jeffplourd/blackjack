###
this file creates a 'hand' collection and extends it by:
  making the Card class the standard for each model
  initializes a deck, isDealer and array key
  sets a 'hit' method that adds the first card in the Deck to the current hand collection
  sets a 'hasAce' method that reduces the collection to figure out if it has an ace
  sets a 'minScore' method that reduces the collection to figure out what the current score of the hand is
  sets a 'scores' method that returns an array of the current score, and if there is an ace, the current scores

###

class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) -> 
  
  hit: ->
    if @isDealer
      @hitDealer()
    else
      @add(@deck.pop())

  hitDealer: ->
    s1 = @scores()[0]
    s2 = @scores()[1]
    if (17 < s1 < 22) or (17 < s2 < 22)
      console.log('works')
    else
      if (17 > s1)
        @add(@deck.pop())
        @hitDealer()
  
  checkAceScore: ->
    console.log(@scores())
    s1 = @scores()[0]
    s2 = @scores()[1]
    if s2 > 21 then s1 else s2

  #make checkIfDone method
  checkIfDone: ->
    if @minScore() > 21
      return true
    else
      return false   

  resetHand: ->
    @reset()

  dealPlayerHand: ->
    @add(@deck.pop())
    @add(@deck.pop())

  dealDealerHand: ->
    @add(@deck.pop())
    @add(@deck.pop())
    @at(0).flip()

  showDealersHand: ->
    #flips over the dealers card
    @.at(0).flip() 

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]