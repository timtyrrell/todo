class Todo.Views.ItemsIndex extends Backbone.View
  el: '#app'
  template: JST['items/index']
  events:
    'keypress #add-item' : 'createOnEnter'
  initialize: ->
    @listenTo @collection, 'reset', @render
    @listenTo @collection, 'add', @addItem
  render: ->
    $(@el).html(@template())

    countView = new Todo.Views.Count collection: @collection
    countView.render()

    @collection.each (item) =>
      view = new Todo.Views.Item model: item
      @$('#items').append(view.render().el)
    @
  createOnEnter: (event) ->
    return if event.keyCode != 13
    @collection.create
      name: @$('#add-item').val()
    @$('#add-item').val('')
  addItem: (item) ->
    view = new Todo.Views.Item model: item
    @$('#items').append(view.render().el)
    @
