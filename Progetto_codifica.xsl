<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>


<xsl:template match="/">
    <html>
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1" />
                <link rel="stylesheet" type="text/css" href="progetto_codifica.css" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script type="text/javascript" src="progetto_codifica.js"></script>
                <title>Progetto Codifica di Testi</title>

        </head>
        <body>
            <!-- Header -->
        <div class="header">
            <a href="https://rassegnasettimanale.animi.it/"><img src="img_progetto_cod/logo_rassegna_settimanale.png" alt="logo_rassegna_settimanale" href="https://rassegnasettimanale.animi.it/" id="logo_rassegna" /></a>
                <h1>
                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </h1>
        <div class="autore_codifica">
            <h3>
                <xsl:value-of select="concat(tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:resp, ' ', tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:name)"/>
                <a href="https://github.com/francesanterini/CdT_2024"> Github del progetto</a>
            </h3>
         </div>
        </div>
          <!-- Descrizione bibliografica -->
        <div class="info_bibliografiche_e_tasti">
          <div class="descrizione_bibliografica">
            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc"/>
        </div>
    </div>

        <!--tasti codifica-->
        <div class="tasti">
            <button class="yellow" id="persone_reali">Persone Reali</button>
            <span id="counter_persone" class="counter">0</span>

            <button class="gold" id="bibliografia">bibliografia</button>
            <span id="counter_bibliografia" class="counter">0</span>

            <button class="pink" id="luoghi">luoghi</button>
            <span id="counter_luoghi" class="counter">0</span>

            <button class="red" id="errori">errori</button>
            <span id="counter_errori" class="counter">0</span>

            <button class="grey" id="correzioni">correzioni</button>
            <span id="counter_correzioni" class="counter">0</span>

            <button class="light_pink" id="abbreviazioni">abbreviazioni</button>
            <span id="counter_abbreviazioni" class="counter">0</span>

            <button class="light_blue" id="estensioni">estensioni</button>
            <span id="counter_estensioni" class="counter">0</span>

            <button class="green" id="date">date</button>
            <span id="counter_date" class="counter">0</span>

            <button class="brown" id="Organizzazioni">Organizzazioni</button>
            <span id="counter_organizzazioni" class="counter">0</span>

            <button class="light_brown" id="foreign">parole straniere</button>
            <span id="counter_foreign" class="counter">0</span>
        </div>

        <!-- Testo -->
    <xsl:for-each select="tei:TEI/tei:text/tei:body/tei:div[@type='journal']/tei:div">
        <div class="container">
            <xsl:for-each select="tei:pb">
                <xsl:variable name="pag_id">
                    <xsl:value-of select="@xml:id" />
                </xsl:variable>
                <div class="page">
                        <xsl:apply-templates select="."/>
                    <table class="colonne">
                        <tbody>
                            <tr>
                                <th class="colonna_1">colonna 1</th>
                                <th class="colonna_2">colonna 2</th>
                            </tr>
                            <td>
                                <div class="col_sx">
                                    <xsl:apply-templates select="following::tei:cb[@corresp=concat('#', $pag_id) and @n=1]" />
                                </div>
                            </td>
                            <td>
                                <div class="col_dx">
                                    <xsl:apply-templates select="following::tei:cb[@corresp=concat('#', $pag_id) and @n=2]" />
                                </div>
                            </td>
                        </tbody>
                    </table>
                </div>
            </xsl:for-each>
        </div>
    </xsl:for-each>
</body>

    </html>
</xsl:template>


<!--templeate nodi-->
<xsl:template match="tei:fileDesc">
    <h1>Descrizione bibliografica</h1>
    <table>
        <tr>
            <td>
                <xsl:apply-templates select="tei:publicationStmt" />
            </td>
        </tr>
        <tr>
            <td>
                <xsl:apply-templates select="tei:seriesStmt" />
            </td>
        </tr>

        <tr>
            <td>
                <xsl:apply-templates select="tei:sourceDesc" />
            </td>
        </tr>
        
    </table>
</xsl:template>
<xsl:template match="tei:publicationStmt">
    <div class="info_pubblicazione" id="informazioni_pubblicazioni">
        <h3 class="section-title">Pubblicazione</h3>
    <table>
        <tr>
            <td>
                <strong>finanziato da:</strong>
            </td>
        </tr>
        <tr>
            <td>
                <xsl:value-of select="tei:publisher" />
            </td>
        </tr>
        <tr>
            <td>
                <strong>luogo di pubblicazione</strong>
            </td>
        </tr>
        <tr>
            <td>
                <xsl:value-of select="tei:pubPlace" />
            </td>
        </tr>
        <tr>
            <td>
                <strong>data di pubblicazione</strong><br/>
            </td>
        </tr>
        <tr>
            <td>
                <xsl:value-of  select="tei:date" />
            </td>
        </tr>
    </table>
</div>
</xsl:template>
<xsl:template match="tei:seriesStmt">
    <div class="info_serie" id="informazioni_serie">
        <h3 class="section-title">Serie</h3>
    <table>
        <tr>
            <td>
                <strong>titolo della serie</strong>
            </td>
        </tr>
        <tr>
            <td>
                <xsl:value-of select="tei:title"/>
            </td>
        </tr>
        <tr>
            <td>
                <strong>informazioni sul coordinatore della codifica</strong>
            </td>
        </tr>
        <tr>
            <td>
                <xsl:value-of select="tei:respStmt/tei:name"/>
            </td>
        </tr>
    </table>
</div>
</xsl:template>
<xsl:template match="tei:sourceDesc">
    <div class="info_raccolta" id="informazioni_raccolta">
        <h3 class="section-title">Descrizione Fonte</h3>
    <table>
        <tr>
            <td>
                <strong>Titolo della raccolta</strong>
            </td>
        </tr>
        <tr>
            <td>
                <xsl:value-of select="tei:biblStruct/tei:monogr/tei:title" />
            </td>
        </tr>
        <tr>
            <td>
                <strong>lingua degli articoli</strong>
            </td>
        </tr>
        <tr>
            <td>
                <xsl:value-of select="tei:biblStruct/tei:monogr/tei:textLang" />
            </td>
        </tr>
        <tr>
            <td>
                <strong><xsl:value-of select="tei:biblStruct/tei:monogr/tei:respStmt/tei:resp"/></strong><br/>
            </td>
        </tr>
        <tr>
            <td>
                <xsl:for-each select="tei:biblStruct/tei:monogr/tei:respStmt/tei:name">
                    <p><xsl:value-of select="."/></p>
                </xsl:for-each>
            </td>
        </tr>
        <tr>
            <td>
                <strong>luogo pubblicazione</strong><br/>
            </td>
        </tr>
        <tr>
            <td>
                <xsl:value-of select="tei:biblStruct/tei:monogr/tei:imprint/tei:pubPlace" />
            </td>
        </tr>
        <tr>
            <td>
                <strong>editore</strong><br/>
            </td>
        </tr>
        <tr>
            <td>
                <xsl:value-of select="tei:biblStruct/tei:monogr/tei:imprint/tei:publisher" />
            </td>
        </tr>
        <tr>
            <td>
                <strong>data</strong>
            </td>
        </tr>
        <tr>
            <td>
                <xsl:value-of select="tei:biblStruct/tei:monogr/tei:imprint/tei:date" /><br/>
            </td>
        </tr>
<tr>
    <td>
        <strong>Sezioni codificate</strong>
    </td>
</tr>
<td>
    <xsl:for-each select="tei:biblStruct/tei:analytic">
            <xsl:value-of select="tei:title"/><br/>
    </xsl:for-each>
</td>
<tr>
    <td>
        <strong>riferimenti dei testi nella rassegna</strong>
    </td>
</tr>
<tr>
    <td><xsl:for-each select="tei:biblStruct/tei:monogr">
    Volume: <xsl:value-of select="./tei:biblScope[@unit='volume']"/><br/>
    Fascicolo: <xsl:value-of select="./tei:biblScope[@unit='issue']"/><br/>
    Pagine: <xsl:value-of select="./tei:biblScope[@unit='page']"/>
    </xsl:for-each></td>
</tr>
</table>
</div>
</xsl:template>

<xsl:template match="tei:surface">
    <xsl:element name="img">
        <xsl:attribute name="src"><xsl:value-of select="tei:graphic/@url"/></xsl:attribute>
        <xsl:attribute name="usemap">#<xsl:value-of select="@xml:id"/></xsl:attribute>
        <xsl:attribute name="alt">Immagine_<xsl:value-of select="@xml:id"/></xsl:attribute>
        <xsl:attribute name="class">facsimile</xsl:attribute>
    </xsl:element>
    <xsl:element name="map">
        <xsl:attribute name="name"><xsl:value-of select="@xml:id"/></xsl:attribute>
        <xsl:for-each select="tei:zone">
            <xsl:element name="area">
                <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
                <xsl:attribute name="coords"><xsl:value-of select="@ulx"/>,<xsl:value-of select="@uly"/>,<xsl:value-of select="@lrx"/>,<xsl:value-of select="@lry"/></xsl:attribute>
            </xsl:element>
        </xsl:for-each>
    </xsl:element>
</xsl:template>

<xsl:template match="tei:pb">
    <xsl:variable name="pb_id">
        <xsl:value-of select="substring-after(@facs, '#')"/>         
    </xsl:variable>
    <xsl:apply-templates select="//tei:facsimile/tei:surface[@xml:id = $pb_id]" />
</xsl:template>

<xsl:template match="tei:cb">
    <xsl:variable name="cb_id">
        <xsl:value-of select="@xml:id" />
    </xsl:variable>
    <xsl:apply-templates select="following::tei:ab[@corresp=concat('#', $cb_id)] |
                            following::tei:closer[@corresp=concat('#', $cb_id)]  |
                            following::tei:head[@corresp=concat('#', $cb_id)] |
                            following::tei:list[@corresp=concat('#', $cb_id)] ">
    </xsl:apply-templates>
</xsl:template>

<xsl:template match="tei:ab">
    <div class="paragraph">
        <xsl:element name="span">
            <xsl:attribute name="id" select="substring-after(@facs, '#')"/>
            <strong><xsl:value-of select="substring-after(@facs, '#')"/></strong>
        </xsl:element>
        <div class="anonymous_block">
            <xsl:apply-templates/>
        </div>
    </div>
</xsl:template>

<xsl:template match="tei:head">
    <div class="title">
        <xsl:element name="span">
            <xsl:attribute name="id" select="substring-after(@facs, '#')"/>
            <strong><xsl:value-of select="substring-after(@facs, '#')"/></strong>
        </xsl:element>
        <div class="title_apply">
            <xsl:apply-templates/>
        </div>
    </div>
</xsl:template>

<xsl:template match="tei:closer">
    <div class="saluti">
        <xsl:element name="span">
            <xsl:attribute name="id" select="substring-after(@facs, '#')"/>
            <strong><xsl:value-of select="substring-after(@facs, '#')"/></strong>
        </xsl:element>
        <div class="saluti_apply">
            <xsl:apply-templates/>
        </div>
    </div>
</xsl:template>

<xsl:template match="tei:lb">
    <div class="line_b"></div>
</xsl:template>

<xsl:template match="tei:lb[@break='no']">
<xsl:text>-</xsl:text>
</xsl:template>

<xsl:template match="tei:abbr">
    <xsl:element name="span">
        <xsl:attribute name="class">abbreviazioni</xsl:attribute>
        <xsl:apply-templates />
    </xsl:element>
</xsl:template>

<xsl:template match="tei:expan">
    <xsl:element name="span">
        <xsl:attribute name="class">estensioni</xsl:attribute>
        <xsl:apply-templates />
    </xsl:element>
</xsl:template>

<xsl:template match="tei:sic">
    <xsl:element name="span">
        <xsl:attribute name="class">errori</xsl:attribute>
        <xsl:apply-templates />
    </xsl:element>
</xsl:template>

<xsl:template match="tei:corr">
    <xsl:element name="span">
        <xsl:attribute name="class">correzioni</xsl:attribute>
        <xsl:apply-templates />
    </xsl:element>
</xsl:template>

<xsl:template match="tei:num">
    <xsl:element name="span">
        <xsl:attribute name="class">num</xsl:attribute>
        <xsl:apply-templates />
    </xsl:element>
</xsl:template>

<xsl:template match="tei:said">
    <xsl:element name="span">
        <xsl:attribute name="class">said</xsl:attribute>
    </xsl:element>
</xsl:template>


<xsl:template match="tei:date">
    <xsl:element name="span">
        <xsl:attribute name="class">date</xsl:attribute>
        <xsl:apply-templates />
    </xsl:element>
</xsl:template>

<xsl:template match="tei:q">
    <xsl:element name="span">
        <xsl:attribute name="class">cit</xsl:attribute>
        <xsl:apply-templates />
    </xsl:element>
</xsl:template>

<xsl:template match="tei:list">
    <xsl:element name="span">
        <xsl:attribute name="class">elenco</xsl:attribute><br/>
        <xsl:apply-templates />
    </xsl:element>
</xsl:template>

<xsl:template match="tei:foreign[@xml:lang]">
    <xsl:element name="lingua_straniera">
        <xsl:attribute name="class">foreign</xsl:attribute>
        <xsl:apply-templates />
    </xsl:element>
</xsl:template>


<xsl:template match="tei:item">
    <div class="paragraph">
        <xsl:element name="span">
            <xsl:attribute name="id" select="substring-after(@facs, '#')"/>
            <strong><xsl:value-of select="substring-after(@facs, '#')"/></strong>
        </xsl:element>
        <div class="component_list">
            <xsl:apply-templates/>
        </div>
    </div>
</xsl:template>

<xsl:template match="tei:persName">
    <xsl:variable name="person_ref" select="substring-after(@ref, '#')" />
    <xsl:element name="span">
        <xsl:attribute name="class">person</xsl:attribute>
        <xsl:element name="a">
            <xsl:attribute name="href"><xsl:value-of select="/tei:TEI/tei:text/tei:back/tei:div/tei:listPerson/tei:person[@xml:id=$person_ref]/tei:persName/tei:ref/@target"/></xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:element>
    <xsl:for-each select="/tei:TEI/tei:text/tei:back/tei:div/tei:listPerson/tei:person">
        <xsl:if test="@xml:id = $person_ref">
            <span class="info"><br/>
                <strong>Nome: </strong><xsl:value-of select="./tei:persName"/><br/>
                <xsl:if test="./tei:birth">
                    <strong>Nascita: </strong><xsl:value-of select="./tei:birth"/><br/>
                </xsl:if>
                <xsl:if test="./tei:death">
                    <strong>Morte: </strong><xsl:value-of select="./tei:death"/><br/>
                </xsl:if>
                <strong>Professione: </strong><xsl:value-of select="./tei:occupation"/><br/>
                <xsl:if test="./tei:persName/tei:ref/@target">
                    <strong>Link: </strong><a href="{tei:persName/tei:ref/@target}"><xsl:value-of select="tei:persName/tei:ref/@target"/><br/></a>
                </xsl:if>
            </span>
        </xsl:if>
    </xsl:for-each>
</xsl:template>


<xsl:template match="tei:orgName">
    <xsl:variable name="org_ref" select="substring-after(@ref, '#')" />
    <xsl:element name="span">
        <xsl:attribute name="class">Org</xsl:attribute>
        <xsl:element name="a">
            <xsl:attribute name="href"><xsl:value-of select="/tei:TEI/tei:text/tei:back/tei:div/tei:listOrg/tei:org[@xml:id=$org_ref]/tei:orgName/tei:ref/@target"/></xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:element>
    <xsl:for-each select="/tei:TEI/tei:text/tei:back/tei:div/tei:listOrg/tei:org">
        <xsl:if test="@xml:id = $org_ref">
            <span class="info"><br/>
                <strong>Nome azienda: </strong><xsl:value-of select="./tei:orgName/tei:name"/><br/>
               <xsl:if test="./tei:state"><br/>
                <strong>Nascita azienda: </strong><xsl:value-of select="./tei:state/@from"/><br/>
               </xsl:if>
               <xsl:if test="./tei:orgName">
                <strong>Link: </strong><a href="{tei:orgName/tei:ref/@target}"><xsl:value-of select="tei:orgName/tei:ref/@target"/><br/></a>
            </xsl:if>
            </span>
        </xsl:if>
    </xsl:for-each>
</xsl:template>

<xsl:template match="tei:placeName">
    <xsl:variable name="place_ref" select="substring-after(@ref, '#')" />
    <xsl:element name="span">
        <xsl:attribute name="class">place</xsl:attribute>
            <xsl:attribute name="nome_luogo"><xsl:value-of select="/tei:TEI/tei:text/tei:back/tei:div/tei:listPlace/tei:place[@xml:id=$place_ref]/tei:placeName"/></xsl:attribute>
            <xsl:apply-templates />
    </xsl:element>
    <xsl:for-each select="/tei:TEI/tei:text/tei:back/tei:div/tei:listPlace/tei:place">
        <xsl:if test="@xml:id = $place_ref">
            <span class="info"><br/>
                <strong>Posto: </strong><xsl:value-of select="./tei:placeName"/><br/>
                <strong>Località: </strong><xsl:value-of select="./tei:location"/><br/>
            </span>
        </xsl:if>
    </xsl:for-each>
</xsl:template>

<xsl:template match="tei:name[@type='place']">
    <xsl:element name="span">
        <xsl:attribute name="class">regione</xsl:attribute>
        <xsl:apply-templates />
    </xsl:element>
</xsl:template>

<xsl:template match="tei:name[@type='publisher']">
    <xsl:element name="span">
        <xsl:attribute name="class">editore</xsl:attribute>
        <xsl:apply-templates />
    </xsl:element>
</xsl:template>

<xsl:template match="tei:name[@type='bibl']">
    <xsl:variable name="bibl_ref" select="substring-after(@ref, '#')" />
    <xsl:element name="span">
        <xsl:attribute name="class">bibliografia</xsl:attribute>
        <xsl:element name="a">
            <xsl:attribute name="href"><xsl:value-of select="/tei:TEI/tei:text/tei:back/tei:div/tei:listBibl/tei:bibl[@xml:id=$bibl_ref]/tei:ref/@target"/></xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:element>
    <xsl:for-each select="/tei:TEI/tei:text/tei:back/tei:div/tei:listBibl/tei:bibl">
        <xsl:if test="@xml:id = $bibl_ref">
            <span class="info"><br/>
                <strong>Titolo: </strong><xsl:value-of select="./tei:title"/><br/>
                <strong>Autore: </strong><xsl:value-of select="./tei:author"/><br/>
            <xsl:if test="./tei:date"> 
                <strong>Anno: </strong><xsl:value-of select="./tei:date"/><br/>
            </xsl:if>
            <xsl:if test="./tei:ref/@target">
                <strong>Link: </strong><a href="{tei:ref/@target}"><xsl:value-of select="tei:ref/@target"/><br/></a>
            </xsl:if>
            </span>
        </xsl:if>
    </xsl:for-each>
</xsl:template>
</xsl:stylesheet>
