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

// $(fu




// ここからカリキュラムに沿った記述
$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="product[images_attributes][${index}][image]"
                    id="product_images_attributes_${index}_image">
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('#image-box').on('change', '.js-file', function(e) {
    // fileIndexの先頭の数字を使ってinputを作る
    $('#image-box').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $('#image-box').on('click', '.js-remove', function() {
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});
