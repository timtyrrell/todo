class Todo.Views.Item extends Backbone.View
  template: JST['items/item']
  events:
    'click a.remove-item' : 'removeItem'
  initialize: ->
    @model.bind 'destroy', @remove, @
  render: ->
    $(@el).html(@template(item: @model))
    @
  removeItem: ->
    @model.destroy()
