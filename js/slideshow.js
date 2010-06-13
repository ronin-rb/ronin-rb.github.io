var currentSlide;
var allSlides;
var enableNotes;
var showSlides;

function showNotes()
{
  if (enableNotes)
  {
    $("#slideshow_notes").fadeIn("slow");
  }
  else
  {
    $("#slideshow_notes").fadeOut("slow");
  }
}

function showSlide(index)
{
  if (index >= allSlides)
  {
    currentSlide = 0;
  }
  else if (index < 0)
  {
    currentSlide = allSlides - 1;
  }
  else
  {
    currentSlide = index;
  }

  $("div.slide").hide();

  var slide = $("div.slide:eq(" + currentSlide + ")");
  
  slide.fadeIn("slow");

  $("#slideshow_notes").html($("div.notes",slide).html());
}

$(document).ready(function() {
  currentSlide = 0;
  allSlides = $("div.slide").length;
  enableNotes = false;
  showSlides = false;

  $("div.slide").each(function(i) {
    var title = $("h2.title",this).text();
    var item = $("<li />");
    var link = $('<a href="javascript:showSlide(' + i + ');" />').text(title);
    
    link.appendTo(item);
    item.appendTo("#slides");
  });

  showSlide(0);

  $("#show_slides").click(function() {
    showSlides = !(showSlides);

    if (showSlides)
    {
      $("#slides").fadeIn("slow");
    }
    else
    {
      $("#slides").fadeOut("slow");
    }
  });

  $("#prev_slide").click(function() {
    showSlide(currentSlide - 1);
  });

  $("#next_slide").click(function() {
    showSlide(currentSlide + 1);
  });

  $("#show_notes").click(function() {
    enableNotes = !(enableNotes);
    showNotes();
  });
});
