$(document).ready(function() {
  $("div.answer").hide();

  $("div.question > a").click(function() {
    $("div.answer",$(this).parent().parent()).toggle();
  });
});
