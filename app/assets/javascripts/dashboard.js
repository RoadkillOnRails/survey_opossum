// this function syntax allows it to run upon page load instead of before the page loads
//this function shows and hides the 'no surveys' message in both dashboard sections
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
