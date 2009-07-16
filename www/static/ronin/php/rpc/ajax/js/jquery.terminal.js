/*
 * jQuery Terminal - A jQuery plugin for creating terminal-like UI
 * elements.
 *
 * Copyright (c) 2007-2009 Hal Brodigan (postmodern.mod3 at gmail.com)
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */

(function($) {
  $.fn.terminal = function(callback) {
    var obj = $(this);

    var output = $('<textarea></textarea><br />');
    var input = $('<input />');

    output.addClass('terminal_textarea');
    output.attr({cols: 100, rows: 25, readonly: true});

    input.addClass('terminal_textarea');
    input.attr({size: 103, value: ''});

    obj.append(output);
    obj.append(input);

    input.keypress(function(e) {
      if (e.which == 13)
      {
        var data = $.trim(input.val());

        if (data.length > 0)
        {
          callback(data);
        }

        input.val('');
      }
    });
  };

  $.fn.terminalFocus = function() {
    return this.each(function() {
      $("input.terminal_textarea",this).focus();
    });
  };

  $.fn.terminalClear = function() {
    return this.each(function() {
      $("textarea.terminal_textarea",this).val('');
    });
  };

  jQuery.fn.terminalPrint = function(message) {
    return this.each(function() {
      var output = $("textarea.terminal_textarea",this);

      output.val(output.val() + message);
      output.attr('scrollTop', output.attr('scrollHeight'));
    });
  };

  jQuery.fn.terminalPrintLine = function(message) {
    return this.terminalPrint(message + "\n");
  };

})(jQuery);
