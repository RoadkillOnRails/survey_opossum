$(function options_display(index) {
  var value = "survey_questions_attributes_" + index + "_question_type_id"
  if (value > 2) {
    $("#options_").toggle();
  }
});
