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

/*
 * Adapted from the jQuery XMLRPC Drupal plugin.
 * http://drupalbin.com/1173
 */
(function($) {
  $.phprpc = {
    xmlVersion: '1.0',

    serverURL: window.location.href,

    serverType: 'GET',

    session: {},

    serializeXML: function(data) {
      switch (typeof data)
      {
        case 'boolean':
          return '<boolean>' + ((data) ? '1' : '0') + '</boolean>';

        case 'number':
          var parsed = parseInt(data);

          if (parsed == data)
	  {
            return '<int>' + data + '</int>';
          }
          return '<double>' + data + '</double>';

        case 'string':
          return '<string>' + data + '</string>';

        case 'object':
          if (data instanceof Date)
	  {
            return '<dateTime.iso8601>'+ data.getFullYear() + data.getMonth() + data.getDate() +'T'+ data.getHours() +':'+ data.getMinutes() +':'+ data.getSeconds() +'</dateTime.iso8601>';
          }
	  else if(data instanceof Array)
	  {
            var ret = "<array><data>\n";

            for (var i=0; i < data.length; i++)
	    {
              ret += '  <value>' + $.phprpc.serializeXML(data[i]) + "</value>\n";
            }
            ret += '</data></array>';
            return ret;
          }
	  else
	  {
            var ret = "<struct>\n";

            $.each(data, function(key, value) {
              ret += '  <member><name>' + key + '</name><value>';
              ret += $.phprpc.serializeXML(value) + "</value></member>\n";
            });
            ret += '</struct>';
            return ret;
          }
      } 
    },

    parseXMLValue: function(node) {
      childs = $(node).children();

      for(var i=0; i < childs.length; i++)
      {
        switch(childs[i].tagName.toLowerCase())
        {
          case 'boolean':
            return ($(childs[i]).text() == 1);

          case 'int':
            return parseInt($(childs[i]).text());

          case 'double':
            return parseFloat($(childs[i]).text());

          case "string":
            return $(childs[i]).text();

          case "array":
            var ret = [];

            $("> data > value", childs[i]).each(function() {
              ret.push($.phprpc.parseXmlValue(this));
            });
            return ret;

          case "struct":
            var ret = {};

            $("> member", childs[i]).each(function() {
              ret[$( "> name", this).text()] = $.phprpc.parseXMLValue($("value", this));
            });
            return ret;

          case "dateTime.iso8601":
            /* TODO: fill me :( */
            return null;
        }
      }
    },

    callMessage: function(method, params) {
      var ret = '<?xml version="' + $.phprpc.xmlVersion + '"?><methodCall><methodName>' + method + '</methodName><params>';

      ret += '<param><value>' + $.phprpc.serializeXML($.phprpc.session) + '</value></param>';

      for (var i=0; i<params.length; i++)
      {
        ret += '<param><value>' + $.phprpc.serializeXML(params[i]) + '</value></param>';
      }

      ret += '</params></methodCall>';
      return ret;
    },

    response: function(message) {
      var resp = {};
      var value = $(message).find("value");

      resp.version = $.phprpc.xmlVersion;

      if (value.parent().get(0).tagName.toLowerCase() == 'fault')
      {
        resp.error = $.phprpc.parseXMLValue(value);
      }
      else
      {
        var data = $.phprpc.parseXMLValue(value);

	$.phprpc.session = data['session'];

	resp.output = data['output'];
	resp.returnValue = data['return_value'];
      }

      return resp;
    },

    callURL: function(method, params)
    {
      var call_xml = $.phprpc.callMessage(method, params);
      var url = $.phprpc.serverURL;

      if (url.indexOf('?') == -1)
      {
        url += '?';
      }
      else if (url.charAt(url.length - 1) != '&')
      {
        url += '&';
      }

      return url + 'rpc_call=' + encodeURIComponent(Base64.encode(call_xml));
    },

    call: function(method, params, callback) {
      var url = $.phprpc.callURL(method, params);

      $("#phprpc").html('');

      jQuery.ajax({
        url: url,
        type: $.phprpc.serverType,
        dataType: 'html',
        success: function(response) {
          var xml = response.replace(/^.*<rpc>/m,'').replace(/<\/rpc>/m,'');
          var resp = $.phprpc.response(xml);

          callback(resp);
        }
      });
    },

    callService: function(service, method, params, callback) {
      return $.phprpc.call(service + '.' + method, params, callback);
    }
  };
})(jQuery);
