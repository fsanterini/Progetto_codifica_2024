# Codifica TEI-XML di due articoli tratti dalla ["La Rassegna Settimanale"](https://rassegnasettimanale.animi.it/)
codifica realizzata da Francesco santerini</br>


# <h3>ValidazioneTEI-XML tramite Xerces:</h3>

```bash
java -cp "xerces-2_12_2/xml-apis.jar;xerces-2_12_2/xercesImpl.jar;xerces-2_12_2/xercesSamples.jar" dom.Counter -v Progetto_codifica.xml
```
Output:
```bash
Progetto_codifica.xml: 221;38;1 ms (1538 elems, 3416 attrs, 11468 spaces, 52336 chars)
```

# <h3>Trasformazione tramite il processore Saxon del file TEI-XML in  file HTML:</h3>
Comando da terminale:
```bash
 java -jar saxon-he-12.5.jar -s:../Progetto_codifica.xml -xsl:../Progetto_codifica.xsl -o:../output.html
```
