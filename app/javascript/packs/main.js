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

// -----
// skill-accordion
// -----

// function switchByWidth(){
//     if (window.matchMedia('(max-width: 767px)').matches) {
//         //スマホ処理
//     } else if (window.matchMedia('(min-width:768px)').matches) {
//         //PC処理
//     }
// }


$(function(){
    $(".accordion__head").on("click", function() {
    $(this).next().slideToggle();
    $(this).children('.accordion__icon').toggleClass('is-open');
    });
});

// -----
// scroll animation
// wow-puraguinn
// -----

window.wow.init();

// $(function () {

//   /*
//    * Slideshow
//    */
//   $('.slideshow').each(function () {

//   // 変数の準備
//   // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

//       var $container = $(this),                                 // a
//           $slideGroup = $container.find('.slideshow-slides'),   // b
//           $slides = $slideGroup.find('.slide'),                 // c
//           $nav = $container.find('.slideshow-nav'),             // d
//           $indicator = $container.find('.slideshow-indicator'), // e
//           // スライドショー内の各要素の jQuery オブジェクト
//           // a スライドショー全体のコンテナー
//           // b 全スライドのまとまり (スライドグループ)
//           // c 各スライド
//           // d ナビゲーション (Prev/Next)
//           // e インジケーター (ドット)

//           slideCount = $slides.length, // スライドの点数
//           indicatorHTML = '',          // インジケーターのコンテンツ
//           currentIndex = 0,            // 現在のスライドのインデックス
//           duration = 500,              // 次のスライドへのアニメーションの所要時間
//           easing = 'easeInOutExpo',    // 次のスライドへのアニメーションのイージングの種類
//           interval = 7500,             // 自動で次のスライドに移るまでの時間
//           timer;                       // タイマーの入れ物


//   // HTML 要素の配置、生成、挿入
//   // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

//       // 各スライドの位置を決定し、
//       // 対応するインジケーターのアンカーを生成
//       $slides.each(function (i) {
//           $(this).css({ left: 100 * i + '%' });
//           indicatorHTML += '<a href="#">' + (i + 1) + '</a>';
//       });

//       // インジケーターにコンテンツを挿入
//       $indicator.html(indicatorHTML);


//   // 関数の定義
//   // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

//       // 任意のスライドを表示する関数
//       function goToSlide (index) {
//           // スライドグループをターゲットの位置に合わせて移動
//           $slideGroup.animate({ left: - 100 * index + '%' }, duration, easing);
//           // 現在のスライドのインデックスを上書き
//           currentIndex = index;
//           // ナビゲーションとインジケーターの状態を更新
//           updateNav();
//       }

//       // スライドの状態に応じてナビゲーションとインジケーターを更新する関数
//       function updateNav () {
//           var $navPrev = $nav.find('.prev'), // Prev (戻る) リンク
//               $navNext = $nav.find('.next'); // Next (進む) リンク
//           // もし最初のスライドなら Prev ナビゲーションを無効に
//           if (currentIndex === 0) {
//               $navPrev.addClass('disabled');
//           } else {
//               $navPrev.removeClass('disabled');
//           }
//           // もし最後のスライドなら Next ナビゲーションを無効に
//           if (currentIndex === slideCount - 1) {
//               $navNext.addClass('disabled');
//           } else {
//               $navNext.removeClass('disabled');
//           }
//           // 現在のスライドのインジケーターを無効に
//           $indicator.find('a').removeClass('active')
//               .eq(currentIndex).addClass('active');
//       }

//       // タイマーを開始する関数
//       function startTimer () {
//           // 変数 interval で設定した時間が経過するごとに処理を実行
//           timer = setInterval(function () {
//               // 現在のスライドのインデックスに応じて次に表示するスライドの決定
//               // もし最後のスライドなら最初のスライドへ
//               var nextIndex = (currentIndex + 1) % slideCount;
//               goToSlide(nextIndex);
//           }, interval);
//       }

//       // タイマーを停止る関数
//       function stopTimer () {
//           clearInterval(timer);
//       }


//   // インベントの登録
//   // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

//       // ナビゲーションのリンクがクリックされたら該当するスライドを表示
//       $nav.on('click', 'a', function (event) {
//           event.preventDefault();
//           if ($(this).hasClass('prev')) {
//               goToSlide(currentIndex - 1);
//           } else {
//               goToSlide(currentIndex + 1);
//           }
//       });

//       // インジケーターのリンクがクリックされたら該当するスライドを表示
//       $indicator.on('click', 'a', function (event) {
//           event.preventDefault();
//           if (!$(this).hasClass('active')) {
//               goToSlide($(this).index());
//           }
//       });

//       // マウスが乗ったらタイマーを停止、はずれたら開始
//       $container.on({
//           mouseenter: stopTimer,
//           mouseleave: startTimer
//       });


//   // スライドショーの開始
//   // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

//       // 最初のスライドを表示
//       goToSlide(currentIndex);

//       // タイマーをスタート
//       startTimer();

//   });

// });

// function buildItems() {
//     switchItems.show();
//         switchItems.find(inputField).each(function(){
//           $(this).prop('disabled', false);
//         });
//         showAndAbleItems.hide();
//         showAndAbleItems.find(inputField).each(function(){
//           $(this).prop('disabled', true);
//         });
//   }

// $(function(){
//   $("#post_content_trix_input_post").addClass("switch_content");
// })

//フォームのタグによりフォームの出しわけ
$(function(){

    var switchBtn = $('input[type=radio]');
    var switchItems = $('.switchItems');
    var inputField = 'input, textarea';
  
    switchBtn.on('change', function(){
    
      var inputValue = $(this).val();
      //リッチエディタの無効化と有効かがうまくできていない！
    function buildItems() {
      switchItems.hide();
          switchItems.find(inputField).each(function(){
            $(this).prop('disabled', true);
          });
          showAndAbleItems.show();
          showAndAbleItems.find(inputField).each(function(){
            $(this).prop('disabled', false);
          });
    }

        function buildItems() {
      switchItems.hide();
          switchItems.find(inputField).each(function(){
            $(this).prop('disabled', false);
          });
          showAndAbleItems.show();
          showAndAbleItems.find(inputField).each(function(){
            $(this).prop('disabled', false);
          });
    }
    
      //  1 == スライダー
     if(inputValue === '1'){
       var showAndAbleItems = $('.switch_img, .switch_title, .switch_sb_title' );
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
        var showAndAbleItems = $('switch_img, .switch_name, .switch_og');
        buildItems();
      //  7 == 資格
      }else if(inputValue === '7'){ 
        var showAndAbleItems = $('switch_img, .switch_name, .switch_content, .switch_external_url' );
        buildItems();
      //  8 == 先生の紹介動画
      }else if(inputValue === '8'){ 
        var showAndAbleItems = $('.switch_movie_url' );
        buildItems();
      }
    });
  });
  
