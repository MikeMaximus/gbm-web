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
        <script type="text/javascript" language="javascript" src="script/jhash-2.1.js"></script>
        <script type="text/javascript" language="javascript" src="script/search.js"></script>
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
                <ul>
                  <li>The official list includes games that are pre-configured to work with GBM.</li>
                  <li>Check the <a href="manual.html#import">manual</a> to learn how to easily import configurations on this list.</li>
                  <li>This list contains game configurations for Linux.</li>
                  <li>Icons indicate the version(s) of the game tested with GBM.</li>
                  <li>Official configurations exclude graphics settings, logs, screenshots and other extras when possible.</li>
                  <li>Official configurations may exclude autosaves and/or quicksaves when they greatly increase backup size.</li>
				          <li>Official configurations may not be fully compatible with old versions of GBM.</li>                  
                </ul>
                </div>
              </div>
              <div class="pageSection">
                <div class="pageSectionHeader"><b id="shown"><xsl:value-of select="@TotalConfigurations" /></b> / <xsl:value-of select="@TotalConfigurations" /> Linux Game Configurations </div>
                <div class="pageSectionContent">    
                  <input id="searchbox" placeholder="e.g.: -tux tag:floss !backup"/>     
                  <p class="timestamp">
                  <xsl:call-template name="seconds-to-date">
                    <xsl:with-param name="seconds" select="@Exported" />
                  </xsl:call-template> (v<xsl:value-of select="@AppVer" />)</p>
                  <table border="0">
                    <xsl:for-each select="Game">
                      <xsl:sort select="Name" />
                      <tr>
                        <td class="list_logos">
                          <xsl:for-each select="Tags">
                            <xsl:for-each select="Tag">
                              <xsl:sort select="Name" />
                              <xsl:if test="Name='GOG'">
                                <a>
                                  <xsl:attribute name="href">https://www.gog.com/games?sort=popularity&amp;search=<xsl:value-of select="../../Name"/>&amp;page=1</xsl:attribute>
                                  <img class="logo_tiny" src="images/gog_logo_tiny.png" width="24" height="24" alt="GOG" title="GOG" />
                                </a>
                              </xsl:if>
                              <xsl:if test="Name='Steam'">
                                <a>
                                  <xsl:attribute name="href">https://store.steampowered.com/search/?term=<xsl:value-of select="../../Name"/></xsl:attribute>
                                  <img class="logo_tiny" src="images/steam_logo_tiny.png" width="24" height="24" alt="Steam" title="Steam" />
                                </a>
                              </xsl:if>
                              <xsl:if test="Name='Humble'">
                                <a>
                                  <xsl:attribute name="href">https://www.humblebundle.com/store/search?sort=bestselling&amp;search=<xsl:value-of select="../../Name"/></xsl:attribute>
                                  <img class="logo_tiny" src="images/humble_logo_tiny.png" width="24" height="24" alt="Humble" title="Humble" />
                                </a>
                              </xsl:if>
                              <xsl:if test="Name='Itch.io'">
                                <a>
                                  <xsl:attribute name="href">https://itch.io/search?q=<xsl:value-of select="../../Name"/></xsl:attribute>
                                  <img class="logo_tiny" src="images/itchio_logo_tiny.png" width="24" height="24" alt="Itch.io" title="Itch.io" />
                                </a>
                              </xsl:if>
                              <xsl:if test="Name='Origin'">
                                <a>
                                  <xsl:attribute name="href">https://www.origin.com/usa/en-us/search?searchString=<xsl:value-of select="../../Name"/></xsl:attribute>
                                  <img class="logo_tiny" src="images/origin_logo_tiny.png" width="20" height="24" alt="Origin" title="Origin" />
                                </a>
                              </xsl:if>
                              <xsl:if test="Name='Blizzard'">
                                <img class="logo_tiny" src="images/bnet_logo_tiny.png" width="24" height="24" alt="Blizzard" title="Blizzard" />
                              </xsl:if>
                              <xsl:if test="Name='Retail'">
                                <img class="logo_tiny" src="images/retail_logo_tiny.png" width="24" height="24" alt="Retail" title="Retail" />
                              </xsl:if>
                              <xsl:if test="Name='DOSBox'">
                                <img class="logo_tiny" src="images/dosbox_logo_tiny.png" width="24" height="24" alt="DOSBox" title="DOSBox" />
                              </xsl:if>
                              <xsl:if test="Name='ScummVM'">
                                <img class="logo_tiny" src="images/scumm_logo_tiny.png" width="24" height="24" alt="ScummVM" title="ScummVM" />
                              </xsl:if>
                              <xsl:if test="Name='FLOSS'">
                                <img class="logo_tiny" src="images/floss_logo_tiny.png" width="24" height="24" alt="FLOSS" title="FLOSS" />
                              </xsl:if>
                            </xsl:for-each>
                          </xsl:for-each>
                          <xsl:if test="MonitorOnly='true'">
                            <img class="logo_tiny" src="images/tracking_tiny.png" width="24" height="24" alt="Tracking" title="Tracking" />
                          </xsl:if>
                        </td>
                        <td>                          
                          <ul class="tree">
                          <li>
                            <input type="checkbox"><xsl:attribute name="id"><xsl:value-of select="Name"/><xsl:value-of select="ProcessName"/></xsl:attribute></input>
                            <label class="tree_label"><xsl:attribute name="title">ID: <xsl:value-of select="ID"/></xsl:attribute><xsl:attribute name="for"><xsl:value-of select="Name"/><xsl:value-of select="ProcessName"/></xsl:attribute><xsl:value-of select="Name" /> <a class="permalink" title="permalink"><xsl:attribute name="href">#?q=id:<xsl:value-of select="ID"/></xsl:attribute>&#x1F517;</a></label>
                            <ul>
                              <li><span class="tree_label"><b>Monitored Process</b></span><div class="indent"><xsl:value-of select="ProcessName" /><xsl:if test="Parameter != ''"> (<xsl:value-of select="Parameter" />)</xsl:if></div></li>
                                <xsl:if test="MonitorOnly='false'">
                                <li><span class="tree_label"><b>Save Location</b></span><div class="indent"><xsl:if test="Path = ''">*Process Location*</xsl:if><xsl:if test="Path != ''"><xsl:value-of select="Path" /></xsl:if></div></li>
                                <li><span class="tree_label"><b>Absolute Path</b></span><div class="indent"><xsl:if test="AbsolutePath = 'true'">Yes</xsl:if><xsl:if test="AbsolutePath = 'false'">No</xsl:if></div></li>
                                <li><span class="tree_label"><b>Save Entire Folder</b></span><div class="indent"><xsl:if test="FolderSave = 'true'">Yes</xsl:if><xsl:if test="FolderSave = 'false'">No</xsl:if></div></li>
                                <li><span class="tree_label"><b>Save Multiple Backups</b></span><div class="indent"><xsl:if test="AppendTimeStamp = 'true'">Yes</xsl:if><xsl:if test="AppendTimeStamp = 'false'">No</xsl:if></div></li>
                                <xsl:if test="AppendTimeStamp = 'true'"><li><span class="tree_label"><b>Backup Limit</b></span><div class="indent"><xsl:if test="BackupLimit = 0">Unlimited</xsl:if><xsl:if test="BackupLimit > 0"><xsl:value-of select="BackupLimit" /></xsl:if></div></li></xsl:if>
                                <li><span class="tree_label"><b>Include Specific Files</b></span><div class="indent"><xsl:if test="FileType = ''">None</xsl:if><xsl:value-of select="FileType" /></div></li>
                                <li><span class="tree_label"><b>Exclude Specific Files</b></span><div class="indent"><xsl:if test="ExcludeList = ''">None</xsl:if><xsl:value-of select="ExcludeList" /></div></li>
                              </xsl:if>
                              <xsl:if test="Comments"><li><span class="tree_label"><b>Comments</b></span><div class="indent"><xsl:if test="Comments = ''">None</xsl:if><xsl:value-of select="Comments" /></div></li></xsl:if>
                              <li><span class="tree_label"><b>Tags</b></span><div class="indent"><xsl:for-each select="Tags"><xsl:for-each select="Tag"><a href="#" class="tag">#<xsl:value-of select="Name" /></a>&#160;</xsl:for-each></xsl:for-each></div></li>   
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
