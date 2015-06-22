chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'grafana', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/grafana')(@robot)

  it 'registers a dashboard listener', ->
    expect(@robot.respond).to.have.been.calledWith(/(?:grafana|graph) (?:dash|dashboard|db) (.*)(| .*)/i)
