# SharePoint-listan "Projektregister" – komplett installationsguide

Den här guiden skapar en SharePoint-lista som speglar den tidigare offline-appen: samma kategorier, statusar, budgetyta, etapper och kontakter – men helt automatisk för alla användare (ingen mappanslutning, inga behörighetsdialoger, inga omstarter att tänka på). Data ligger i er egen SharePoint-webbplats bakom dess behörigheter – ingen data lämnar er miljö.

## Steg 1 – Skapa listan (5 min)

1. Gå till er SharePoint-webbplats i webbläsaren
2. Klicka **+ Ny** → **Lista** ( SITE)(plustecknet i kommandoraden "Skapa")
3. Välj **Tom lista** (eller "Blank list")
4. Namn: **Projektregister**, beskrivning: "VA-avdelningens projektregister" → **Skapa**

## Beskrivning – Kolumner att skapa

Lägg till kolumner via **+Lägg till kolumn** (höger om Titel). Skapa dem i den ordningen:

| # | Kolumnnamn | Typ | Inställningar |
|---|---|---|---|
| 1 | Projektnummer | Enskild rad text | – |
| 2 | Kategori | Val (Alternativ) | Val: `Reningsverk`, `Vattenverk`, `Ledningsnät`, `Admin` |
| 3 | Projektledare | Person (People) | Endast valbara personer ur er organisation |
| 4 | Beställare/Ägare | Enskild rad text | – |
| 5 | Status | Val (Alternativ) | `Planering`, `Pågående`, `Pausad`, `Avslutat`, `Avbrutet` |
| 6 | Prioritet | Val (Alternativ) | `Hög`, `Medel`, `Låg` |
| 7 | Startdatum | Datum | Endast datum |
| 8 | Slutdatum | Datum | – |
| 9 | Budget | Valuta (Currency) | Svenska kronor |
| 10 | Kostnad hittills | Valuta | – |
| 11 | Plats | Enskild rad text | – |
| 12 | Beskrivning | Flera rader text | – |
| 13 | Etapp-datum | Datum | "Nästa viktiga etapp/milstolpe" |
| 14 | Etapp klar | Ja/Nej | – |
| 15 | Etapp-namn | Enskild rad text | Beskriv etappen |
| 16 | Kontakt-namn | Enskild rad text | – |
| 17 | Kontakt-epost | Enskild rad text | Klickbar e-postlänk (Copy/paste från appens kontakter) |
| 18 | Anteckningar | Flera rader text | Löpande anteckningar (radkonversationer kan också användas för att kommentera direkt på raden – rekommenderas för spårbarhet) |

**Tips:** byt namn på "Titel"-kolumnen (via kolumninställningar) till **"Projektnamn"**.

**Filer:** använd inbyggda bilagor på listraden (**+ → Bilagor/Bifogade filer** eller dra filer på raden) – SharePoint versionshanterar dem och alla behöriga ser dem direkt. Ingen projektmapp behövs, men ni kan fortsätta lagra stora ritningar i en biblioteksmapp och klistra in en länk i Beskrivningen.

## Steg 3 – Vyer (5 min)

Skapa vyer via listans **Visa>vymeny → Skapa ny vy** eller "Spara vy som":

1. **Alla projekt** – standardvy, sortering på Projektnummer
2. **Reningsverk** – filtrera Kategori = Reningsverk
3. **Vattenverk** – filtrera Kategori = Vattenverk
4. **Ledningsnät** – filtrera Kategori = Ledningsnät
5. **Admin** – filtrera Kategori = Admin
6. **Aktiva projekt** – filter: Status är inte Avslutat OCH inte Avbrutet (förslagsvis er dagliga startvy)
7. **Etappvarningar** – filter: Etapp-datum är inte tom, Etapp klar = Nej, Etapp-datum <= [Idag]+7 – visar exakt samma veckovarning som appen hade

Extra: sätt **villkorsstyrd formatering** på Status-kolumnen (kolumnmenyn → Formatera kolomner) färger status som i appen (Planering blå, Pågående grön, Avslutat grå, Avbrutet röd).

## Steg 4 – Ta med er befintliga data (10–15 min)

1. Öppna offline-appen en sista gång → knappen **📄 Exportera CSV**
2. Filen `projektlista_åååå-mm-dd.csv` öppnas i Excel (semikolon-separerad, svensk)
3. Lägg till en kolumn i Excel för Beskrivning om ni vill (finns i CSV) → stäm av kolumnordningen mot listan
4. I SharePoint-listan: klicka på **⋯ → Redigera i rutnätvy** ("Edit in grid view")
5. Kopiera dataområdet från Excel och **klistra in direkt i rutnätet** – SharePoint skapar raderna automatiskt
6. Avsluta rutnätet – klart!

## Steg 5 (valfritt) – Automatiska veckopåminnelser

Power Automate-flöde (skapas utan kodning, direkt i webbläsaren):

- Listan → **Skapa ett flöde → "Påminn mig om datum"** eller byggt: *Schema (varje morgon) → Hämta listrader där Etapp-datum ≤ addDays(utcNow(),7) och Etapp klar = Nej → Skicka mejl till Projektledare*
- Det ger er samma varning som appens "mindre än en vecka kvar"-banner, fast som mejl

## Behörighet & känslig data

- Inställningar (kugghjulet → Listinställningar → Behörigheter): begränsa till er VA-grupp – endast den som har behörighet ser data. Behörigheten styrs precis som för mappen ni har idag
- Alltida kan ni se vem som ändrade vad och när (objekt-Menyn → Versionshistorik) – bättre spårbarhet än offline-appen
- Vill ni låsa kolumner (t.ex. Budget) för alla utom en grupp: Listinställningar → Advanced → "Item-level Permissions" eller kolumnbehörigheter via fältredigering

## Efter övergången

- Appen och er gamla datafiler kan ligga kvar som reserv/backup i mappen några veckor, sedan kan mappen städas
- Länken till listan kan fästas i Teams/kanal eller på startsidan ("Appar"-ikonen) – start på ett klick för alla användare, även på mobil

Fördelarna ni vinner: full automatik (ingen mappval-dialog vid omstart), spårbarhet per rad, versionshistorik, centralt skydd av begrepp, arbete i Teams/mobil – utan att data lämnar er SharePoint-miljö.
