
//indexのaccordionと同じだから、リファクタリングできないか？

$(window).on('load resize', function(){
  var winW = $(window).width();
  var devW = 1153;
 
  if (winW <= devW) {
    $('.accordion__head').nextAll().hide();
    jQuery('.accordion__head').click(function() {
      jQuery(this).nextAll().slideToggle();
      jQuery(this).children('.accordion__icon').toggleClass('is-open');
    });
  } 
});

//ページサイズ変更時、リロードする
var timer = 0;
var currentWidth = window.innerWidth;
$(window).resize(function(){
    if (currentWidth == window.innerWidth) {
        return;
    }
    if (timer > 0) {
        clearTimeout(timer);
    }

    timer = setTimeout(function () {
        location.reload();
    }, 200);

});

