$(document).ready(function() {
  var session = $('<pre class="shell" />')
  
  $("a.section,a.subsection").each(function() {
    session.text(session.text() + "#\n# " + $(this).text() + "\n#\n");

    $("pre.shell",$(this).parent().next()).each(function() {
      session.text(session.text() + $(this).text() + "\n");
    });

    session.text(session.text() + "\n");
  });

  $("#content").append('<h1><a class="section" href="#session">Complete Shell Session</a></h1><div class="section_content" />');
  $("div.section_content:last").append(session);
});
