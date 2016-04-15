{View} = require 'atom-space-pen-views'

_ = require 'underscore'

module.exports =
class GitboardStatusView extends View
  cssSelectedClass: 'gitboard-select'

  @content: ->
    @div class: 'gitboard inline-block'

  updateCount: (@editor) ->
    @isSelection = @editor.getSelectedText()
    @addOrRemoveSelectionClass()
    @selections = @editor.getSelections()

    [tasks, points] = @countPointsDocumentOrSelections()
    @text (points + ' task points in ' + tasks + ' tasks')

  addOrRemoveSelectionClass: ->
    if @isSelection
      @addClass @cssSelectedClass
    else
      @removeClass @cssSelectedClass

  countPoints: (text)->
    count = 0
    total = 0

    lines = text.match(/[^\r\n]+/g)
    taskRegex = /(\s*)[-+*]\s+(\[.*\])?\s*([\d.]+)\s(.*)/
    #TODO other regular expressions
    match = _.map lines, (l) -> taskRegex.exec l
    _.each match, (m) ->
      if m
        count += 1
        total += Number(m[3])

    [count, total]

  countPointsDocumentOrSelections: ->
    text =
      if @isSelection
        @editor.getSelectedText()
      else
        @editor.getText()
    @countPoints text
