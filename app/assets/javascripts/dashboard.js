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

$(".deleteModal").hide(); //hide modal by default

$(".deleteButton").click(function(){
  console.log("are you sure");//test eventhandler, there's an alert somewhere, need to find it and delete
  $(".deleteModal").show();//show the modal
});

$(".cancel-button").click(function(){
  $(".deleteModal").hide();
});

});
