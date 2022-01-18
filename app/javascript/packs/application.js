// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery_ujs
//= require jquery
//= require rails-ujs

import Rails from "@rails/ujs";
// import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
// Turbolinks.start()
ActiveStorage.start();

require("jquery");

$(function(){
    let $window = $(window),
        $load = $('#load_animation'),
        $load_in = $load.find('img');

    //ロゴとLoadingGIFをフェードイン
    $load_in.delay(500).fadeIn('slow');

    //ウィンドウに対してloadイベントを設定
    //全ての要素をロードが終わったら，HideLoadingScreen()を実行する
    $(document).on('turbolinks:load', function() {
        HideLoadingScreen();
    })
    
    //５秒後に強制的にHideLoadingScreen()を実行
    setTimeout(function(){
        HideLoadingScreen();
    },5000);

    //ロード画面を非表示にする関数
    function HideLoadingScreen(){
        $load.delay(1500).fadeOut("slow");
    }
}); 


