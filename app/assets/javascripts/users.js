;(function($){
    var input = $("#user_email"),
        massage_error = "<div class='text-danger'>Email is not valid</div>",
        div = $("#email-validate")
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
                        div.addClass('has-error');
                        massage.removeClass('email-success');
                        massage.addClass('email-error');
                    }
                    else {
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
            div.prepend(massage_error);
        }
    })
})(jQuery)