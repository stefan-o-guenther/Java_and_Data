<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">	
	<xsl:template match="/CDSAMMLUNG">
		<xsl:element name="html">
			<xsl:element name="body">
				<xsl:element name="table">
					<xsl:attribute name="border">1</xsl:attribute>
					<xsl:element name="tr">
						<xsl:element name="th">
							<xsl:text>Number</xsl:text>
						</xsl:element>
						<xsl:element name="th">
							<xsl:text>Owner</xsl:text>
						</xsl:element>
						<xsl:element name="th">
							<xsl:text>CD Name</xsl:text>
						</xsl:element>
						<xsl:element name="th">
							<xsl:text>vorherige CD</xsl:text><xsl:element name="br"/><xsl:text>selber Owner</xsl:text>
						</xsl:element>
						<xsl:element name="th">
							<xsl:text disable-output-escaping="yes">n&amp;auml;chste CD</xsl:text><xsl:element name="br"/><xsl:text>selber Owner</xsl:text>
						</xsl:element>
					</xsl:element>
					<xsl:for-each select="./ALBUM">
						<xsl:element name="tr">
							<xsl:element name="td">
								<xsl:value-of select="position()"/>
							</xsl:element>
							<xsl:element name="td">
								<xsl:value-of select="@OWNER"/>
							</xsl:element>
							<xsl:element name="td">
								<xsl:value-of select="TITEL/text()"/>
							</xsl:element>
							<xsl:element name="td">
								<xsl:choose>
									<xsl:when test="position() != '1'">
										<xsl:choose>
											<xsl:when test="preceding-sibling::ALBUM[1]/@OWNER=self::ALBUM/@OWNER">
												<xsl:text>ja</xsl:text> 
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>nein</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>-</xsl:text>
									</xsl:otherwise>						
								</xsl:choose>
							</xsl:element>
							<xsl:element name="td">
								<xsl:choose>
									<xsl:when test="position() != last()">
										<xsl:choose>
											<xsl:when test="following-sibling::ALBUM[1]/@OWNER=self::ALBUM/@OWNER">
												<xsl:text>ja</xsl:text> 
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>nein</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>-</xsl:text>
									</xsl:otherwise>						
								</xsl:choose>							
							</xsl:element>
						</xsl:element>        
					</xsl:for-each>					
				</xsl:element>
			</xsl:element>
		</xsl:element>
	</xsl:template>	
</xsl:stylesheet>