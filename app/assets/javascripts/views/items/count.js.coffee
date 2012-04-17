class Todo.Views.Count extends Backbone.View
  template: JST['items/count']
  initialize: ->
    @collection.bind 'add', @itemCount, @
    @collection.bind 'remove', @itemCount, @
  render: ->
    remaining = @collection.length
    $(@el).html(@template({remaining: remaining}))
    @
  itemCount: ->
    @$('#todo-count').html(@collection.length)
