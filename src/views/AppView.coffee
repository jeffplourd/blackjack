###
creates an AppView view that
  sets a template function to return buttons for hit and stay and containers for the player and dealer
  sets event listeners for when the hit and stand buttons are clicked, and then grabs the player and calls the hit or stand method respectively
  initializes the view by rendering
  sets a render method that renders the template method and creates new hands for the player and dealer

###

class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': ->
      @model.get('playerHand').hit()
      #if checkIfDone is true, runShowresults
      if @model.get('playerHand').checkIfDone()
        @model.get('dealerHand').showDealersHand()
        #if the playerHand is greater than 21 then the dealer wins
        alert('dealer wins!')

        #clear the dealer and player's hands
        @model.get('playerHand').resetHand()
        @model.get('dealerHand').resetHand()

        #deal new cards to player and dealer
        @model.get('playerHand').dealPlayerHand()
        @model.get('dealerHand').dealDealerHand()


        #deal a new set of cards

    'click .stand-button': ->
      @model.get('dealerHand').showDealersHand()
      #while dealer's hand is less than 17, hit dealer. i should be able to do this as a Hand method
      @model.get('dealerHand').hit()

      #compare the value of each hand and assign and alert the winner
      if @model.get('playerHand').scores()[0] == @model.get('playerHand').scores()[1]
        p = @model.get('playerHand').scores()[0]
      else
        p = @model.get('playerHand').checkAceScore()

      if @model.get('dealerHand').scores()[0] == @model.get('dealerHand').scores()[1]
        d = @model.get('dealerHand').scores()[0]
      else
        d = @model.get('dealerHand').checkAceScore()

      if p >= d then alert('player wins!') else alert('dealer wins!')
      
      #clear the dealer and player's hands
      @model.get('playerHand').resetHand()
      @model.get('dealerHand').resetHand()

      #deal new cards to player and dealer
      @model.get('playerHand').dealPlayerHand()
      @model.get('dealerHand').dealDealerHand()

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

