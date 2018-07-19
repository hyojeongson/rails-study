// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery

// user image 이미지파일 업로드 미리보기
$(function() {
  $("#uploadImage").on("change", function()
  {
    var files = !!this.files ? this.files : [];
    if (!files.length || !window.FileReader) return;
    if (/^image/.test( files[0].type)){
      var reader = new FileReader();
      reader.readAsDataURL(files[0]);

      reader.onloadend = function(){
        $("#imagePreview").css("background-image", "url("+this.result+")");
      }
    }
  });
});

// post cover 이미지파일 업로드 미리보기
$(function() {
  $("#coverUploadImage").on("change", function()
  {
    var files = !!this.files ? this.files : [];
    if (!files.length || !window.FileReader) return;
    if (/^image/.test( files[0].type)){
      var reader = new FileReader();
      reader.readAsDataURL(files[0]);

      reader.onloadend = function(){
        $("#coverImagePreview").css("background-image", "url("+this.result+")");
      }
    }
  });
});

// post-item 이미지파일 업로드 미리보기
$(function() {
  $("#uploadPostItemImage").on("change", function()
  {
    var files = !!this.files ? this.files : [];
    if (!files.length || !window.FileReader) return;
    if (/^image/.test( files[0].type)){
      var reader = new FileReader();
      reader.readAsDataURL(files[0]);

      reader.onloadend = function(){
        $("#postItemImagePreview").css("background-image", "url("+this.result+")");
      }
    }
  });
});

// notification popup
$(function() {
  $(".notice").delay(2000).fadeOut("slow");
});
