# Description
#   whatthecommit.com scrapes for hubot
#
# Configuration:
#   none
#
# Dependencies:
#   "cheerio": "~0.16.0"
#
# Commands:
#   commit? - returns a random commit message from whatthecommit.com
#
# Author:
#   Nick Fletcher [@nickfletchr]

cheerio = require 'cheerio'

module.exports = (robot) ->
  robot.hear /(commit\?)$/i, (msg) ->
    robot.http("http://whatthecommit.com")
      .get() (err, res, body) ->
        $ = cheerio.load(body)
        scrape = $('#content p').first().text()

        msg.send scrape
