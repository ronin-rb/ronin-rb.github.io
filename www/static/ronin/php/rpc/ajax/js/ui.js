/*
 * Ronin AJAX PHP-RPC Console - A jQuery based XMLRPC console designed to
 * work in hostile environments.
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

var shell = {
  clear: function() {
    $("#console_shell").terminalClear();
  },

  print: function(message) {
    $("#console_shell").terminalPrint(message);
  },

  exec: function(command) {
    $.phprpc.callService('shell','exec',new Array(command),function(output) {
      if (output.error != null)
      {
        shell.print(output.error);
      }
      else
      {
        var text = '$ ' + command + "\n";

	if (output.returnValue != null && output.returnValue.length > 0)
	{
	  text += output.returnValue;
	}

        shell.print(text);
      }
    });
  }
};

var php = {
  clear: function() {
    $("#console_php").terminalClear();
  },

  print: function(message) {
    $("#console_php").terminalPrint(message);
  },

  inspect: function(code) {
    $.phprpc.callService('console','inspect',new Array(code),function(response) {
      if (response.error != null)
      {
        php.print(response.error);
      }
      else
      {
        var text = '>> ' + code + "\n";

        if (response.output != null)
        {
          text = text + response.output;
        }

        php.print(text + "=> " + response.returnValue + "\n");
      }
    });
  }
};
