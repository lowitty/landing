# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

util =
  delay: (ms, func) ->
    setTimeout func, ms
  loop: (ms, func) ->
    setInterval func, ms
landing =
  emailStore: ''
  init: ->
    pushingEffect.init()
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
        $('input[name="email"]').val('')
      submitHandler: (form) ->
        data = {}
        fields = $('form.sign-up :input')
        data[fields[0].name] = fields[0].value
        data[fields[1].name] = fields[1].value
        $('#waiting').fadeIn()
        requestRefresh = util.delay 5000, ->
          $('#waiting h1').text('网络不给力噢，刷新页面试试吧')
        $.ajax
          type: 'POST'
          url: '/info-upload'
          dataType: 'json'
          contentType: 'application/json'
          data: JSON.stringify(data)
          success: (res) ->
            landing.emailStore = res.email
            $('#waiting').fadeOut()
            clearTimeout(requestRefresh)
            if (res.success is false)
              $('#alreadySubmitted').fadeIn()
              util.delay 3000, -> $('#alreadySubmitted').fadeOut()
            else
              $('#afterSubmit').fadeIn()
        false

      highlight: (elem) ->
        $elem = $(elem)
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
              $('#thanks').fadeIn()
              util.delay 3000, ->
                $('#thanks').fadeOut()
                $('#afterSubmit').fadeOut()
                $('form.sign-up.upload')[0].reset()
                $('form.more-info.upload')[0].reset()
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
      $('form.sign-up.upload')[0].reset()
      $('#afterSubmit').fadeOut()


pushingEffect =
  loopId: null
  wordIndex: 0
  init: ->
    clearInterval @loopId if @loopId isnt null
    @loopId = util.loop 3000, =>
      $words = $('span.push-wrapper b')
      $words.eq(@wordIndex).attr('class', 'is-hidden')
      ++@wordIndex
      @wordIndex %= 5
      $words.eq(@wordIndex).attr('class', 'is-visible')


$(document).ready landing.init
$(document).on 'page:load', landing.init
