A Programmer's Guide to SJCAM SJ4000 WiFi
=========================================

"A Programmer's Guide to SJCAM SJ4000 WiFi" is a reverse-engineered
documentation of WiFi-based control protocol in SJCAM SJ4000 WiFi
<http://sjcamhd.com/sjcam-sj4000-wifi/> action camera, providing
necessary information for free software developers to develop applications
or libraries for wirelessly controlling SJCAM SJ4000 WiFi; and for users
to control their camera without relying on proprietary SJCAM ZONE software.

Along the way, it also documents trivia, catches and quirks observed
in several camera functions.

The guide is written to be comprehensive and detailed to the extent possible
without relying on any information from more invasive reverse engineering
techniques like application decompilation and firmware disassembling.

See project website to read the guide online, see errata information,
download pre-built HTML version, PDF version, artworks, and source code.

Project website: http://sj4000programming.sourceforge.net/


System Requirements
-------------------

As this guide is written in DocBook XML 4.2 markup; to build HTML version
of the guide from source code, you'll need the following software:

  - Make
    Used for running the build script.
    Any version or variant should work. Tested with GNU Make 3.81,
    but GNU Make 4.0, Dmake 4.12, NetBSD Make 1.111, and Borland Make 5.2
    are known to work too.
    
    https://www.gnu.org/software/make/
  
  - OASIS DocBook 4.2 DTD
    Used for validating and interpreting DocBook XML document.
    
    https://www.oasis-open.org/docbook/xml/4.2/
    http://docbook.org/xml/4.2/
  
  - Libxml2
    Used for validating main DocBook XML document.
    Tested with version 2.8.0, but 2.9.1 is known to work too.
    
    http://xmlsoft.org/
  
  - DocBook XSL Stylesheet
    Used as processing template of main DocBook XML document.
    Version 1.79.1 should work, but not perfectly; see Known Issues below.
    
    https://sourceforge.net/projects/docbook/files/docbook-xsl/
  
  - XSLTproc
    Used for processing main DocBook XML document.
    Tested with version 1.1.26, but 1.1.28 is known to work too.
    
    http://xmlsoft.org/XSLT/
  
  - Apache Batik
    Used for rasterizing or translating SVG illustrations.
    Tested with version 1.8, but 1.7 should work too.
    
    https://xmlgraphics.apache.org/batik/

To build PDF version of the guide from source code, you'll need all software
listed above, plus:

  - Apache FOP
    Used for writing output PDF document.
    Version 2.2 works, but not perfectly, so as 2.1; see Known Issues below
    for information, and PDF Line Wrapping section for workaround.
    
    https://xmlgraphics.apache.org/fop/

In case you are running Debian GNU/Linux (or its derivatives like Ubuntu,
or Mint), you could install following packages from the repository:

    make docbook-xml libxml2-utils docbook-xsl xsltproc libbatik-java fop

If you wish to use different XLST or XSL-FO processor, you can; but you would
need to change "Makefile" accordingly, and beware that some extra features
(e.g. PDF bookmarks) might not work- depending on the processor used.


Building
--------

To build a single-page HTML version of the guide, run following command
in source directory:

    make book.html

To build a multipage (chunked) HTML version of the guide, run following
command in source directory:

    make index.html

To build a print (PDF) version of the guide, run following command in
source directory:

    make book.pdf

However there are things to keep in mind when generating PDF version
of the guide, see "PDF Line Wrapping" and "PDF Fonts" section
for more information.

To build all version of the guide, run following command in source directory:

    make

To see see all available build commands you could use, run following command
in source directory:

    make help

Please note that release version of the guide are not exactly the same as
ones you would get from this instruction, as released version is hand-edited
to fix minor quirks introduced by the document processor.


PDF Line Wrapping
-----------------

At the time of this writing, Apache FOP processor (including its latest
version 2.2) has problems on command-line and camera response display
formatting. So, it is *NOT RECOMMENDED* to generate the PDF version
directly from original source code without any hand-tuning, as example
commands and camera output snippet in the guide would be messed up.
If you really need to generate the PDF version, follow this instruction:

- Change `select` option of `hyphenate.verbatim` line in "print.xml" file,
  from `1` to `0`.

- Try generating the PDF version.

- Look carefully at every code listing (highlighted in grey background)
  in the generated PDF files, and see if any one of them has wrapped line.

- Go to the corresponding line of each line wrapping in "book.xml",
  and add "&nbsp;&raquo;" followed by a manual line break at the location
  where the line wraps. (You might need to change the sequence to
  "]]>&nbsp;&raquo;<![CDATA[" if the text started with "<![CDATA[")

- Try generating the PDF version and do the observation/insertion again
  until there's no wrapped line without guillemet '>>' mark.


PDF Fonts
---------

In guide's Setup Screen appendix, there are camera menu items that are written
in non-Western languages: Chinese, Hibrew, Japanese, Korean, and Russian.
As these languages are not covered in PDF core fonts, they requires embedding;
which means specific fonts needs be installed on the machine in order to
correctly generate the PDF version, or each character in the affected
phrase would be replaced with '#'.

These are font families used for these phrases, by language, in following
order (the first font found in each language will be used):

- Chinese:  AR PL UMing CN, SimSun
- Hebrew:   FreeSerif, Times New Roman
- Japanese: AR PL UMing CN, SimSun
- Korean:   Baekmuk Batang, UnBatang, Batang
- Russian:  Nimbus Roman No9 L, Times New Roman, FreeSerif

If you wish to use different fonts, edit "print.xsl" accordingly.

But as these non-Western text are not essential to main guide content;
you can alternatively choose to ignore them (and let them display as "#####").


Known Issues
------------

- Some versions of DocBook XSL are known to cause problems:
  
  - DocBook XSL 1.76.1 does not generate CSS file in chunked HTML output,
    causing broken stylesheet links and unstyled pages in chunked HTML
    generation.
  
  - DocBook XSL 1.77.1 generates incorrect nested `<footnote>` link tags in
    single-page HTML and chunked HTML output, causing footnote links
    to stop working in both mode of HTML generation.
  
  - DocBook XSL 1.79.1 generates `xmlns:xlink` attribute on element
    representing `<index>` tag in single-page HTML and chunked HTML output,
    causing validation error. Patch available in DocBook SourceForge bug
    entry #1384 <http://sourceforge.net/p/docbook/bugs/1384/>.
    
  - DocBook XSL 1.79.1 generates nested `<a>` tag for link to glossary entry
    in single-page HTML and chunked HTML output, causing validation error.
    Patch available in DocBook SourceForge bug entry #1392
    <http://sourceforge.net/p/docbook/bugs/1392/>.

- Several versions of Apache FOP are known to have problems:
  
  - Apache FOP 2.2 is known to wrap very long lines- ones that requires more
    than one wrapping- inside program code display without displaying line
    wrapping indicator on *some* wrapping points. (This guide uses
    guillemet mark '>>' as line wrapping indicator)
  
  - Apache FOP 1.0 (and 2.1 in some cases) are known to wrap lines in
    program code display in the guide without displaying proper
    line wrapping indicator. (This guide uses guillemet mark '>>'
    as line wrapping indicator)
  
  - Apache FOP 1.0, 2.1, and 2.2 are known to add extra dashes into
    command line and XML response display in the guide, messing them up.


Reporting Bugs
--------------

If you find errors, typos, or grammar mistakes in the guide; or have new
information to share; feel free open a discussion ticket at:

    http://sourceforge.net/p/sj4000programming/tickets/

Or alternatively, send email to the author (see below).


Author Information
------------------

"A Programmer's Guide to SJCAM SJ4000 WiFi"
Written by Nutchanon Wetchasit <Nutchanon.Wetchasit@gmail.com>

This guide is released under GNU General Public License, or (at your option)
GNU Free Documentation License (with no Invariant Sections,
with no Front-Cover Text, and with no Back-Cover Texts).

See "LICENSE.txt", "COPYING.GPL.txt" and "COPYING.FDL.txt"
for full legal information.
