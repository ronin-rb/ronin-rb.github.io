$(document).ready(function() {
  var max_examples = 3;

  $.ajax({
    type: 'GET',
    url: '/examples/atom.xml',
    dataType: 'xml',
    success: function(feed) {
      var examples = $(feed).find('entry');
      var indices = [];

      for (i=0;i<examples.length;i++)
      {
        indices.push(i);
      }

      for (i=0;i<max_examples && indices.length > 0;i++)
      {
        var index = Math.floor(Math.random()*indices.length);
        var example = examples[indices[index]];

        $('<li class="example">' + $(example).find('content').text() + '</li>').appendTo("#examples");

        indices.splice(index,1);
      }
    }
  });
});
