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
- Projektnummer, namn, projektledare, beställare, status, prioritet, datum, budget, kostnad, lokation, beskrivning
- **Projektvy** med flikarna Översikt, Etapper, Anteckningar, Filer & länkar och Kontakter
- **Etapper** med automatisk varning när det är mindre än en vecka kvar till datumet (röd varning för passerade datum) – varningen försvinner när etappen bockas färdig; varningarna syns också i listan och på startsidan
- **Anteckningar** med författare och tidsstämpel
- **Filer & länkar** – länka till dokument i SharePoint-mappen eller bifoga filer (max 2 MB per fil; totalgräns för lagringen är ca 5–10 MB – länka större dokument till SharePoint-mappen)
- **Kontakter** med knapp "Mejla" som öppnar e-postprogrammet med färdig mottagare och ämnesrad
- Sökning, filtrering på status/prioritet och sorterbar tabell
- Autosparning + 💾 Spara-knapp (Ctrl+S) och "Senast sparat"-tidsstämpel
- Export/import av data som JSON samt CSV-export (öppnas i Excel)

## Användning
1. Ladda ner `index.html` och lägg filen i SharePoint-mappen.
2. Öppna filen i **Chrome eller Edge** (rekommenderas – krävs för direktläge mot gemensam datafil). Strunta i att SharePoint-knappen ibland vill "öppna i webbläsare/app" – öppna den synkroniserade filen från Utforskaren/OneDrive.
3. Data sparas automatiskt i webbläsarens lokala lagring.

## Delad data mellan flera användare (viktigt!)
Webbläsarens lokala lagring är per dator. För att **alla ska se och fortsätta på samma projekt**:

### Rekommenderat: gemensam datafil (Chrome/Edge)
1. Skapa en gång en tom fil i SharePoint-mappen som heter **`projektdata.json`** (högerklicka → Nytt → Textdokument, döp om till projektdata.json med filtillägget .json).
2. Öppna `index.html`, klicka på **📁 Anslut gemensam datafil** och välj `projektdata.json` i mappen.
3. Nu sparar appen **automatiskt direkt till filen** vid varje ändring, och vid anslutning hämtas andras ändringar in. Lokala nya projekt förs automatiskt in i filen.
4. En gång per öppning: klicka på knappen och välj filen igen (webbläsarkraven; sparande sker sedan automatiskt).

**OBS:**
- SharePoint synkar filen till andras datorer via OneDrive-synk (kan ta någon minut).
- Undvik att två personer redigerar **samma projekt** samtidigt – vid anslutning hämtas alltid den senast sparade versionen per projekt in, men håll korta arbetspass och anslut på nytt innan du börjar.
- Filer som någon annan har öppen i ett program kan vara tillfälligt låsta – appen varnar och försöker igen vid nästa ändring.

### Reserv: export/import
Fungerar i alla webbläsare: exportera JSON till mappen efter ändringar och låt övriga importera filen. Importen slår ihop nya och uppdaterade projekt.

## Tekniska begränsningar (offline/SharePoint)
En ren HTML-fil kan bara skriva data via webbläsarens filåtkomst-API (Chrome/Edge) eller nedladdning – därför används datafilen `projektdata.json` som "databas". Full samtidig redigering som i ett webbverktyg går inte att få i offline-HTML.
