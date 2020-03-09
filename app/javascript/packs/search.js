//search ajax
$(document).ready(function() {
  console.log(“I log to the browser’s”);
  $('#search').change(function() { 
      $.ajax({
         url: "<%= search_movies_path %>",
         data: {
             filter: $("#filter option:selected").text(),
             search: $("#search option:selected").text()
         },
         dataType: "script"
      });
  });
});
