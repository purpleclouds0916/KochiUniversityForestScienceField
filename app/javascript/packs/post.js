$(function(){

  var switchBtn = $('input[name=type]');
  var switchItems = $('.switchItems');
  var inputField = 'input, textarea';

  switchBtn.on('change', function(){
  
    var inputValue = $(this).val();
    
  function buildItems() {
    switchItems.show();
        switchItems.find(inputField).each(function(){
          $(this).prop('disabled', false);
        });
        hideAndDisabledItems.hide();
        hideAndDisabledItems.find(inputField).each(function(){
          $(this).prop('disabled', true);
        });
  }

    if(inputValue === 'スライダー'){
      var hideAndDisabledItems = $('.switch_movie, .switch_link, .switch_og');
      buildItems();
    }else if(inputValue === '森林を学ぶ価値'){
      var hideAndDisabledItems = $('.switch_movie, .switch_link, .switch_og, .switch_sb_title');
      buildItems();
    }else if(inputValue === '森林科学領域'){ 
      var hideAndDisabledItems = $('.switch_link, .switch_og, .switch_sb_title');
      buildItems();
    }else if(inputValue === '先生の紹介'){
      var hideAndDisabledItems = $('.switch_og');
      buildItems();
    }else if(inputValue === '授業の紹介'){ 
      var hideAndDisabledItems = $('.switch_link, .switch_og, .switch_sb_title');
      buildItems();
    }else if(inputValue === '卒業生の声'){
      var hideAndDisabledItems = $('.switch_movie, .switch_title');
      buildItems();
    }else if(inputValue === '資格'){ 
      var hideAndDisabledItems = $('.switch_og, .switch_sb_title, .switch_movie');
      buildItems();
    }
  });
});
