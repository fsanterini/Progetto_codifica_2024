# Codifica TEI-XML di due articoli tratti dalla ["La Rassegna Settimanale"](https://rassegnasettimanale.animi.it/)
codifica realizzata da Francesco santerini</br>


# <h3>ValidazioneTEI-XML tramite Xerces:</h3>


java -cp "xerces-2_12_2/xml-apis.jar;xerces-2_12_2/xercesImpl.jar;xerces-2_12_2/xercesSamples.jar" dom.Counter -v Progetto_codifica.xml

Risultato:
```bash
articoli.xml: 427;85;2 ms (3642 elems, 8364 attrs, 22198 spaces, 125349 chars)
```

# <h3>Trasformazione in file HTML del file TEI-XML con il processore Saxon:</h3>
Comando da terminale:
```bash
.../SaxonHE12-4J$ java -jar saxon-he-12.4.jar -s:articoli.xml -xsl:transform.xsl -o:articoli.html
```
