<?xml version="1.0" ?> 
<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" > 

<xsl:template match="gbm">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="description" content="Game Backup Monitor - Automatically backup your save games and add cloud support to any game for free!" />
    <meta name="keywords" content="Game, Games, Save, Saves, Saved, Backup, Restore, Sync, Download, Cloud, Dropbox, GOG, Steam, Origin, Time, Monitor, PC" />
    <meta name="author" content="Michael J. Seiferling">
        
	<title>Game Backup Monitor [Official Game List]</title>
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
					<p>The official list includes games that are pre-configured to work with GBM.</p>
					<p>GBM supports ANY game or application once configured!</p>
					<p>The official list contains game configurations for Microsoft Windows.  Linux is not yet supported.</p>
				</div>
		</div>

    	<div id="pageSection"><div id="pageSectionHeader">Game List</div>
			<div id="pageSectionContent">
    			<script type="text/javascript" language="javascript" src="script/divexpander.js"></script>
				<style>

				.myButton
				{
                    background-color: #2D2D2D;
                    width: 10px;
					padding-left: 1px;
					padding-right: 1px;
                    margin-left: 5px;
                    margin-right: 5px;
					border-style: outset;
					border-width: 2px;
					font-size: 8pt;
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
				
                <h3 class="notop">Updated: April 2, 2016 (235 Configs)</h3>                
			    <p class="small">Official backup configurations exclude graphics settings, logs, screenshots and other extras when possible.</p>
                <p class="small">Logos indicate the version(s) of the game tested with GBM.</p>
                
                <script type="text/javascript" language="javascript">
                    var iCount=0;
                    var dVar;
                    var bVar;                    
                </script>
                <table border="0">
                <xsl:for-each select="Game">
                    <xsl:sort select="Name"/>
                    <tr><td class="list_logos">
                    <xsl:for-each select="Tags">                        
                        <xsl:for-each select="Tag">
                           <xsl:sort select="Name"/>
                           <xsl:if test="contains(Name,'GOG')"><img class="logo_tiny" src="images/gog_logo_tiny.png" width="24" height="24" alt="GOG" /></xsl:if>
                           <xsl:if test="contains(Name,'Steam')"><img class="logo_tiny" src="images/steam_logo_tiny.png" width="24" height="24" alt="Steam" /></xsl:if>
                           <xsl:if test="contains(Name,'Origin')"><img class="logo_tiny" src="images/origin_logo_tiny.png" width="20" height="24" alt="Origin" /></xsl:if>
                           <xsl:if test="contains(Name,'Retail')"><img class="logo_tiny" src="images/retail_logo_tiny.png" width="24" height="24" alt="Retail" /></xsl:if>
                           <xsl:if test="contains(Name,'DOSBox')"><img class="logo_tiny" src="images/dosbox_logo_tiny.png" width="24" height="24" alt="DOSBox" /></xsl:if>
                           <xsl:if test="contains(Name,'ScummVM')"><img class="logo_tiny" src="images/scumm_logo_tiny.png" width="24" height="24" alt="ScummVM" /></xsl:if>
                        </xsl:for-each>
                    </xsl:for-each>
                    </td>
                    <td><xsl:value-of select="Name" /> 
                    <div id="gButton" class="myButton" onmousedown="buttonpressdown(this);" onmouseup="buttonpressup(this);">+</div>                   
				    <div class="infodiv" style ="display:none" id="gData">
				    <table border="0">
					<tr><td><b>Monitored Process</b></td></tr><tr><td class="indent"><xsl:value-of select="ProcessName" /></td></tr>
					<tr><td><b>Save Location</b></td></tr><tr><td class="indent"><xsl:value-of select="Path" /></td></tr>
					<tr><td><b>Absolute Path</b></td></tr><tr><td class="indent"><xsl:if test="AbsolutePath = 'true'">Yes</xsl:if><xsl:if test="AbsolutePath = 'false'">No</xsl:if></td></tr>
                    <tr><td><b>Save Entire Folder</b></td></tr><tr><td class="indent"><xsl:if test="FolderSave = 'true'">Yes</xsl:if><xsl:if test="FolderSave = 'false'">No</xsl:if></td></tr>
					<tr><td><b>Include Files</b></td></tr><tr><td class="indent"><xsl:if test="FileType = ''">None</xsl:if><xsl:value-of select="FileType" /></td></tr>
					<tr><td><b>Exclude Files</b></td></tr><tr><td class="indent"><xsl:if test="ExcludeList = ''">None</xsl:if><xsl:value-of select="ExcludeList" /></td></tr>
                    <tr><td><b>Tags</b></td></tr><tr><td class="indent">
                    <xsl:for-each select="Tags">
                        <xsl:for-each select="Tag">
                            #<xsl:value-of select="Name" />
                        </xsl:for-each>
                    </xsl:for-each>
                    </td></tr></table></div></td></tr>
                    <script type="text/javascript" language="javascript">                                        
                        iCount++;
                        dVar = "d" + iCount;
                        bVar = "b" + iCount;
                        document.getElementById("gData").id = dVar;
                        document.getElementById("gButton").onclick = new Function("expandcollapse('" + dVar +"',this)");                                                
                        document.getElementById("gButton").id = bVar;                        
                    </script>
                </xsl:for-each>
                </table>
                                
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
