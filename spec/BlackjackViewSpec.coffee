assert = chai.assert
expect = chai.expect

describe "BlackjackView", ->

  app = null

  beforeEach ->
    app = new AppView(model: new App())

  it "expects app to be a view", ->
    expect(app).to.be.a('object')
