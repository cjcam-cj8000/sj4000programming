# A Programmer's Guide to SJCAM SJ4000 WiFi
# Copyright (C) 2016 Nutchanon Wetchasit
# 
# This guide is free document: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation.
# 
# This guide is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# 
# You should have received a copy of the GNU General Public License
# along with this guide. If not, see <http://www.gnu.org/licenses/gpl.html>
# 
# Additionally, permission to redistribute and/or modify this guide
# is also provided under the terms of the GNU Free Documentation License
# as published by the Free Software Foundation; with no Invariant Sections,
# with no Front-Cover Texts, and with no Back-Cover Texts. A copy of this
# license could be obtained from <http://www.gnu.org/licenses/fdl.html>

VECTORS=wirelessconn.svg arpproxyroute.svg natpat.svg nat1to1.svg nat1to1frompc.svg nat1to1fromcamera.svg androidtethernat.svg
RASTERS=wirelessconn.png arpproxyroute.png natpat.png nat1to1.png nat1to1frompc.png nat1to1fromcamera.png androidtethernat.png

all: book.html index.html book.pdf

.PHONY: all help check clean

help:
	@echo "Build various version of \"A Programmer's Guide to SJCAM SJ4000 WiFi\"."
	@echo ""
	@echo "make [TARGET...]"
	@echo ""
	@echo "  make book.html         Build single-page HTML version"
	@echo "  make index.html        Build chunked HTML version"
	@echo "  make book.pdf          Build printable PDF version"
	@echo "  make all               Build all version"
	@echo "  make                   Same as \"make all\""
	@echo "  make check             Check validity of book source"
	@echo "  make clean             Remove all built files"
	@echo "  make help              Show this help"

book.html: book.xml gpl.xml html-single.xsl html-single.css.xml $(RASTERS)
	xmllint --valid --noout book.xml
	xsltproc --timing -o book.html html-single.xsl book.xml

index.html: book.xml gpl.xml html-chunked.xsl html-chunked.css.xml $(RASTERS)
	xmllint --valid --noout book.xml
	xsltproc --timing html-chunked.xsl book.xml

book.pdf: book.fo fop.conf $(VECTORS)
	fop -c fop.conf book.fo book.pdf

book.fo: book.xml gpl.xml print.xsl
	xmllint --valid --noout book.xml
	xsltproc --timing -o book.fo print.xsl book.xml

check:
	xmllint --valid --noout book.xml

wirelessconn.png: wirelessconn.svg
	rasterizer -w 750 wirelessconn.svg

arpproxyroute.png: arpproxyroute.svg
	rasterizer -w 750 arpproxyroute.svg

natpat.png: natpat.svg
	rasterizer -w 750 natpat.svg

nat1to1.png: nat1to1.svg
	rasterizer -w 750 nat1to1.svg

nat1to1frompc.png: nat1to1frompc.svg
	rasterizer -w 750 nat1to1frompc.svg

nat1to1fromcamera.png: nat1to1fromcamera.svg
	rasterizer -w 750 nat1to1fromcamera.svg

androidtethernat.png: androidtethernat.svg
	rasterizer -w 750 androidtethernat.svg

clean:
	rm -f *.html
	rm -f *.css
	rm -f *.png
	rm -f book.fo
	rm -f book.pdf
