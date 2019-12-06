<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
                <table id="rentTable" class="indent">
                    <thead>
                        <tr>
                            <th colspan="3">Car rental Shop</th>
                        </tr>
                        <tr>
                            <th>Status</th>
                             <th>Rent</th>
                            <th>Company</th>>
                           
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="/vehicles/cars">
                            <tr>
                                <td colspan="3">
                                    <xsl:value-of select="@body" />
                                </td>
                            </tr>
                            <xsl:for-each select="make">
                            <tr id="{position()}">
                                <td>
                                    <xsl:value-of select="status" />
                                </td>
                                <td align="right">
                                    <xsl:value-of select="rent" />
                                </td>
                                <td align="right">
                                    <xsl:value-of select="company" />
                                </td>
                            </tr>
                            </xsl:for-each>
                        </xsl:for-each>
                    </tbody>
                </table><br/>
    </xsl:template>
</xsl:stylesheet>