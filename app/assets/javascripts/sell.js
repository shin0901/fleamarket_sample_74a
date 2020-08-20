$(function(){
  $('#product_price').on('keyup', function(){
    let input = $(this).val();
    if (input >= 300 && input <= 9999999){
      let commition = Math.floor(input * 0.1);
      let profit = input - commition;
      $('#commition_field').html("¥" + commition.toLocaleString());
      $('#profit_field').html("¥" + profit.toLocaleString());
    } else {
      $('#commition_feild').html('-');
      $('#profit_feild').html('-');
    }
  })
});