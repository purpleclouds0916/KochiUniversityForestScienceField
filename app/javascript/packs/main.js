// -----
// slider
// -----

var mySwiper = new Swiper('.swiper-container', {
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  },
  loop: true,
  pagination: {
    el: '.swiper-pagination',
    type: 'bullets',
    clickable: true,
  },
  autoplay: {
   delay: 6000,
   disableOnInteraction: true
 },
 speed: 1500,
 
});

// -----
// Drawer
// -----

$(function(){
    $(".js-drawer").on("click", function(e) {
        e.preventDefault();
        let targetClass = jQuery(this).attr("data-target");
        jQuery("." + targetClass).toggleClass("is-checked");
        return false;
      });
});
 
// -----
// move-page-top
// -----

var syncerTimeout = null ;

$(function() {
	$(window).scroll( function() {
		if(syncerTimeout == null)	{
			syncerTimeout = setTimeout( function() {
				var element = $('#page-top');
				var visible = element.is(':visible');
				var now = $(window).scrollTop();
				var under = $('body').height() - ( now + $(window).height());
				if(now > 80 && 200 < under)	{
					if(!visible) {
						element.fadeIn('slow');
					}
				}
			} ,1000);
		}
	});

	$('#move-page-top').click(
		function() {
			$('html,body').animate({scrollTop:0}, 'slow');
		}
	);
});

$(function(){
    $(".accordion__head").on("click", function() {
    $(this).next().slideToggle();
    $(this).children('.accordion__icon').toggleClass('is-open');
    });
});

// -----
// wow-puraguinn
// -----

window.wow.init();

 //以下管理者画面のjs
 // -----
// 投稿タグとフォームの出しわけ
// -----
$(function(){

    var switchBtn = $('input[type=radio]');
    var switchItems = $('.switchItems');
    var inputField = 'input, textarea';
    //リッチエディタを使用した場合の無効化と有効かがうまくできていない！
    // var inputField = 'input, textarea, trix_area';

   function hideItems() {
    switchItems.hide();
          switchItems.find(inputField).each(function(){
            $(this).prop('disabled', true);
          });
   }

   //最初は非表示にする&入力必須
    hideItems();
    $('#post_tag_ids_1').prop('required', true);

    switchBtn.on('change', function(){
    
      var inputValue = $(this).val();
    function buildItems() {
      hideItems()
          showAndAbleItems.show();
          showAndAbleItems.find(inputField).each(function(){
            $(this).prop('disabled', false);
          });
    }
    
      //  1 == スライダー
     if(inputValue === '1'){
       var showAndAbleItems = $('.switch_img, .switch_title, .switch_lead' );
       buildItems();
       //  2 == 森林を学ぶ価値
     }else if(inputValue === '2'){
       var showAndAbleItems = $('.switch_img, .switch_title, .switch_content, .switch_external_url');
        buildItems();
       //  3 == 森林科学領域
      }else if(inputValue === '3'){ 
        var showAndAbleItems = $('.switch_img, .switch_content, .switch_movie_url');
        buildItems();
       //  4 == 先生の紹介
      }else if(inputValue === '4'){
        var showAndAbleItems = $('.switch_img, .switch_name, .switch_content, .switch_job, .switch_teacher_url');
        buildItems();
      //  5 == 授業の紹介
      }else if(inputValue === '5'){ 
        var showAndAbleItems = $('.switch_img, .switch_content, .switch_movie_url');
        buildItems();
      //  6 == 卒業生の声
      }else if(inputValue === '6'){
        var showAndAbleItems = $('.switch_img, .switch_name, .switch_og');
        buildItems();
      //  7 == 資格
      }else if(inputValue === '7'){ 
        var showAndAbleItems = $('.switch_img, .switch_name, .switch_content, .switch_external_url' );
        buildItems();
      //  8 == 先生の紹介動画
      }else if(inputValue === '8'){ 
        var showAndAbleItems = $('.switch_movie_url' );
        buildItems();
      }
    });
  });

  $(function(){
    
   

  });  

    //画面サイズの変更でリロードして、デザインが崩れるのを防止
    $(function(){
      var timer = false;
      $(window).resize(function() {
        if (timer !== false) {
        clearTimeout(timer);
        }
        timer = setTimeout(function() {
        //リロードする
        location.reload();
        }, 200);
      });
    });