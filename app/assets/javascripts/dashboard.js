// this function syntax allows it to run upon page load instead of before the page loads
$(function() {

if ($(".pubSurveyList .survey ").length === 0){
  $(".noPubSurveys").toggle();
} else {
  //do nothing
}

if ($(".savedSurveyList .survey ").length === 0){
  $(".noSavedSurveys").toggle();
} else {
  //do nothing
}

});
