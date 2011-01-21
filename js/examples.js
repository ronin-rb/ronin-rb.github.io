var Examples = {
  div: null,
  loop: null,

  maximum: 3,
  entries: null,

  next: function() {
    var indices = [];

    for (i=0;i<Examples.entries.length;i++)
    {
      indices.push(i);
    }

    Examples.div.fadeOut("slow",function() {
      Examples.div.empty();

      for (i=0;i<Examples.maximum && indices.length > 0;i++)
      {
        var index = Math.floor(Math.random()*indices.length);
        var example = Examples.entries[indices[index]];

        $('<li class="example">' + $(example).find('content').text() + '</li>').appendTo(Examples.div);

        indices.splice(index,1);
      }

      Examples.div.fadeIn("slow");
    });
  },

  start: function() { Examples.loop = setInterval(Examples.next,8000); },

  pause: function() {
    if (Examples.loop != null)
    {
      clearInterval(Examples.loop);
      Examples.loop = null;
    }
  },

  setup: function() {
    Examples.div = $("#examples");

    // download the examples feed
    $.ajax({
      type: 'GET',
      url: '/examples/atom.xml',
      dataType: 'xml',
      success: function(feed) {
        Examples.entries = $(feed).find('entry');

        // populate the examples div immediately
        Examples.next();

        // pause/start the examples on mousein/mouseout
        Examples.div.hover(Examples.pause,Examples.start);
        Examples.start();
      }
    });
  },
};

$(document).ready(Examples.setup);
