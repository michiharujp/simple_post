$ ->
  $('.edit-action').click ->
    $(@).next('.edit-form').toggleClass('hidden')
    $(@).prev('.content').toggleClass('hidden')
