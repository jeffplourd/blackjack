
assert = chai.assert

describe "deck constructor", ->

  it "should create a card collection", ->
    collection = new Deck()
    assert.strictEqual collection.length, 52

describe "cards", ->

  player = null
  dealer = null

  beforeEach ->
    deck = new Deck()
    player = deck.dealPlayer()
    dealer = deck.dealDealer()

  it "should add cards to player and not to dealer on hit", ->
    assert.strictEqual player.length, 2
    assert.strictEqual dealer.length, 2
    player.hit()
    assert.strictEqual player.length, 3
    assert.strictEqual dealer.length, 2