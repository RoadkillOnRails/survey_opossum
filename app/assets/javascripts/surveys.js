$(function() {

var clickCount = 0;

  $('.add-question').click(function(){

    clickCount ++;//this number is unique ID
    console.log(clickCount);

    $('.questions-container').append(


      '<div class = "short-answer">' +
        '<label for="survey_questions_attributes_' + clickCount + '_order">Order</label>' +
        '<input type="number" value="2" name="survey[questions_attributes]['+clickCount+'][order]" id="survey_questions_attributes_'+clickCount+'_order" />' +

        '<label for="survey_questions_attributes_' + clickCount + '_question_type_id">Question type</label>' +

        '<select name="survey[questions_attributes]['+clickCount+'][question_type_id]" id="survey_questions_attributes_'+clickCount+'_question_type_id">' +
          '<option value="1">Short</option>' +
          '<option value="2">Long</option>' +
          '<option selected="selected" value="3">YesNo</option>' +
        '</select>' +

        '<label for="survey_questions_attributes_'+clickCount+'_question_text">Question text</label>' +
        '<input type="text" value="yes no quesiton" name="survey[questions_attributes]['+clickCount+'][question_text]" id="survey_questions_attributes_'+clickCount+'_question_text" />' +

        '<label for="survey_questions_attributes_'+clickCount+'_required">Required</label>' +
        '<input name="survey[questions_attributes]['+clickCount+'][required]" type="hidden" value="'+clickCount+'" />' +
        '<input type="checkbox" value="1" name="survey[questions_attributes]['+clickCount+'][required]" id="survey_questions_attributes_'+clickCount+'_required" />' +

        '<input type="hidden" value="false" name="survey[questions_attributes] [' + clickCount + '][_destroy]" id="survey_questions_attributes_'+clickCount+'__destroy" />' +

        '<a class="remove_nested_fields" data-association="questions" href="javascript:void('+clickCount+')">Delete question</a>' +

      '</div>'

    )

  });

});
