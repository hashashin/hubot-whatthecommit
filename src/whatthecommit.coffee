# Description
#   whatthecommit.com scrapes for Hubot
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
#   nickfletcher

cheerio = require 'cheerio'

module.exports = (robot) ->
  robot.respond /commit\?/i, (msg) ->
    robot.http("http://whatthecommit.com")
      .get() (err, res, body) ->
        $ = cheerio.load(body)
        commit = $('#content p').first().text()

        msg.send commit
