$(function(){
  $(document).on('turbolinks:load', function() {
  // プルダウンにカテゴリー名を表示しカテゴリーidをサーバーに送信する変数を定義
    function appendOption(category){
      var html = `<option value="${category.id}">${category.name}</option>`;
      return html;
    }
    // 子カテゴリーをプルダウンで表示させる変数を定義
    // 上記の内容をinsertHTMLに入れ、appendChildrenBox(insertHTML)の引数で上記のoptionタグを渡す
    function appendChildrenBox(insertHTML){
      var childSelectHtml = "";
      childSelectHtml = `<div class="category__child" id="children_wrapper">
      <select id="child__category" name="product[category_id]" class="select-box">
      <option value="">選択してください</option>
      ${insertHTML}
      </select>
      </div>`;
      // ブラウザに非同期で子セレクトボックスを表示させる
      $('.sell__container__details__category').append(childSelectHtml);
    }
    // 孫カテゴリーをプルダウンで表示させる変数を定義
    function appendGrandchildrenBox(insertHTML){
      var grandchildSelectHtml = "";
      grandchildSelectHtml = `<div class="category__child" id="grandchildren_wrapper">
                                <select id="grandchild__category" name="product[category_id]" class="select-box">
                                  <option value="">選択してください</option>
                                  ${insertHTML}
                                  </select>
                              </div>`;
    // ブラウザに非同期で孫セレクトボックスを表示させる
    $('.sell__container__details__category').append(grandchildSelectHtml);
  }

    // 親セレクトボックスでカテゴリーを選択した際にイベントが発火
    $('#product_category_id').on('change',function(){
      // 選択したカテゴリーのidを取得し変数定義
      var parentId = document.getElementById('product_category_id').value;
      if (parentId != ""){
        // 取得したカテゴリーのidをparent_idに入れ、JSON用のルートを通ってコントローラーへparent_idを渡し、子カテゴリーのレコードを取得
        $.ajax({
          url: '/products/get_category_children/',
          type: 'GET',
          data: { parent_id: parentId },
          dataType: 'json'
        })
        // 取得した子カテゴリーのレコードをforEachメソッドで展開
        .done(function(children){
          // 親セレクトボックスで再度別のカテゴリーが選択された場合、子、孫のセレクトボックスを消去
          $('#children_wrapper').remove();
          $('#grandchildren_wrapper').remove();
          var insertHTML = '';
          children.forEach(function(child){
            // 取得した子レコードを引数で渡し、optionタグにそれぞれidとname（カテゴリー名）をoptionタグに埋め込む
            insertHTML += appendOption(child);
          });
          appendChildrenBox(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#children_wrapper').remove();
        $('#grandchildren_wrapper').remove();
      }
    });
      
    $('.sell__container__details__category').on('change','#child__category',function(){
      var childId = document.getElementById('child__category').value;
      if(childId != "" && childId != 1 && childId != 213 && childId != 374 && childId != 521 && childId != 658 && childId != 841 && childId != 960
      && childId != 1058 && childId != 1176 && childId != 1237 && childId != 1304 && childId != 1449){
        $.ajax({
          url: '/products/get_category_grandchildren',
          type: 'GET',
          data: { child_id: childId },
          dataType: 'json'
        })
        .done(function(grandchildren){
          $('#grandchildren_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchildrenBox(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#grandchildren_wrapper').remove();
      }
    })
    // 商品編集時に親カテゴリが再選択されると子カテゴリ以下が消える
    $('.edit-parent').on('change',function(){
      $('.edit-child').remove();
      $('.edit-grandchild').remove();
    })
  });
});