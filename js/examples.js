/*
 * Controls displaying Examples on the front page.
 */
var Examples = {
  // maximum number of examples to show
  maximum: 3,

  // loop to control cycling of examples
  loop: null,

  /*
   * Hides the visible examples and displays the hidden examples.
   */
  show: function() {
    var visible = $("li.example:visible");
    var invisible = $("li.example:hidden");

    var indices = [];

    for (i=0;i<invisible.size();i++)
    {
      indices.push(i);
    }

    visible.hide();

    for (i=0;i<Examples.maximum && indices.length > 0;i++)
    {
      var index = Math.floor(Math.random()*indices.length);

      $(invisible[indices[index]]).fadeIn(1400);
      indices.splice(index,1);
    }
  },

  /*
   * Starts cycling the Examples.
   */
  start: function() { Examples.loop = setInterval(Examples.show,10000); },

  /*
   * Pauses the cycling of Examples.
   */
  pause: function() {
    if (Examples.loop != null)
    {
      clearInterval(Examples.loop);
      Examples.loop = null;
    }
  },

  /*
   * Sets up the Examples.
   */
  setup: function() {
    var list = $("#examples");

    // download the examples feed
    $.ajax({
      type: 'GET',
      url: '/examples/atom.xml',
      dataType: 'xml',
      success: function(feed) {
        $(feed).find("entry > content").each(function() {
          var entry = $('<li class="example" />');
          
          entry.html($(this).text());
          entry.hide();
          
          list.append(entry);
        });

        // show examples immediately
        Examples.show();

        // pause/start the examples on mousein/mouseout
        list.hover(Examples.pause,Examples.start);

        // begin cycling examples
        Examples.start();
      }
    });
  },
};

$(document).ready(Examples.setup);
