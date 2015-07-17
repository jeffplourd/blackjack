###
OBJECTIVES:
-make the game 'resolve' when 'you' go over 21 or the stand button is pressed
  -when the game 'resolves', flip the dealers card, show each players score, and label the winner
  -and, add a button to reset the game (easiest way would be to clear the board)

-refactor App.coffee to use internal 'game' model, which would also need to be created

TODO:
  -add a 'stand' function to 'Hand' collection

###


###
this file instantiates the AppView and instantiates and passes in the App model, then...
  appends the entire thing to the body.
###

new AppView(model: new App()).$el.appendTo 'body'
