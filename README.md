# Trente
Nederlandse vertaling van de Catechismus van Trente

Live website: [http://trente.gelovenleren.net](http://trente.gelovenleren.net)

# Hugo

Nota: some modifications have been made to hugo-book theme, so don't just drop in an update!

Building the website to public/: ./hugo

Deploying the website: ./deploy

# Calendar

The folder 'calendar' has an ANT script:

1. target 'hugo' builds the website
2. target 'xhtml' turns the Hugo-generated html pages into xhtml
3. target 'xml' turns the xhtml into xml
4. target 'json' turns the xml into json

# Epub

Creating EPUB file: a subfolder epub contains a separate hugo workspace, with links to the content in the master workspace, but organized slightly differently. Also this theme has modifications applied, for properly sorting the chapters, so don't just drop in an update!

Source: https://github.com/weitblick/epub

1. cd epub
2. ./deploy

The EPUB is then available in /static and will be uploaded to the website on the next ./deploy in the master workspace.

Note that the EPUB did need a clean-up in Calibre in order to be accepted by Google Books reader (just convert to EPUB, no special settings applied).
