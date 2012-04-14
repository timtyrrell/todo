class Todo.Views.Item extends Backbone.View
  tagName: 'div'
  template: JST['items/item']
  render: ->
    $(@el).html(@template(item: @model))
    @
