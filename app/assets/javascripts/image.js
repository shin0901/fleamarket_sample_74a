// $(function(){
//   $('#image_image').change(function(e){
//     //ファイルオブジェクトを取得する
//     var file = e.target.files[0];
//     // 選択されたファイルを配列形式で取得
//     var reader = new FileReader();
//     //画像でない場合は処理終了
//     if(file.type.indexOf("image") > 2){
//       alert("10枚以下の画像添付になります");
//       return false;
//     }
//     //アップロードした画像を設定する
//     reader.onload = (function(file){
//       return function(){
//         blobUrl = URL.createObjectURL(file);
//         let html = `
//                     <img src="${blobUrl}" class="product_image">
//                    `;
//         $('.sell__container__images__drag-drop-box').after(html);
//       };
//     })(file);
//     reader.readAsDataURL(file);
//   });
// });

$(function(){
    //fileが選択された時に発火するイベント
  $('#product_images_attributes_0_image').change(function(e){
    //file_fieldを取得
    var file = e.target.files[0];
    //選択したfileのオブジェクトをpropで取得
    var file = $('input[type="file"]').prop('files')[0];
    //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
    var fileReader = new FileReader();
    //読み込みが完了すると、srcにfileのURLを格納
    fileReader.onloadend = function() {
      var src = fileReader.result
      var html= `<div class='item-image' data-image="${file.name}">
                  <div class=' item-image__content'>
                    <div class='item-image__content--icon'>
                      <img src=${src} width="114" height="80" >
                    </div>
                  </div>
                  <div class='item-image__operetion'>
                    <button class='item-image__operetion--delete'>削除</button>
                  </div>
                </div>`
      //image_box__container要素の前にhtmlを差し込む
      $('.sell__container__images__drag-drop-box').before(html);
    }
    fileReader.readAsDataURL(file);
  });
});

$(document).on("click", '.item-image__operetion--delete', function(){
  //プレビュー要素を取得
  var target_image = $(this).parent().parent()
  //プレビューを削除
  target_image.remove();  
})

