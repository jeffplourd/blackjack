
assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      # assert.strictEqual deck.last(), hand.hit()
      hand.hit()
      assert.strictEqual deck.length, 49
    it 'should add card on "hit"', ->
      assert.strictEqual hand.length, 2
      hand.hit()
      assert.strictEqual hand.length, 3

  describe 'deal', ->
    it 'should deal player two cards', ->
      assert.strictEqual hand.length, 2
    it 'should deal dealer two cards', ->
      assert.strictEqual deck.dealDealer().length, 2
      
