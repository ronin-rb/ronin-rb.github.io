$(document).ready(function() {
  $("td.download-name span.version").hide();

  $("#downloads tr").hover(
    function() {
      $("span.version",$(this)).show();
    },

    function() {
      $("span.version",$(this)).hide();
    }
  );
});
