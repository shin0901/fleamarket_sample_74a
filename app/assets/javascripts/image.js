$(function(){
  const buildFileField = (index)=> {
    const html = `
                <div class="js-file_group" data-index="${index}">
                  <input class="js-file" type="file" name="product[images_attributes][${index}][image]" id="product_images_attributes_${index}_image">
                </div>
                `;
    return html;
  }
  $('.file_fields').on('change', '.js-file', function(e){
    const file = e.target.files[0];
    const src = window.URL.createObjectURL(file);
    var html= `<div class='item-image' data-image="${file.name}">
                <div class='item-image__content'>
                  <div class='item-image__content--icon'>
                    <img src=${src} width="100" height="50" class='sell__preview-image'>
                  </div>
                </div>
                <button class='item-image__delete'>削除</button>
              </div>`
    //image_box__container要素の前にhtmlを差し込む
    $('.sell__container__images__drag-drop-box').before(html);
    const dataIndex = $(this).parent().data('index');
    const newFileField = buildFileField(dataIndex + 1);
    $('.file_fields').append(newFileField);
    // 削除ボタンを押すとプレビュー画像を削除
    $('.item-image').on("click", '.item-image__delete', function(){
      $(this).parent().remove();
    });
  });
  
  // 画像追加時に常に最新のファイル選択ボタンをクリックしたことにする
  $('.image-select-box__visible').on("click", function(){
    const fileField = $(`.js-file:last`);
    fileField.trigger('click');
  })

  $('#image-box').on("click", '.js-remove', function(){
    //画像1枚に対するindexの数字↓
    var target_image = $(this).parent().data('index')
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${target_image}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    //プレビューを削除
    $(this).parent().remove();
    $(`img[data-index="${target_image}"]`).remove();
    // target_image.remove();
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  })
});



