# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

landing =
  init: ->
    # email validation
    $('form.email-upload').validate
      rules:
        email:
          required: true
          email: true
      invalidHandler: (event, v) ->
          $('input').val('')
      submitHandler: (form) ->
        console.log 'submit'
        $(form).submit
        # submit action
      highlight: (elem) ->
        $(elem).attr 'placeholder', "请输入正确的邮箱地址"
      errorPlacement: (err, elem) ->
        true

$(document).ready landing.init
$(document).on 'page:load', landing.init