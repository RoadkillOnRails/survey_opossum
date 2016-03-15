
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
    console.log(clickCount);

    $('.questions-container').append(


      '<div class = "short-answer">' +
        '<label for="survey_questions_attributes_' + clickCount + '_order">Order</label>' +
        '<input type="number" name="survey[questions_attributes][' + clickCount + '][order]" id="survey_questions_attributes_' + clickCount + '_order" /><br>' +

        '<label for="survey_questions_attributes_' + clickCount + '_question_type_id">Question type</label>' +
        '<select onchange="options_display(' + clickCount + ');" name="survey[questions_attributes][' + clickCount + '][question_type_id]" id="survey_questions_attributes_' + clickCount + '_question_type_id">' +
          '<option value="1">Short</option>' +
          '<option value="2">Long</option>' +
          '<option value="3">Radio</option>' +
          '<option value="4">DropDown</option>' +
        '</select><br>' +

        '<label for="survey_questions_attributes_' + clickCount + '_question_text">Question text</label>' +
        '<input type="text" name="survey[questions_attributes][' + clickCount + '][question_text]" id="survey_questions_attributes_' + clickCount + '_question_text" /><br>' +

        '<label for="survey_questions_attributes_' + clickCount + '_required">Required</label>' +
        '<input name="survey[questions_attributes][' + clickCount + '][required]" type="hidden" value="0" />' +
        '<input type="checkbox" value="1" name="survey[questions_attributes][' + clickCount + '][required]" id="survey_questions_attributes_' + clickCount + '_required" /><br>' +

        '<input type="hidden" value="false" name="survey[questions_attributes][' + clickCount + '][_destroy]" id="survey_questions_attributes_' + clickCount + '__destroy" />' +

        '<button type="button" class="remove-question">Delete question</button>' +

        '<div id="options_' + clickCount + '" class="question_options" style="display: none;">' +

          '<label for="survey_questions_attributes_' + clickCount + '_options_attributes_0_option">Option</label>' +
          '<input type="text" name="survey[questions_attributes][' + clickCount + '][options_attributes][0][option]" id="survey_questions_attributes_' + clickCount + '_options_attributes_0_option">' +
          '<label for="survey_questions_attributes_' + clickCount + '_options_attributes_0_value">Value</label>' +
          '<input type="text" name="survey[questions_attributes][' + clickCount + '][options_attributes][0][value]" id="survey_questions_attributes_' + clickCount + '_options_attributes_0_value">' +

          '<label for="survey_questions_attributes_' + clickCount + '_options_attributes_1_option">Option</label>' +
          '<input type="text" name="survey[questions_attributes][' + clickCount + '][options_attributes][1][option]" id="survey_questions_attributes_' + clickCount + '_options_attributes_1_option">' +
          '<label for="survey_questions_attributes_' + clickCount + '_options_attributes_1_value">Value</label>' +
          '<input type="text" name="survey[questions_attributes][' + clickCount + '][options_attributes][1][value]" id="survey_questions_attributes_' + clickCount + '_options_attributes_1_value">' +
        '</div>' +

      '</div>'

    )

  });
});

$(function() {

var optionsCount = 2;

  $('.add-option').click(function(){
    var index = $(this).attr("value");
    optionsCount ++;//this number is unique ID
    console.log(optionsCount);

    $('#options_container_' + index).append(
        '<div>' +
        '<label for="survey_questions_attributes_' + index + '_options_attributes_' + optionsCount + '_option">Option</label>' +
        '<input type="text" name="survey[questions_attributes][' + index + '][options_attributes][' + optionsCount + '][option]" id="survey_questions_attributes_' + index + '_options_attributes_' + optionsCount + '_option">' +
        '<label for="survey_questions_attributes_' + index + '_options_attributes_' + optionsCount + '_value">Value</label>' +
        '<input type="text" name="survey[questions_attributes][' + index + '][options_attributes][' + optionsCount + '][value]" id="survey_questions_attributes_' + index + '_options_attributes_' + optionsCount + '_value"><br>' +
        '</div>'
    )
  });
});
