jQuery(document).ready(function($) {
  $(".tabs a").click(function(event) {
    event.preventDefault();
    $(this).parent().addClass("active");
    $(this).parent().siblings().removeClass("active");
    var tab = $(this).attr("href");
    $(".tab-content").not(tab).css("display", "none");
    $(tab).fadeIn(200);
  });
});
