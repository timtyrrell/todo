class Todo.Views.ItemsIndex extends Backbone.View
  el: '#app'
  template: JST['items/index']
  initialize: ->
    @collection.bind 'reset', @render, @
  render: ->
    $(@el).html(@template())
    @collection.each (item) =>
      view = new Todo.Views.Item model: item
      @$('#items').append(view.render().el)
    @
