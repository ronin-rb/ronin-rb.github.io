= ronin.rubyforge.org

ronin.rubyforge.org is built from a collection of XML files which are
transformed into XHTML 1.1 Strict using custom XSL templates.

== Directory Structure

* Rakefile: The top-level Rakefile which builds the HTML and RSS files.
* xml: Contains the XML files which will be used to create the XHTML
  files within www/.
* xml/_menu.xml: Top-level menu XML include file.
* xml/_description.xml: Common Ronin project description XML include file.
* xsl: Contains the XSL templates used to convert the XML files into
  the XHTML 1.1 Strict files in www/.
* images: Contains image project files (XCFs or SVGs).
* www: Contains the files to be published.
* www/css: Contains the CSS files to be published.
* www/images: Contains the static images to be published.
* www/scripts: Contains the static JavaScript files to be published.
* www/static: Contains static files provided by various Ronin libraries.

== XML Schema

ronin.rubyforge.org uses a custom XML schema that is HTML-like, but
contains many specialized tags used to generate very complex HTML markup.

=== HTML Markup

  <title>html title</title>

  <p>same old thing</p>

  Break that line.<br />

  <a href="link/to/place">link</a>

  <b>bold</b>

  <i>italic</i>

  <u>underlined</u>

  <kbd>keyboard text</kbd>

=== Specialized HTML Markup

  <copyright /> <!--- copyright symbol --->

  <r /> <!--- R symbol --->

  <tm /> <!--- trademark symbol --->

  <jmp name="label">link to a local anchor tag</jmp>

  <code>def hello_world
    puts 'hello'
  end</code>

  <shell>$ echo "creates a pre-tag for shell-commands"</shell>

  <email>snoopdog@gmail.com</email>

  <quote>
    <p>Creates a block-quote tag.</p>
  </quote>

  <quote>
    <p>Creates a block-quote tag.</p>
    <from>from this guy</from>
  </quote>

  <!--- load another stylesheet --->
  <stylesheet src="path/to/css" />

  <!--- load in a javascript file --->
  <javascript src="path/to/js" />

=== Structured Markup

  <section label="anchor link" title="Title">
    <p>Creates an h1 section title.</p>
  </section>

  <subsection label="anchor link" title="Title">
    <p>Creates an h2 sub-section title.</p>
  </subsection>

  <list>
    <item>Creates an unordered list</item>
    <item>with items</item>
  </list>

  <instructions>
    <item>Creates a numbered list</item>
    <item>with multiple items</item>
  </instructions>

  <footnote>* Makes an indented note paragraph</footnote>

  <note>Creates a note paragraph</note>

  <warning>Creates a fucking warning, bitches</warning>

=== Page Markup

  <!--- X-Include another file --->
  <xi:include href="path/to/xml" />

  <page>
    <!--- sets up the "page" div --->
  </page>

  <content>
    <!--- sets up the "content" div --->
  </content>

== An Example Page

  <?xml version="1.0"?>
  <?xml-stylesheet type="text/xsl" href="../xsl/page.xsl"?>
  
  <rubyforge xmlns:xi="http://www.w3.org/2001/XInclude">
    <title>Test page</title>
  
    <page>
      <!--- X-Include the top-level menu --->
      <xi:include href="_menu.xml" />
  
      <!--- begin the content --->
      <content>
        <section label="test" title="test page">
          <p>Some text.</p>
  
          <subsection label="sub_test" title="Other stuff">
            <p>Some more text.</p>
  
            <list>
              <item>Maybe a list too.</item>
            </list>
	  </subsection>
        </section>
      </content>
    </page>
  </sophweb>

== License

ronin.rubyforge.org.

Copyright (c) 2006-2009 Hal Brodigan (postmodern.mod3 at gmail.com)

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
