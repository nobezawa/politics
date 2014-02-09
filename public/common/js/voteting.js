var $ = jQuery;

$(function(){

  $("#machingSubmit").hide();

  //質問選択
  $('.vote-btn').click(function(){
	$(this).siblings().removeClass('check');
	$(this).addClass('check');
	var flag_id = $(this).attr('id').match("[0-9]+");
	var code = $(this).attr('id').substr(0,4);
  var ans_content = $(this).attr('class').match("[0-9]+");
  console.log(ans_content);
	var answer;

	$('#ans' + flag_id[0]).attr("value", ans_content);
	$('#ans_questionID' + flag_id[0]).attr("value", flag_id);

	
	if (code === 'ye-a') {
	    answer = '賛成';
	} else if(code === 'ye-b'){
	    answer = 'やや賛成';
	} else if(code === 'ne-c'){
	    answer = '中立';
	} else if(code === 'no-b'){
	    answer = 'やや反対';
	} else if(code === 'no-a'){
	    answer = '反対';
	}
	$('.answerText' + flag_id[0]).text(answer);
	$('.answerText' + flag_id[0]).addClass('btn');
  });
  

 
  //選択し直した政策の番号を格納するグローバル変数
  var selectNumber;
  //政策選択
  $('.btnImportant').click(function(){
      var cnt = $('.btnImportant.selected').length;     
      if(!($(this).hasClass('selected')) && cnt < 3){
        $(this).addClass('selected'); 
        var id = $(this).attr('id').match("[0-9]+");
        $('#maching_policy' + id).prop('checked', true);
        $('#maching_policy' + id).addClass('check');
        cnt++;
    
      } else{
        $(this).removeClass('selected');
        var id = $(this).attr('id').match("[0-9]+");
        $('#maching_policy' + id).prop('checked', false);
        $('#maching_policy' + id).removeClass('check');
        cnt--;

      }

      if (cnt >= 3) {
          $('.answerImportant').text('3つ選択されました!');
          $('.importantCheck.check').each(function(i){
             $(this).attr('name', 'maching[policy' + (i+1) + ']');  
          });
          confirm();
      } else{
          $('#maching_policy' + id).attr('name', 'maching[policy]');  
          $('.answerImportant').text('');
          $("#machingSubmit").hide();
      }
  });



  function confirm(){
    var cnt = $('body .question').length;
    var clickCount = $('body .btn').length;
    if(cnt == clickCount && $('.btnImportant.selected').length == 3){
      $('.completeText').text('全部選択されました!送信ボタンを押してください。');
      $("#machingSubmit").show();
    }else if($('.btnImportant.selected').length == 3){
      $('.completeText').text('全ての質問の回答がされてません。');
      $("#machingSubmit").hide();
    }else{
      $('.completeText').text('');
    }
  }


  $('.vote-btn').click(function(){
    if($('.btnImportant.selected').length == 3) {
      confirm();
    }
  });


});




