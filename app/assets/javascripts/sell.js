$(function(){
  // 価格を入力すると手数料と利益が表示
  $('#product_price').on('keyup', function(){
    let input = $(this).val();
    if (input >= 300 && input <= 9999999){
      let commition = Math.floor(input * 0.1);
      let profit = input - commition;
      $('#commition_field').html("¥" + commition.toLocaleString());
      $('#profit_field').html("¥" + profit.toLocaleString());
    } else {
      $('#commition_field').html('ー');
      $('#profit_field').html('ー');
    }
  })

  // 商品の説明入力フォームの文字数カウント
  $('#product_description').keyup(function(){
    var count = $(this).val().length;
    $('.show-counter').text(count);
  });
});