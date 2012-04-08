request = require 'request'

req = (opt, cb) ->
  request opt, (err, res, body) ->
    return cb err if err?
    return cb new Error 'No response' unless body?
    body = JSON.parse body
    return cb new Error body.error if body.error?
    return cb null, body

class Shodan
  constructor: (@key) ->

  raw: (api, qs={}, cb) ->
    qs.key ?= @key
    opt =
      uri: "#{@baseurl}/api/#{api}"
      qs: qs
    req opt, cb

  baseurl: 'http://www.shodanhq.com'

  info: (cb) -> @raw 'info', null, cb
  search: (query, page, cb) ->
    if page and not cb
      cb = page
      page = undefined
    @raw 'search', {q: query, page: page}, cb
  host: (ip, cb) -> @raw 'host', {ip: ip}, cb
  fingerprint: (banner, cb) -> @raw 'fingerprint', {banner: banner}, cb
  locations: (query, cb) -> @raw 'locations', {q: query}, cb

  wps:
    locate: (mac, cb) ->
      data =
        version: '1.1.0'
        request_address: true
        wifi_towers: [
          mac_address: mac
          ssid: 'g'
          signal_strength: -72
        ]
      opt =
        uri: 'http://www.google.com/loc/json'
        method: 'POST'
        body: JSON.stringify data

      req opt, cb

  exploits:
    search: (query..., cb) ->
      obj = query[1] or {}
      obj.q = query[0]
      @raw 'exploitdb/search', obj, cb

    download: (id, cb) -> @raw 'exploitdb/download', {id: id}, cb

  msf:
    search: (query..., cb) ->
      obj = query[1] or {}
      obj.q = query[0]
      @raw 'msf/search', obj, cb

    download: (id, cb) -> @raw 'msf/download', {id: id}, cb

module.exports = Shodan
