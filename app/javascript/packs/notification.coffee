# Run this example by adding <%= javascript_pack_tag 'hello_coffee' %> to the head of your layout file,
# like app/views/layouts/application.html.erb.

$(document).on 'ready turbolinks:change turbolinks:load', ->
  if (window.location.pathname == '/notifications')
    console.log("Update was success!!")
    $.ajax '/notifications/read_all',
      type: 'PUT'
      beforeSend: (jqXHR, settings) ->
        jqXHR.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
      success: (data, textStatus, jqXHR) ->
        