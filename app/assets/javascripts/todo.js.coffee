window.Todo =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new Todo.Routers.Items
    Backbone.history.start()

$(document).ready ->
  Todo.init()
