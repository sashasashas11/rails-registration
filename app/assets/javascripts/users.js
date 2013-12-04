;(function($){
    var input = $("#user_email"),
        div = $("#email-validate"),
        massage_error = $("#email_massage_error"),
        date = {},
        massage = $("#email-validate span");

    input.on('change', function(e){
        date.email = $(e.target).val();
        if (/^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i.test(date.email)) {
            $.ajax({
                url: "/users/error",
                type: "POST",
                data: date,
                success: function(result){
                    console.log(result);
                    if (result == 'true') {
                        massage_error.text('This email is already registered');
                        div.addClass('has-error');
                        massage.removeClass('email-success');
                        massage.addClass('email-error');
                    }
                    else {
                        massage_error.text(' ');
                        div.removeClass('has-error');
                        massage.addClass('email-success');
                    }
                }
            });
        }
        else {
            div.addClass('has-error');
            massage.removeClass('email-success');
            massage.addClass('email-error');
            massage_error.text('email is not valid');
        }
    })
})(jQuery)