# Tillvägagångssätt och tankesätt för databasens uppbyggnad.

## Vi pratar ihop oss om hur vi vill lägga upp grunden
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
* Filmer till språk (Många till många)
* Filmer till undertexter till språk (många till många)
```

Movies
Därifrån vill vi att varje movie ska innehålla:
en till många - trailer (varje film kan innehålla flera trailers, men en trailer är bara till en film
en till många - poster (varje film kan innehålla flera posters, men en poster är bara till en film)
många till många - language (varje film kan ha många språk, och samma språk kan vara till många filmer)
många till många - character (varje karaktär kan finnas i flera filmer, och varje film kan ha flera karaktärer)
en till många - production company (varje produktionsbolag kan ha flera filmer, men varje film har bara ett produktionsbolag)
många till många - director (en director kan göra många filmer, och varje film kan ha flera directors)

character ska innehålla:
en till en - persondata (en karaktär har en persondata)
persondata ska innehålla:
en till en - contactinfo (en persondata har en kontaktinfo)
production company ska innehålla:
en till en - contactinfo (ett company har en kontaktinfo)
```
