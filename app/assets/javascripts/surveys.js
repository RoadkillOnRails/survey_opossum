
function options_display(parameter) {
  var select = document.getElementById("survey_questions_attributes_" + parameter + "_question_type_id")
  var value = select.options[select.selectedIndex].value;
  if (value > 2) {
    document.getElementById("options_" + parameter).style.display = 'block'
  }else {
    document.getElementById("options_" + parameter).style.display = 'none'
  }
}

function set_up_for_edit(){
  var divs = document.getElementsByTagName("div");
  for(var i = 0; i < divs.length; i++){
    if(/options_\d+/i.test(divs[i].id)) {
      options_display(divs[i].id.slice(-1));
    }
  }
}

$(function() {

var clickCount = 0;

  $('.add-question').click(function(){

    clickCount ++;//this number is unique ID

    $('.questions-container').append(


      '<div class = "short-answer">' +
        '<label for="survey_questions_attributes_0_order">Order</label>' +
        '<input type="number" value="2" name="survey[questions_attributes][0][order]" id="survey_questions_attributes_0_order" />' +

        '<label for="survey_questions_attributes_0_question_type_id">Question type</label>' +

        '<select name="survey[questions_attributes][0][question_type_id]" id="survey_questions_attributes_0_question_type_id">' +
          '<option value="1">Short</option>' +
          '<option value="2">Long</option>' +
          '<option selected="selected" value="3">YesNo</option>' +
        '</select>' +

        '<label for="survey_questions_attributes_0_question_text">Question text</label>' +
        '<input type="text" value="yes no quesiton" name="survey[questions_attributes][0][question_text]" id="survey_questions_attributes_0_question_text" />' +

        '<label for="survey_questions_attributes_0_required">Required</label>' +
        '<input name="survey[questions_attributes][0][required]" type="hidden" value="0" />' +
        '<input type="checkbox" value="1" name="survey[questions_attributes][0][required]" id="survey_questions_attributes_0_required" />' +

        '<input type="hidden" value="false" name="survey[questions_attributes][0][_destroy]" id="survey_questions_attributes_0__destroy" />' +

        '<a class="remove_nested_fields" data-association="questions" href="javascript:void(0)">Delete question</a>' +

      '</div>'

    )

  });
});
