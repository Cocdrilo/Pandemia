
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
<head>
	<meta charset="UTF-8"/>
	<link rel="stylesheet" type="text/css" href="estilo.css"/>
	<style>
		*{font-size:35px;
		  ;
		  }
		#a td{background-color:lightpink}
		
		th{background-color:lightblue;
		padding:10px;}
		tr{
			border:3px ;}
		h1,h3{color:white;}
		td{text-align:center;
		padding:10px}
		table{
		top:100px;
		margin:auto;
		left:50px;
		background-color:grey}
		#apto{color:green}
		#Noapto{color:red}
	</style>
	</head>
	<body>
	
		<div id="contenedor">
		
				<h1>Consultas</h1>
				<h3> edad>18 </h3>
					<table border="1">
						<tr>
							<th>nombre-jugador</th>
							<th>edad</th>
							<th>clase</th>
						</tr>
						<xsl:for-each select="cocdrilo/aplicante">
							<xsl:if test="edad &gt;18">
							<tr>
								<td><xsl:value-of select="nombre-jugador"/></td>
								<td><xsl:value-of select="edad"/></td>
								<td><xsl:value-of select="personaje"/></td>
							</tr>
							</xsl:if>
						</xsl:for-each>
					</table>
				<h3>Mayores de 18 con experiencia previa</h3>
				<table border="1">
						<tr>
							<th>nombre-jugador</th>
							<th>edad</th>
							<th>Apto</th>
							<th>Contacto</th>
						</tr>
						<xsl:for-each select="cocdrilo/aplicante">
							<xsl:if test="edad &gt;18 and experiencia_previa='Si'">
							<tr>
								<td><xsl:value-of select="nombre-jugador"/></td>
								<td><xsl:value-of select="edad"/></td>
								<td id="apto">Apto</td>
								<td><xsl:value-of select="correo-electronico"/></td>
							</tr>
							</xsl:if>
						</xsl:for-each>
					</table>
					
					<h3>Horario+edad+experiencia_previa</h3>
					<table border="1">
						<tr>
							<th>Nombre-jugador</th>
							<th>edad</th>
							<th>Apto</th>
							<th>Horario</th>
							<th>Horario-Apto</th>
						</tr>
						<xsl:for-each select="cocdrilo/aplicante">
							<tr>
								<td><xsl:value-of select="nombre-jugador"/></td>
								<td><xsl:value-of select="edad"/></td>
								<td>
									<xsl:choose> 
									<xsl:when test="edad &gt;18 and experiencia_previa='Si'">
										<h2 id="apto">Apto</h2>
									</xsl:when>
									<xsl:otherwise>
										<h2 id="Noapto">No Apto</h2>
									</xsl:otherwise>
									</xsl:choose>
								</td>
								<td><xsl:value-of select="horario"/></td>
								<td>
								<xsl:choose> 
									<xsl:when test="horario='M-X 14-24'">
										<h2 id="apto">Apto Horario</h2>
									</xsl:when>
									<xsl:otherwise>
										<h2 id="Noapto">No Apto</h2>
									</xsl:otherwise>
								</xsl:choose>
								</td>
							</tr>
						</xsl:for-each>
					</table>
		</div>
	
	</body>
</html>


</xsl:template>
</xsl:stylesheet>