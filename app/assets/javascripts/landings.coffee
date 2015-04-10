# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

landing =
  emailStore: ''
  delay: (ms, func) ->
    setTimeout func, ms
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
          contentType: 'application/json'
          data: JSON.stringify(data)
          success: (res) ->
            landing.emailStore = res.email
            $('#afterSubmit').fadeIn();
            if (res.success is false)
              $('#afterSubmit div.row').empty().append('<h1 class="center-horizontal">已经保存了您的邮箱，无需再次提交</h1>')
              landing.delay 1000, -> location.reload()

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

    $('form.more-info.upload').submit (e) ->
      e.preventDefault()
      false
    .validate
      rules:
        company:
          required: true
        role:
          required: true
      invalidHandler: (event, v) ->

      submitHandler: (form) ->
        data = {}
        fields = $('form.more-info :input')
        data[fields[0].name] = fields[0].value
        data[fields[1].name] = fields[1].value
        data['email'] = landing.emailStore
        $.ajax
          type: 'POST'
          url: '/more-info'
          dataType: 'json'
          contentType: 'application/json'
          data: JSON.stringify(data)
          success: (res) ->
            if res.success is true
              $('#afterSubmit div.row').empty().append('<h1 class="center-horizontal">提交成功，现跳转回首页</h1>')
              landing.delay 1000, -> location.reload()
        false

      highlight: (elem) ->
        $elem = $(elem)
        $elem.val('')
        if 'email' is $elem.attr 'company'
          $elem.attr 'placeholder', '请输入您的公司名称'
        else
          $elem.attr 'placeholder', '请输入您的职位'
      errorPlacement: (err, elem) ->
        true

    $('#skipButton').click (e) ->
      $('#afterSubmit').fadeOut();

$(document).ready landing.init
$(document).on 'page:load', landing.init
