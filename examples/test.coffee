Shodan = require '../index'
should = require 'should'

api = new Shodan 'o2J4sPGDw8yDCbaiFKRtpcCzA63gnguQ'

api.info (err, res) ->
  should.not.exist err
  should.exist res

api.search 'wrt54g city:Phoenix', (err, res) ->
  should.not.exist err
  should.exist res
  should.exist res.matches[0].ip
  console.log res

api.locations 'wrt54g', (err, res) ->
  should.not.exist err
  should.exist res
  should.exist res.countries
  should.exist res.cities

api.host '216.197.103.72', (err, res) ->
  should.not.exist err
  should.exist res
  should.exist res.data
  should.exist res.data[0].port

api.fingerprint 'OpenSSH', (err, res) ->
  should.not.exist err
  should.exist res
  # TODO: Better test value

api.wps.locate '00:1D:7E:F0:A2:B0', (err, res) ->
  should.not.exist err
  should.exist res
  should.exist res.location
  should.exist res.location.address
  #res.location.address.city.should.equal 'Portland'

api.exploits.search 'microsoft', (err, res) ->
  should.not.exist err
  should.exist res
  console.log res

api.msf.search 'microsoft', (err, res) ->
  should.not.exist err
  should.exist res
  console.log res