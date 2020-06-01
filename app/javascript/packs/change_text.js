// function text_change() {
//   var change = document.getElementByClassName("add_to_watchlist");
//   if (change.innerHTML == "Add To Watchlist") {
//     change.innerHTML = "Added To Watchlist";
//   } else {
//     change.innerHTML = "Add To Watchlist";

$(document).ready(function(){
  $('input[id^="tag"]').on('click', function() {
    //alert(this.id);
    $(this).prop('value', 'Added');
  });
});