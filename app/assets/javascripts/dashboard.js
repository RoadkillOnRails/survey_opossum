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

$(".deleteModal").hide(); //hide modals by default

$(".deleteButton").click(function(){
  // clickedID is assigned the ID of the clicked survey
  var clickedID = $(this).siblings("input").attr("value");
  console.log(clickedID);
  $(this).siblings(".deleteModal").show();
  console.log($(this).siblings(".deleteModal").children("input").attr("value"));
});

$(".cancel-button").click(function(){
  $(".deleteModal").hide();
});

});
