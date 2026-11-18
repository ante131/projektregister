# Projektregister

Professionellt projektregister i en enda HTML-fil (`index.html`) – fungerar offline och placeras i en SharePoint-mapp som flera användare har åtkomst till.

## Omfattning
Projekt registreras uppdelat på fyra kategorier:

- **Reningsverk**
- **Vattenverk**
- **Ledningsnät**
- **Admin**

## Funktioner
- Statistikpanel per kategori (antal projekt, pågående, total budget)
- Registrering av projektnummer, namn, projektledare, beställare, status, prioritet, datum, budget, kostnad, lokation och beskrivning
- Sökning, filtrering på status/prioritet och sorterbar tabell
- Redigera, duplicera och ta bort projekt
- Export/import av data som JSON samt CSV-export (öppnas i Excel)

## Användning
1. Ladda ner `index.html` och lägg filen i SharePoint-mappen.
2. Öppna filen i en webbläsare (Chrome/Edge rekommenderas). Ingen installation krävs.
3. Data sparas automatiskt i webbläsarens lokala lagring.

## Delning mellan användare (SharePoint)
Datan lagras lokalt per dator. Dela ändringar via JSON-filen:

1. Efter ändringar: klicka på **Exportera data (JSON)** och spara filen i den gemensamma SharePoint-mappen (t.ex. `projektdata.json`).
2. Övriga användare: klicka på **Importera data** och välj den filen.
3. Importen slår ihop nya och uppdaterade projekt utan att radera befintlig lokal data – senast sparad version gäller per projekt.
