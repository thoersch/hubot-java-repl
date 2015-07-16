# Description
#   Hubot reads, evaluates, prints and makes you loop java expressions
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#   hubot hello - <what the respond trigger does>
#   orly - <what the hear trigger does>
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   Tyler Hoersch <thoersch@gmail.com>

module.exports = (robot) ->
  robot.respond /(java) (me)? (.*)/i, (msg) ->
    expression = urlFormEncode(msg.match[3])
    create_url = "http://www.javarepl.com/create"
    execute_url = "http://www.javarepl.com/execute"
    msg.http(create_url)
      .header("Content-Type", "application/x-www-form-urlencoded")
      .post("") (err, res, body) ->
        if err
          msg.reply "RUH ROH! Errors!", inspect(err)
          return

        jsonBody = JSON.parse(body)
        id = jsonBody.id
        data = "id=#{id}&expression=#{expression}"
        msg.http(execute_url)
          .header("Content-Type", "application/x-www-form-urlencoded")
          .post(data) (err, res, body) ->
            if err
              msg.reply "RUH ROH! Errors!", inspect(err)
              return

            jsonBody = JSON.parse(body)
            msg.send jsonBody.logs[0].message
            
urlFormEncode = (str) ->
  escape(str)
    .replace(new RegExp('\\+','g'),'%2B')
    .replace(new RegExp('%20','g'),'+')