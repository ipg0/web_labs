<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>XML Visualiser</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"/>
      </head>
      <body>
        <h1>Visualized using <rm>client-side (browser)</rm> XSLT</h1>
        <table class="table table-striped">
          <thead class="thead-dark">
            <tr>
              <th scope="col">Index</th>
              <th scope="col">Number</th>
              <th scope="col">Three Digit Sum</th>
            </tr>
          </thead>
          <tbody id='result-table'>
            <xsl:for-each select="objects/object">
              <tr>
                <th scope="row"><xsl:value-of select="index + 1"/></th>
                <td><xsl:value-of select="number"/></td>
                <td><xsl:value-of select="sum"/></td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>