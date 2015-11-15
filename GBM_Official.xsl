<?xml version="1.0" ?> 
<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" > 

<xsl:template match="gbm">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="description" content="Game Backup Monitor - Automatically backup your save games and add cloud support to any game for free!" />
	<title>Game Backup Monitor</title>
	<script type="text/javascript" language="javascript" src="script/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" language="javascript" src="script/jquery.hoverIntent.min.js"></script>
    <link rel="stylesheet" type="text/css" href="styles/styles.css" />
	<link rel="shortcut icon" href="images/gbm.ico" />
</head>
<body>

<div id="top">

	<!--Include the Header (Starts Content)-->
	<script>
    	$(function(){
      		$("#header").load("header.html");
    	});
	</script>
	<div id="header"></div>

	<div id="content">
        
	<div id="leftcontent">
		<div id="pageSection"><div id="pageSectionHeader">Information</div>
				<div id="pageSectionContent">
					<p>This list includes games that are already pre-configured to work with GBM.</p>
					<p>GBM supports ANY game or application once configured!</p>
					<p>Use the <b>Import from Official List</b> option from the "Tools" menu in GBM to import from this list.</p>
				</div>
		</div>

    	<div id="pageSection"><div id="pageSectionHeader">Game List</div>
			<div id="pageSectionContent">
    			<script type="text/javascript" language="javascript" src="script/divexpander.js"></script>
				<style>

				.myButton
				{
					width: 5px;
					height: 10px;
					padding-left: 1px;
					padding-right: 1px;
					border-style: outset;
					border-width: 2px;
					font-size: 6pt;
					font-family: Arial;
					text-align: center;
					display: inline-block;
					cursor: pointer;
				}

				.infodiv
				{
					font-size: 10pt;
				}
                </style>
				
                <h3>Updated: November 14, 2015</h3>				
                <script type="text/javascript" language="javascript">
                    var iCount=0;
                    var dVar;
                    var bVar;                    
                </script>
                <xsl:for-each select="Game">
                    <xsl:sort select="Name"/>                                        
                    <xsl:value-of select="Name" /> (<xsl:value-of select="ProcessName" />)
                    <div id="gButton" class="myButton" onmousedown="buttonpressdown(this);" onmouseup="buttonpressup(this);">+</div>
				    <div class="infodiv" style ="display:none" id="gData">
				    <table border="0">
					<tr><td><b>Process Name:</b></td><td><xsl:value-of select="ProcessName" /></td></tr>
					<tr><td><b>Save Location:</b></td><td><xsl:value-of select="Path" /></td></tr>
					<tr><td><b>Absolute Path:</b></td><td><xsl:if test="AbsolutePath = 'True'">Yes</xsl:if><xsl:if test="AbsolutePath = 'False'">No</xsl:if></td></tr>
					<tr><td><b>Save Entire Folder:</b></td><td><xsl:if test="FolderSave = 'True'">Yes</xsl:if><xsl:if test="FolderSave = 'False'">No</xsl:if></td></tr>
					<tr><td><b>Include Files:</b></td><td><xsl:if test="FileType = ''">None</xsl:if><xsl:value-of select="FileType" /></td></tr>
					<tr><td><b>Exclude Files:</b></td><td><xsl:if test="ExcludeList = ''">None</xsl:if><xsl:value-of select="ExcludeList" /></td></tr>
                    <tr><td><b>Tags:</b></td><td>
                    <xsl:for-each select="Tags">
                        <xsl:for-each select="Tag">
                            #<xsl:value-of select="Name" />
                        </xsl:for-each>
                    </xsl:for-each>
					</td></tr></table></div><br />
                    <script type="text/javascript" language="javascript">                                        
                        iCount++;
                        dVar = "d" + iCount;
                        bVar = "b" + iCount;
                        document.getElementById("gData").id = dVar;
                        document.getElementById("gButton").onclick = new Function("expandcollapse('" + dVar +"',this)");                                                
                        document.getElementById("gButton").id = bVar;                        
                    </script>
                </xsl:for-each>                
		  	</div>
	   </div>


	<!--End Left Panel-->
	</div>

	<!--Include the Footer-->
	<script>
  		$(function(){
     			$("#footer").load("footer.html");
   		});
	</script>
	<div id="footer"></div>

	<!--End Content-->
	</div>

<!--End Top-->
</div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
