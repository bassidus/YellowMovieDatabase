# YellowMovieDatabase
## Medlemmar i Gula gruppen
* Carl-Magnus Arvidsson **(bassidus)**
* Jonathan Glänås **(jongla813)**
* Nathalie Falk **(fnathalie)**
* Pontus Brandt
* Simon Kvarlin **(SimonKva)**

## Tillvägagångssätt och tankesätt för databasens uppbyggnad.
* Vad vill man veta om en film? 
* Vilka tabeller kommer behövas?
* Hur ska relationerna mellan tabellerna se ut?
* Vad ska de olika vyerna visa?
* Stored procedures, vad vill vi ha för funktioner?

## Tabeller
* Filmer
* Språk (båder för filmen i sig och undertexter)
* Produktionsbolag
* Trailers
* Posters
* Karaktärer / Skådespelare
* Kontaktinformation (Address, telefon, email osv)
* Persondata (Namn, ålder, kön osv)
* Undertexter (olika språk)

## Vyer
* Lista alla skådespelare
* Lista alla filmer
* Lista alla filmer inom en viss kategori

## Stored Procedures
* Lägga till film till databasen
* Uppdatera film
* Sökfunktion

## Relationer
* **Filmer**
    * En till många **Språk**
    * En till många **Undertexter**
    * En till många **Trailers**
    * En till många **Posters**
    * En till många **Regissörer**
    * En till en **Produktionsbolag**
    * Många till många **Karaktärer**
* **Karaktärer**
    * En till en **Skådespelare / Persondata**
* **Regissörer**
    * En till en **Persondata**
* **Produktionsbolag**
    * En till en **Kontaktinfo**
* **Persondata**
    * En till en **Kontaktinfo**

