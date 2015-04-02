$(document).ready(function() {
	console.log($('form.email-upload'));
  return $('form.email-upload').validate({
    rules: {
      email: {
        required: true,
        email: true
      }
    },
    invalidHandler: function(event, v) {
      return $('input').val('');
    },
    submitHandler: function(form) {
      console.log('submit');
      return $(form).submit;
    },
    highlight: function(elem) {
      return $(elem).attr('placeholder', "请输入正确的邮箱地址");
    },
    errorPlacement: function(err, elem) {
      return true;
    }
  });
});
