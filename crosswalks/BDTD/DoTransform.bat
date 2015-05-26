@echo off

RaptorXML xslt --xslt-version=2 --input="mtd2-br.xml" --output="Novomtd3-br.xml" %* "MappingMapToNovomtd3-br.xslt"
IF ERRORLEVEL 1 EXIT/B %ERRORLEVEL%
