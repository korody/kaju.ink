jQuery.fn.bindFileUploader = ->
  $(@).fileupload
    dataType: 'script'
    add: (e, data) ->
      data.context = $(tmpl("template-upload", data.files[0]))
      $('.progress-container').append data.context
      data.submit()
    progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.bar').css('width', progress + '%')
    done: (e, data) ->
      data.context.remove()
$ ->
  $('#thumbnail_thumb, #attachment_image').bindFileUploader() if $('#thumbnail_thumb, #attachment_image')

$(document).on 'page:load', ->
  $('#thumbnail_thumb, #attachment_image').bindFileUploader() if $('#thumbnail_thumb, #attachment_image')