$(function() {
  Payjp.setPublicKey(['PAYJP_PUBLIC_KEY']);
  $("#charge_form").on('click', function(e){
    e.preventDefault();
    var year = $("#ecp_year").val()
    var month = $("#exo_month").val()
    exp_year = String(year);
    exp_month = String(month);
    let crad = {
      number: $("#number").val(),
      cvc: $("#cvc"),
      exp_month: exp_month,
      exp_year: exp_year
    };
    Payjp.createToken(card, function(status, response){
      if (status === 200){
        $("#all-form").append(
          $('<input type="hidden name="payjp-token">').val(response.id)
        );
        $('#all-form').submit();
      } else {
        alert("カード情報が正しくありません");
      }
    });
  });
});