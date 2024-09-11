<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="xml" indent="yes" encoding="utf-8"/>

	<xsl:template match="/">

		<h3>Autod, mille margid algavad tähega B</h3>
		<table>
			<tr>
				<th>Mark</th>
				<th>Omanik</th>
			</tr>
			<xsl:for-each select="autod/auto[starts-with(mark, 'B')]">
				<tr>
					<td>
						<xsl:value-of select="mark"/>
					</td>
					<td>
						<xsl:value-of select="omanik"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>

		<h3>Autod, mille tootmisaasta on vanem kui 2006</h3>
		<table>
			<tr>
				<th>Mark</th>
				<th>Omanik</th>
				<th>Tootmisaasta</th>
			</tr>
			<xsl:for-each select="autod/auto[vaasta &lt; 2006]">
				<xsl:sort select="vaasta" order="descending"/>
				<tr>
					<td>
						<xsl:value-of select="mark"/>
					</td>
					<td>
						<xsl:value-of select="omanik"/>
					</td>
					<td>
						<xsl:value-of select="vaasta"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>


		<h3>Autod, mille tootmisaasta on vanem kui 2006</h3>
		<table>
			<tr>
				<th>Mark</th>
				<th>Omanik</th>
				<th>Tootmisaasta</th>
			</tr>
			<xsl:for-each select="autod/auto[vaasta &lt; 2006]">
				<xsl:sort select="vaasta" order="descending"/>
				<tr>
					<td>
						<xsl:value-of select="mark"/>
					</td>
					<td>
						<xsl:value-of select="omanik"/>
					</td>
					<td>
						<xsl:value-of select="vaasta"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		
		
		
		<!--<h3>5. Teata iga registrinumbri puhul, millises kuus auto ülevaatus</h3>
		<br></br>
		kasutame count() funktsiooni
		<br></br>
		<xsl:value-of select=""/>
		<hr></hr>-->
		
		
		<!--<h3>4. leia, mitme auto registrimägi numbritest viimane on 2</h3>
		<br></br>
		kasutame count() funktsiooni
		<br></br>
		<xsl:value-of select=""/>
		<hr></hr>-->
		
		
		<h3>3. Auto omanikud, mis sisaldavad A täht:</h3>
		<br></br>
		kasutame contains() funktsiooni
		<br></br>
		<xsl:for-each select="autod/auto[contains(omanik, 'a')]">
			<p>
				Omanik: <xsl:value-of select="omanik"/>
			</p>
		</xsl:for-each>
		<hr></hr>
		

		<h3>2. Trüki välja (eralda komaga) omaniku nime viimane täht</h3>
		<br></br>
		kasutame substring() ja  string-lengt() funktsiooni
		<br></br>
		<xsl:for-each select="autod/auto">
			<xsl:value-of select="substring(omanik, string-length(omanik), 1)"/>,

		</xsl:for-each>
		<hr></hr>
		
		
		<h3>1. Trüki välja (eralda komaga) auto registrinumbri numbrite osa</h3>
		<br></br>
		kasutame substring() funktsiooni
		<br></br>
		<xsl:for-each select="autod/auto">
			<xsl:value-of select="substring(registrinumber, 1, 3)"/>, 
			
		</xsl:for-each>
		<hr></hr>

		
		
		<h3>Autode üldkogus: xml jadas</h3>
		<br></br>
			kasutame count() funktsiooni
			<br></br>
		<xsl:value-of select="count(autod/auto)"/>
		<hr></hr>
		<h3>Autode üldkogus: mis o vaasta=2001</h3>
		<br></br>
		kasutame count() funktsiooni
		<br></br>
		<xsl:value-of select="count(autod/auto[vaasta=2000])"/>
		<hr></hr>
		
		
		<h3>Auto regnumbrid mis algavad 2:</h3>
		<br></br>
		Kasutame starts-with funnktsiooni
		<ul>
			
		
		<xsl:for-each select="autod/auto[starts-with(registrinumber, '2')]">
			<xsl:sort select="vaasta" order="descending"/>
			<li>
				<xsl:value-of select="concat(mark, ', ', registrinumber, ', ', vaasta)"/>
			</li>
			
		</xsl:for-each>
		</ul>
		<html>
			<head>
				<style>
					table {
					width: 100%;
					border-collapse: collapse;
					margin: 20px 0;
					font-size: 18px;
					text-align: left;
					}
					th, td {
					padding: 12px;
					border: 1px solid #ddd;
					}
					th {
					background-color: #f2f2f2;
					}
					tr:nth-child(even) {
					background-color: #f9f9f9;
					}
					tr:hover {
					background-color: #e9e9e9;
					}
				</style>
			</head>
			<body>
				<h2>Autod tabelina</h2>
				<table>
					<tr>
						<th>Reg Number</th>
						<th>Mark</th>
						<th>Väljastamise aasta</th>
						<th>Omanik</th>
						<th>Ülevaatuse kuu</th>
					</tr>
					<xsl:for-each select="autod/auto">
						<tr>
							<td>
								<xsl:value-of select="registrinumber"/>
							</td>
							<td>
								<xsl:value-of select="mark"/>
							</td>
							<td>
								<xsl:value-of select="vaasta"/>
							</td>
							<td>
								<xsl:if test="contains(omanik, 'a')">
									<td bgcolor="yellow">
										<xsl:value-of select="omanik"/>
									</td>
								</xsl:if>
								<xsl:if test="not(contains(omanik, 'a'))">
									<td>
										<xsl:value-of select="omanik"/>
									</td>
								</xsl:if>
							</td>

							<td>
								<xsl:if test="number(substring(registrinumber, 3, 1)+2)>=9">
								<td bgcolor="red">
									<xsl:value-of select="substring(registrinumber, 3, 1)+2"/>
								</td>
								</xsl:if>
								<xsl:if test="number(substring(registrinumber, 3, 1)+2) &lt; 9">
									<td bgcolor="green">
										<xsl:value-of select="substring(registrinumber, 3, 1)+2"/>
									</td>
									
								</xsl:if>
								

							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
