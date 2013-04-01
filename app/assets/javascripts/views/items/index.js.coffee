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

    container = document.createDocumentFragment()
    @collection.each (item) =>
      view = new Todo.Views.Item model: item
      container.appendChild(view.render().el)
    @$('#items').append(container)
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
