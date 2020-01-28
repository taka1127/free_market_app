$(function(){

  var inputForm = document.getElementById("token_submit");
  inputForm.addEventListener('click', function(e){  // 追加するボタンが押されたらイベント発火
    console.log(1)
    e.preventDefault();  // ボタンを一旦無効化
    Payjp.setPublicKey("pk_test_0d5e9e81d2537186181eeef0");
    var card = {  // 入力されたカード情報を取得
      number: document.getElementById("card_number").value,
      exp_month: document.getElementById("exp_month").value,
      exp_year: document.getElementById("exp_year").value,
      cvc: document.getElementById("cvc").value
    };
    console.log(card)
    
    if (card.number == "", card.exp_month == "1", card.exp_year == "2020", card.cvc == "") {
      alert("カード情報が入力されていません。"); // 送られた値がデフォルト値だった場合
    } else { // デフォルト値以外の値が送られてきた場合
      Payjp.createToken(card, function(status, response) {  // トークンを生成
        console.log(response)
        if (status === 200) {
          console.log(1)
          $("#card_number").removeAttr("name");
          $("#exp_month").removeAttr("name");
          $("#exp_year").removeAttr("name"); 
          $("#cvc").removeAttr("name");
          $("#charge-form").append(
            $('<input type="hidden" name="payjp-token">').val(response.id)
          ); 
          console.log(response)
          // var token = response.id;
          // $("#charge-form").append('<input type="hidden" name="payjp-token" class="payjp-token" value=${token} />')
          $("#charge-form").get(0).submit();
          // inputForm.submit();  // 生成したトークンを送信する準備を整える
          alert("登録が完了しました");
        } else {
          alert("正しいカード情報を入力してください。");
        }
      });
    }
    false
  });
});