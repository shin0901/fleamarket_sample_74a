$(function() {
  $("#charge_form").on('click', function(e){
    e.preventDefault();
    Payjp.setPublicKey('pk_test_d5c94052e666cd2eb373ba91');
    var year = $("#exp_year").val()
    var month = $("#exp_month").val()
    exp_year = String(year);
    exp_month= String(month);
    let card = {
      number: $("#card_number").val(),
      cvc: $("#security_code").val(),
      exp_month: $("#exp_month").val(),
      exp_year: $("#exp_year").val()
    };
    Payjp.createToken(card, function(status, response){
      if (status === 200) {
        $("#all-form").append(
          $('<input type="hidden" name="payjp-token">').val(response.id)
        );
        $('#all-form').submit();
      } else {
        alert("カード情報が正しくありません。");
      }
    });
  });
});