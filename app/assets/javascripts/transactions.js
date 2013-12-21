$(function(){
    $("input.amount").numeric({ decimal : ".",  negative : false, scale: 3 });

    var  form = $("form"),
         debit = $("#transaction_debit"),
         credit = $("#transaction_credit"),
         massage = $("#error_messenger"),
         amount = $('#transaction_amount'),
         buttonClose = $(".modal-header button"),
         transaction= $('.debit').first().parent(),
         transactionList = transaction.parent();

    form.on('change', function(){
        if (debit.val() == credit.val()) {
            massage.addClass('text-danger').text('credit and debit can not be the equal');
        }
        else {
            massage.text('');
        }

    });

    form.submit(function(event){
         if (amount.val() == ""){
             massage.addClass('text-danger').text('amount can not be blank');
             return false;
         }
        if (debit.val() == credit.val()) {
            massage.addClass('text-danger').text('credit and debit can not be the equal');
            return false;
        }

        $.ajax({
            url: this.action,
            type: this.method,
            data: $(this).serialize(),
            dataType: 'json',
            success: addTransaction,
            error: showResponse
        });
        return false;
    });

    transactionList.on('click', '.remove', function(event){
        var link = event.currentTarget;
        console.log(event.target.nodeName);

        $.ajax({
            url: link.href,
            type: 'delete',
            dataType: 'json',
            success: removeTransaction,
            error: showResponse
        });
        return false;
    });



    function removeTransaction(id) {
        var transaction;
        transaction = getTransaction(id);
        transaction.remove();
    }

    function addTransaction(date) {
        var newTransaction, host, a;
        buttonClose.click();
        newTransaction = transaction.clone();
        newTransaction.attr("data-id",date.id);
        newTransaction.find(".debit").text(date.debit);
        newTransaction.find(".credit").text(date.credit);
        newTransaction.find(".amount").text(date.amount + ' $');
        newTransaction.find(".remove")[0].href = '/transactions/'+date.id

        return newTransaction.appendTo(transactionList);
    }

    /**
     * @param id
     * @returns {jQuery}
     */
    function getTransaction(id){
        return transactionList.find('[data-id="'+ id +'"]')
    }

    /**
     * @param {XMLHttpRequest} response
     */
    function showResponse(response){
        alert(response.responseText);
    }

})