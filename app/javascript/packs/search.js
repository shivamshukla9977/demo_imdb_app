//search ajax
$(document).ready(function() {
  $('#search').change(function() { 
      $.ajax({
         url: "<%= search_movies_path %>.js",
         data: {
             filter: $("#filter option:selected").text(),
             search: $("#search option:selected").text()
         },
         dataType: "js"
      });
  });
});