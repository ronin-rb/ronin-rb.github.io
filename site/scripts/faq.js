$(document).ready(function() {
  $("div.answer").hide();

  $("a.question").click(function() {
    $("div.answer",$(this).parent()).toggle();
  });
});
