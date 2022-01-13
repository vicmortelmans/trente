A fresh calendar-eo.xml can be retrieved from:

https://www.missale.net/calendar/eo
https://docs.google.com/document/d/1z1iu3ASHpk3jfSxXZwNKYMexxxZAats5I57qp5bAUNk

Convert html5 to xhtml:

xmllint --html --xmlout ../public/docs/7-kalender/kalender/index.html > romeinse-catechismus-xhtml.html

Run:

java net.sf.saxon.Transform -xsl:romeinse-catechismus-calendar.xslt -s:calendar-eo.xml -o:calendar-romeinse-catechismus.xml 

Upload to this bucket:

https://console.cloud.google.com/storage/browser/geloven-leren?forceOnBucketsSortingFiltering=false&project=catecheserooster
