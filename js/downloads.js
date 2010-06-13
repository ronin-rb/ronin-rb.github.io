$(document).ready(function() {
  $("td.download-version span").hide();

  $("#downloads tr").hover(
    function() {
      $("td.download-version span",$(this)).show();
    },

    function() {
      $("td.download-version span",$(this)).hide();
    }
  );
});
