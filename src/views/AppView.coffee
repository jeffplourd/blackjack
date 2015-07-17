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
        @model.get('playerHand').showResults()
        #this is returning the player's best score and saves it in 'p'
        p = `this.model.get('playerHand').scores().reduce(function(best,cur){if(Math.abs(21-best) < Math.abs(21-cur) && best < 22){return best;}else if(cur < 22){return cur;}else {return false}})`        
        #gets the dealers best score and saves it in 'd'
        d = `this.model.get('dealerHand').scores().reduce(function(best,cur){if(Math.abs(21-best) < Math.abs(21-cur)){return best;}else{return cur;}})`
        #if player's best score is greater than or equal to dealers best score
        if p >= d 
          #invoke alert with 'player wins'
          alert('player wins!')
        else
          #invoke alert with 'dealer wins'
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
      #copy logic from 'hit' button inside if statement
      #this is returning the player's best score and saves it in 'p'
      p = `this.model.get('playerHand').scores().reduce(function(best,cur){if(Math.abs(21-best) < Math.abs(21-cur) && best < 22){return best;}else if(cur < 22){return cur;}else {return false}})`        
      #gets the dealers best score and saves it in 'd'
      d = `this.model.get('dealerHand').scores().reduce(function(best,cur){if(Math.abs(21-best) < Math.abs(21-cur)){return best;}else{return cur;}})`
      #if player's best score is greater than or equal to dealers best score
      if p >= d 
        #invoke alert with 'player wins'
        alert('player wins!')
      else
        #invoke alert with 'dealer wins'
        alert('dealer wins!')

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

