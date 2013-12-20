$(function(){
    $("input.amount").numeric({ decimal : ".",  negative : false, scale: 3 });

    var  form = $("form"),
         debit = $("select#transaction_debit"),
         credit = $("select#transaction_credit"),
         massage = $("#error_messenger"),
         amount = $('#transaction_amount')

    form.on('change', function(){
        if (debit.val() == credit.val()) {
            massage.addClass('text-danger').text('credit and debit can not be the equal');
        }
        else {
            massage.text('');
        }

    });

    form.submit(function(){
         if (amount.val() == ""){
             massage.addClass('text-danger').text('amount can not be blank');
             return false;
         }
        if (debit.val() == credit.val()) {
            massage.addClass('text-danger').text('credit and debit can not be the equal');
            return false;
        }
    })
})