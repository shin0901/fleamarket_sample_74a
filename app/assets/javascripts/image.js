
$(function(){

  const buildFileField = (index)=> {
    const html = `
                  <div class="js-file_group" data-index="${index}">
                    <input class="js-file" type="file" name="product[images_attributes][${index}][image]" id="product_images_attributes_${index}_image">
                 </div>
                `;
    return html;
  }

  $('#file_fields').on('change', '.js-file', function(e){
    const file = e.target.files[0];
    const src = window.URL.createObjectURL(file);
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
    $('.sell_container_images__drag-drop-box').before(html);
    const dataIndex = $(this).parent().data('index');
    const newFileField = buildFileField(dataIndex + 1);
    $(' #file_fields').append(newFileField);
  });

  $('.image-select-box__visible').on("click", function(){
    const fileField = $(`.js-file:last`);
    fileField.trigger('click');
  })
  
  $(document).on("click", '.item-image__operetion--delete', function(){
    //プレビュー要素を取得
    var target_image = $(this).parent().parent()
    //プレビューを削除
    target_image.remove();  
  })

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  // 最後の画像のindexを取得しlastIndexと定義
  lastIndex = $('.js-file_group:last').data('index');
  // indexの0番目からlastIndexまでを削除した配列を再生産
  fileIndex.splice(0, lastIndex);
  // チェックボックスを隠す
  // $('.hidden-destroy').hide();
  
  $('#file_fields').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    
    // 該当indexを持つimgタグがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('#previews').append(buildFileField(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#file_fields').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
  });
  
  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index')
    // 該当indexを振られているチェックボックスを取得する
    console.log(targetIndex)
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    console.log(hiddenCheck)
    // 削除ボタンの親要素をプレビューから削除
    $(this).parent().remove();
    // 削除ボタンを押された画像をプレビューから削除
    $(`img[data-index="${targetIndex}"]`).remove();
    
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });

});


