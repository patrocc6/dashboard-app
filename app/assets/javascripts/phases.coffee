$(document).on "turbolinks:load", ->
  $('#phases').sortable
    axis: 'y'
    cursor: 'move'
    containment: 'parent'
    tolerance: 'pointer'
    handle: '.sort-handle'
    placeholder: 'sortable-placeholder'
    forcePlaceholderSize: true

  $('.tasks').sortable
    axis: 'y'
    cursor: 'move'
    containment: 'parent'
    tolerance: 'pointer'
    handle: '.sort-handle'
