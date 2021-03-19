```
vy visar alla skådespelare eller filmer
store proc 
sökfunktion
lägga till film i databas

Vi pratar ihop oss om hur vi vill lägga upp grunden, vad vill man veta
om en film?
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
