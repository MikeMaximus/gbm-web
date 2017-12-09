<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xhtml="http://www.w3.org/1999/xhtml">
  <xsl:import href="date.xsl" />
  <xsl:template match="gbm">
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="description" content="Game Backup Monitor - Automatically backup your save games and add cloud support to any game for free!" />
        <meta name="keywords" content="Game, Games, Save, Saves, Saved, Backup, Restore, Sync, Download, Cloud, Dropbox, GOG, Steam, Origin, Time, Monitor, PC" />
        <meta name="author" content="Michael J. Seiferling" />
        <title>Game Backup Monitor [Official Game List]</title>
        <script type="text/javascript" language="javascript" src="script/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" language="javascript" src="script/jquery.hoverIntent.min.js"></script>
        <link rel="stylesheet" type="text/css" href="styles/styles.css" />
        <link rel="shortcut icon" href="images/gbm.ico" />
      </head>
      <body>
        <div id="top">
          <!--Include the Header (Starts Content)-->
          <script>$(function(){ $("#header").load("header.html"); });</script>
          <div id="header"></div>
          <div id="content">
            <div id="leftcontent">
              <div class="pageSection">
                <div class="pageSectionHeader">Information</div>
                <div class="pageSectionContent">
                  <p>The official list includes games that are pre-configured to work with GBM.</p>
                  <p>GBM supports ANY game or application once configured!</p>
                  <p>Check the <a href="manual.html#import">manual</a> to learn how to easily import configurations on this list.</p>
                  <p>This list contains game configurations for Linux.</p>
                </div>
              </div>
              <div class="pageSection">
                <div class="pageSectionHeader">Game Configurations (Linux)</div>
                <div class="pageSectionContent">
                  <h3 class="notop">Updated: 
                  <xsl:call-template name="seconds-to-date">
                    <xsl:with-param name="seconds" select="@Exported" />
                  </xsl:call-template> (<xsl:value-of select="@TotalConfigurations" /> Configs)</h3>
                  <p class="small">Official configurations exclude graphics settings, logs, screenshots and other extras when possible.</p>
                  <p class="small">Official configurations may exclude autosaves and/or quicksaves when they greatly increase backup size.</p>
                  <p class="small">Official configurations will only detect the game's default executable when multiple versions are available.</p>
                  <p class="small">Icons indicate the version(s) of the game tested with GBM.</p>
                  <table border="0">
                    <xsl:for-each select="Game">
                      <xsl:sort select="Name" />
                      <tr>
                        <td class="list_logos">
                          <xsl:for-each select="Tags">
                            <xsl:for-each select="Tag">
                              <xsl:sort select="Name" />
                              <xsl:if test="Name='GOG'">
                                <img class="logo_tiny" src="images/gog_logo_tiny.png" width="24" height="24" alt="GOG" />
                              </xsl:if>
                              <xsl:if test="Name='Steam'">
                                <img class="logo_tiny" src="images/steam_logo_tiny.png" width="24" height="24" alt="Steam" />
                              </xsl:if>
                              <xsl:if test="Name='Origin'">
                                <img class="logo_tiny" src="images/origin_logo_tiny.png" width="20" height="24" alt="Origin" />
                              </xsl:if>
                              <xsl:if test="Name='Blizzard'">
                                <img class="logo_tiny" src="images/bnet_logo_tiny.png" width="24" height="24" alt="Blizzard" />
                              </xsl:if>
                              <xsl:if test="Name='Retail'">
                                <img class="logo_tiny" src="images/retail_logo_tiny.png" width="24" height="24" alt="Retail" />
                              </xsl:if>
                              <xsl:if test="Name='DOSBox'">
                                <img class="logo_tiny" src="images/dosbox_logo_tiny.png" width="24" height="24" alt="DOSBox" />
                              </xsl:if>
                              <xsl:if test="Name='ScummVM'">
                                <img class="logo_tiny" src="images/scumm_logo_tiny.png" width="24" height="24" alt="ScummVM" />
                              </xsl:if>
                              <xsl:if test="Name='FLOSS'">
                                <img class="logo_tiny" src="images/floss_logo_tiny.png" width="24" height="24" alt="FLOSS" />
                              </xsl:if>
                              <xsl:if test="Name='Tracking'">
                                <img class="logo_tiny" src="images/tracking_tiny.png" width="24" height="24" alt="Tracking" />
                              </xsl:if>
                            </xsl:for-each>
                          </xsl:for-each>
                        </td>
                        <td>                          
                          <ul class="tree">
                          <li>
                            <input type="checkbox"><xsl:attribute name="id"><xsl:value-of select="Name"/><xsl:value-of select="ProcessName"/></xsl:attribute></input>
                            <label class="tree_label"><xsl:attribute name="for"><xsl:value-of select="Name"/><xsl:value-of select="ProcessName"/></xsl:attribute><xsl:value-of select="Name" /></label>
                            <ul>
                              <li><span class="tree_label"><b>Monitored Process</b></span><div class="indent"><xsl:value-of select="ProcessName" /><xsl:if test="Parameter != ''"> (<xsl:value-of select="Parameter" />)</xsl:if></div></li>
                              <li><span class="tree_label"><b>Save Location</b></span><div class="indent"><xsl:if test="Path = ''">*Process Location*</xsl:if><xsl:if test="Path != ''"><xsl:value-of select="Path" /></xsl:if></div></li>
                              <li><span class="tree_label"><b>Absolute Path</b></span><div class="indent"><xsl:if test="AbsolutePath = 'true'">Yes</xsl:if><xsl:if test="AbsolutePath = 'false'">No</xsl:if></div></li>
                              <li><span class="tree_label"><b>Save Entire Folder</b></span><div class="indent"><xsl:if test="FolderSave = 'true'">Yes</xsl:if><xsl:if test="FolderSave = 'false'">No</xsl:if></div></li>
                              <li><span class="tree_label"><b>Include Specific Files</b></span><div class="indent"><xsl:if test="FileType = ''">None</xsl:if><xsl:value-of select="FileType" /></div></li>
                              <li><span class="tree_label"><b>Exclude Specific Files</b></span><div class="indent"><xsl:if test="ExcludeList = ''">None</xsl:if><xsl:value-of select="ExcludeList" /></div></li>
                              <xsl:if test="Comments"><li><span class="tree_label"><b>Comments</b></span><div class="indent"><xsl:if test="Comments = ''">None</xsl:if><xsl:value-of select="Comments" /></div></li></xsl:if>
                              <li><span class="tree_label"><b>Tags</b></span><div class="indent"><xsl:for-each select="Tags"><xsl:for-each select="Tag">#<xsl:value-of select="Name" />&#160;</xsl:for-each></xsl:for-each></div></li>   
                            </ul>
                          </li>
                          </ul>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </table>
                </div>
              </div>
              <!--End Left Panel-->
            </div>
            <!--Include the Footer-->
            <script>$(function(){ $("#footer").load("footer.html"); });</script>
            <div id="footer"></div>
            <!--End Content-->
          </div>
          <!--End Top-->
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
