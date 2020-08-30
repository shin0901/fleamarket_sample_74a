
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

});


