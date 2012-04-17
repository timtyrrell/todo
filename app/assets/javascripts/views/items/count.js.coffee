class Todo.Views.Count extends Backbone.View
  el: '#footer'
  template: JST['items/count']
  initialize: ->
    @collection.bind 'all', @render, @
  render: ->
    remaining = @collection.length
    $(@el).html(@template({remaining: remaining}))
    @
