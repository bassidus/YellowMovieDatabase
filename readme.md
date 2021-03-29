# YellowMovieDatabase
## Medlemmar i Gula gruppen
* Carl-Magnus Arvidsson **(bassidus)**
* Jonathan Glänås **(jongla813)**
* Nathalie Falk **(fnathalie)**
* Pontus Brandt **(pontusbrandt)**
* Simon Kvarlin **(SimonKva)**

## Introduktion
Kund AB önskar en databas över sina filmer med lite speciella önskemål: 
* Lista alla filmer i databasen.
* Lista alla skådespelare.
* Söka på en filmtitel eller del av filmtiteln.
* Lista alla filmer baserat på genre.
* Lista alla filmer baserat på ett visst språk.
* Lista filmer som en specifik skådespelare är med i. Det ska gå att söka på bara för- eller efternamn eller en kombination av dem båda.

## Genomförande
Vi använder oss av GitHub när vi jobbar på egen hand och skärmdelning genom Discord för att gemensamt kunna arbeta och lösa diverse problem.
* Skapa repository på GitHub ( https://github.com/bassidus/YellowMovieDatabase ).
* Skapa en simpel modell av databasen i MySQL Workbench som vi kan utgå ifrån. 
* Diskutera inom gruppen vilka tabeller som är relevanta, vad som känns nödvändigt I en filmdatabas.
  * Filmer
  * Språk
  * Produktionsbolag
  * Trailers
  * Bilder
  * Karaktärer/skådespelare
  * Regissörer
  * Genre
  * Persondata
  * Kontaktinformation

## Diskussion
**Det svåra:**
* Lista ut vilka relationer som passar bäst mellan olika tabeller.
* Ska det vara en “Non-identifying” eller “Identifying” relation mellan dem?
* Att veta vilka värden som bör vara NOT NULL?
* Mer avancerade stored procedures, vi känner att vi inte fått tillräcklig genomgång av dem och vad man kan göra med dem.

**Det lätta:**
* Skriva SELECT-satser, med JOIN osv.
* Skapa olika vyer.

**Gruppsynpunkt:**
Arbetsmässigt mellan oss som infinner oss i gruppsamtalen fungerar det bra. Vi har ett bra samarbete och löser problem tillsammans. Vi kan samtala om vad var och en tycker och kommer gemensamt fram till lösningar. 
