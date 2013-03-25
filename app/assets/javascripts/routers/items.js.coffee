class Todo.Routers.Items extends Backbone.Router
  routes:
    '' : 'index'
  index: ->
    items = new Todo.Collections.Items
    new Todo.Views.ItemsIndex collection: items
    items.fetch(reset: true)
