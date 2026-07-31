<?xml version="1.0" encoding="utf-8"?>
<!--
  Browsers render a raw RSS feed as an XML tree with the "does not appear to have any style
  information" warning. This stylesheet is what turns it into a readable page for humans, while
  leaving the XML byte-identical for feed readers.

  Wired up in site/src/pages/rss.xml.ts via the `stylesheet` option.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes" />
  <xsl:template match="/">
    <html lang="en">
      <head>
        <title><xsl:value-of select="/rss/channel/title" /> — feed</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="" />
        <link
          rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Newsreader:ital,opsz,wght@0,6..72,400;0,6..72,600;1,6..72,400&amp;family=Inter:wght@400&amp;display=swap"
        />
        <style>
          :root { --paper:#fbfaf6; --ink:#2e332f; --ink-body:#333833; --ink-soft:#6a706a;
                  --ink-faint:#8f8f86; --rule:#e4e2d8; --accent:#4e7c93; }
          body { margin:0; background:var(--paper); color:var(--ink-body);
                 font-family:'Newsreader','Iowan Old Style',Georgia,serif;
                 font-size:17px; line-height:1.72;
                 background-image:radial-gradient(circle at 1px 1px, rgba(64,108,152,0.14) 1.2px, transparent 0);
                 background-size:19px 19px; }
          .wrap { max-width:34rem; margin:0 auto; padding:2.6rem 1.5rem 4rem; }
          .sheet { background:rgba(251,250,246,0.955); border-radius:14px; padding:1.7rem 1.9rem 2rem; }
          .mark { font-size:1.0625rem; letter-spacing:0.04em; color:var(--ink);
                  text-decoration:none; display:inline-block; margin-bottom:1.4rem; }
          .mark span { color:var(--accent); }
          h1 { font-size:1.6rem; font-weight:400; line-height:1.24; margin:0 0 .4rem; color:var(--ink); }
          .sub { font-style:italic; color:var(--ink-soft); margin:0 0 1.2rem; font-size:.95rem; }
          .note { font-family:Inter,system-ui,sans-serif; font-size:.75rem; line-height:1.6;
                  color:var(--ink-faint); background:rgba(246,245,239,.9);
                  border-radius:9px; padding:.7rem .85rem; margin:0 0 1.7rem; }
          .note code { font-family:ui-monospace,Menlo,monospace; font-size:.72rem;
                       background:#efeee6; padding:1px 4px; border-radius:3px; }
          hr { border:0; height:1px; background:var(--rule); margin:0 0 1.3rem; }
          .item { padding:1rem 0; border-bottom:1px solid var(--rule); }
          .item:last-child { border-bottom:0; }
          .item h2 { font-size:1.1rem; font-weight:400; line-height:1.3; margin:0 0 .2rem; }
          .item h2 a { color:var(--ink); text-decoration:none; }
          .item h2 a:hover { color:var(--accent); }
          .item p { font-size:.88rem; color:var(--ink-soft); margin:0 0 .3rem; }
          .date { font-family:Inter,system-ui,sans-serif; font-size:.7rem; letter-spacing:.08em;
                  text-transform:uppercase; color:var(--ink-faint); }
          .empty { color:var(--ink-faint); font-style:italic; }
        </style>
      </head>
      <body>
        <div class="wrap">
          <div class="sheet">
            <a class="mark"><xsl:attribute name="href"><xsl:value-of select="/rss/channel/link" /></xsl:attribute>xianyun<span>shi</span></a>
            <h1><xsl:value-of select="/rss/channel/title" /></h1>
            <p class="sub"><xsl:value-of select="/rss/channel/description" /></p>
            <p class="note">
              This is an RSS feed. Paste this page's address into a feed reader and new posts
              will arrive there on their own. Nothing to sign up for.
            </p>
            <hr />
            <xsl:if test="not(/rss/channel/item)">
              <p class="empty">No published posts yet.</p>
            </xsl:if>
            <xsl:for-each select="/rss/channel/item">
              <div class="item">
                <div class="date"><xsl:value-of select="substring(pubDate, 1, 16)" /></div>
                <h2>
                  <a><xsl:attribute name="href"><xsl:value-of select="link" /></xsl:attribute>
                    <xsl:value-of select="title" />
                  </a>
                </h2>
                <p><xsl:value-of select="description" /></p>
              </div>
            </xsl:for-each>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
