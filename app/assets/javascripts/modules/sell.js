$(document).on('turbolinks:load', function(){
    console.log("hoge")
  $('#product_price').on('keyup', function(){
    let input = $(this).val();
    if (input >= 300 && input <= 9999999){
      let commition = Math.floor(input * 0.1);
      let profit = input - commition;
      $('#commition_feild').html("¥" + commition.toLocaleString());
      $('#profit_feild').html("¥" + profit.toLocaleString());
    } else {
      let commition = '-';
      let profit = '-';
      $('#commition_feild').html(commition);
      $('#profit_feild').html(profit);
    }
  })
});