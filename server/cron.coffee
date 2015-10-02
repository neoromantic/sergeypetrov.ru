Meteor.startup ->

  requestBTC = ->
    try
      ticker = EJSON.parse(HTTP.get("https://btc-e.com/api/3/ticker/btc_usd-btc_rur").content)
      BTC.insert ticker
    catch err
      console.log err
    finally
      Meteor.setTimeout requestBTC, 1000*5

  requestBTC()

  Meteor.setInterval ->
    BTC.remove({"btc_usd.updated": {$lt: (new Date()).getTime()/1000 - 60*60*24}})
  , 1000*60*60
