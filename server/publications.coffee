Meteor.publish 'BTCCurrent', ->
  BTC.find {}, {sort: {"btc_usd.updated": -1}, limit: 1}
