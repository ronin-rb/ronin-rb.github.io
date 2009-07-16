function ronin_bootstrap_jquery(url)
{
  if (typeof jQuery == 'undefined')
  {
    if (typeof url == 'undefined')
    {
      url = "http://ronin.rubyforge.org/static/html/jquery.min.js";
    }

    document.write('<script type="text/javascript" src="' + \
		    jquery_url + \
		    '"></script>');
  }
}
