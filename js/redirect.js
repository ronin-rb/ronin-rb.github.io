var Redirect = {
  dest: null,

  to: function(url) {
    $(document).ready(function() {
      var text = $('<h2>Page Moved</h2> <p>This page has been moved to: <a href=""></a>.</p>');
      var link = $("a",text);

      link.attr({href: url});
      link.text(url);

      $("title").text("Page Moved");
      $("#content").append(text);

      Redirect.dest = url;
      setTimeout("document.location = Redirect.dest;", 2000);
    });
  }
};
