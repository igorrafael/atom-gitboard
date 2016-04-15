GitBoardView = require './gitboard-view'
view = null
tile = null

module.exports =
  config:
    extensions:
      title: 'Enabled file extensions'
      description: 'List of file extenstions which should not have this plugin
        enabled'
      type: 'array'
      default: ['md']
      items:
        type: 'string'
      order: 1

  activate: (state) ->
    view = new GitBoardView()

    atom.workspace.observeTextEditors (editor) ->
      editor.onDidChange -> view.updateCount editor
      editor.onDidChangeSelectionRange -> view.updateCount editor

    atom.workspace.onDidChangeActivePaneItem @showOrHide

    @showOrHide atom.workspace.getActivePaneItem()

  showOrHide: (item) ->
    extensions = (atom.config.get('gitboard.extensions') || [])
      .map (extension) -> extension.toLowerCase()
    currentFileExtension = item?.buffer?.file?.path.split('.').pop()
      .toLowerCase()

    isEditable =
      typeof item != 'undefined' and typeof item.displayBuffer != 'undefined'

    if currentFileExtension in extensions
      view.css("display", "inline-block")
      view.updateCount item
    else
      view.css("display", "none")

  consumeStatusBar: (statusBar) ->
    tile = statusBar.addRightTile(item: view, priority: 105)

  deactivate: ->
    tile?.destroy()
    tile = null
