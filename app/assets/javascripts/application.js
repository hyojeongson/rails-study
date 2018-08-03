//= require rails-ujs
//= require activestorage
//= require jquery
//= require jquery-ui

// user image 이미지파일 업로드 미리보기
$(function() {
  $("#uploadImage").unbind("change").on("change", function()
  {
    var files = !!this.files ? this.files : [];
    if (/^image/.test( files[0].type)){
      var reader = new FileReader();

      reader.readAsDataURL(files[0]);
      reader.onloadend = function(e){
        $("#imagePreview").attr("src", e.target.result);
      }
    }
  });
});

// post cover 이미지파일 업로드 미리보기
$(function() {
  $("#coverUploadImage").on("change", function()
  {
    var isCover = $('#is-cover').length;
    if (isCover > 0) {
     $('#is-cover').remove()
   }
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

// post-item DOM 추가하기
$(function () {
  var postItemCount = $('.post-item').length;
  if (postItemCount > 1) {
    $('.post-item:last').eq(0).remove();
  }
  $('.add-post-item').on('click', function () {
    var newId = $('.post-item').length;
    var postItem = $('.post-item:last').eq(0).clone(true);
    postItem.find('.image-preview').css('background-image', 'none');
    postItem.find('[name^="post[post_items_attributes]"]').each(function () {
      $(this).attr('name', $(this).attr('name').replace(/\d+/, newId));
      $(this).val("");
    });
    postItem.insertAfter($('.post-item').last());
  })
});

// post-item DOM 삭제하기
$(function () {
  $('.post_item_delete').unbind().on('click', function (e) {
    var removePostItem = $(this).parent();
    removePostItem.toggleClass('hidden_post_item');
    $('.post-item').each(function (index) {
      $(this).find('[name^="post[post_items_attributes]"]').each(function () {
        $(this).attr('name', $(this).attr('name').replace(/\d+/, index))
      })
    })
  })
});

// post-item 이미지파일 업로드 미리보기
$(function() {
  $(".uploadPostItemImage").unbind().on("change", function()
  {
    var self = this;
    var files = !!this.files ? this.files : [];
    if (/^image/.test( files[0].type)){
      var reader = new FileReader();
      reader.readAsDataURL(files[0]);

      reader.onload = function(e){
        $(self).parents('.post-item').find('.image-preview')
          .attr("src", e.target.result);
      }
    }
  });
});

// 위치 바꾸기
$(function() {
  $( "#sortable" ).sortable({
    revert: true,
  });
  $("#sortable").on("sortstop", function (event, ui) {
    $('.post-item').each(function (index) {
      $(this).find('[name^="post[post_items_attributes]"]').each(function () {
        $(this).attr('name', $(this).attr('name').replace(/\d+/, index))
      })
    })
  });
  $( "#sortable" ).disableSelection();
});

// notification 알림
$(function() {
  $(".notice").delay(2000).fadeOut("slow");
});
