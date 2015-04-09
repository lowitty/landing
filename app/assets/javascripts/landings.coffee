# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

landing =
  init: ->
    # email validation
    $('form.sign-up.upload').submit (e) ->
      e.preventDefault()
      false
    .validate
      rules:
        email:
          required: true
          email: true
        question:
          required: true
      invalidHandler: (event, v) ->

      submitHandler: (form) ->
        data = {}
        fields = $('form.sign-up :input')
        data[fields[0].name] = fields[0].value
        data[fields[1].name] = fields[1].value
        console.log(data);
        $.ajax
          type: 'POST'
          url: '/info-upload'
          dataType: 'json'
          data: JSON.stringify(data)
          success: () ->
            $('#afterSubmit').fadeIn();
        false

      highlight: (elem) ->
        $elem = $(elem)
        $elem.val('')
        if 'email' is $elem.attr 'name'
          $elem.attr 'placeholder', '请输入正确的邮箱地址'
        else
          $elem.attr 'placeholder', '请输入您的问题'
      errorPlacement: (err, elem) ->
        true

    #$('.sign-up.upload .submit-button').click (e) ->
    #  e.stopPropagation()
    #  e.preventDefault()
    #  $('#afterSubmit').fadeIn();

    #$('#afterSubmit .submit-button').click (e) ->
    #  e.stopPropagation()
    #  e.preventDefault()
    #  $('#afterSubmit').fadeOut();

    $('#skipButton').click (e) ->
      $('#afterSubmit').fadeOut();

$(document).ready landing.init
$(document).on 'page:load', landing.init
