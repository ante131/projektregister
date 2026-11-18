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
- - **Filer & länkar** – länka till dokument, eller bifoga fil(er) direkt: när den gemensamma mappen är ansluten sparas bifogade filer i undermappen `projektfiler` i SharePoint-mappen (gräns 200 MB per fil, tar ingen plats i registret); utan ansluten mapp lagras små filer inne i registret (max 10 MB). Bifogade filer kan hämtas av alla som är anslutna till mappen, och tas även bort ur mappen vid radering per fil; totalgräns för lagringen är ca 5–10 MB – länka större dokument till SharePoint-mappen)
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
4. Appen **kommer ihåg filen** mellan öppningar. Vid nästa start sker **automatisk återanslutning** om webbläsaren tillåter (Chrome kan komma ihåg filåtkomsten – i så fall synkar allt utan klick). Annars visar knappen "📁 Fortsätt med projektdata.json" – ett enda klick, ingen filbläddring.
5. Medan appen är öppen **hämtas kollegors ändringar automatiskt var 20:e sekund** (och när fönstret blir aktivt igen) och era ändringar skrivs till filen direkt.

**OBS:**
- SharePoint synkar filen till andras datorer via OneDrive-synk (kan ta någon minut).
- Undvik att två personer redigerar **samma projekt** samtidigt – vid anslutning hämtas alltid den senast sparade versionen per projekt in, men håll korta arbetspass och anslut på nytt innan du börjar.
- Filer som någon annan har öppen i ett program kan vara tillfälligt låsta – appen varnar och försöker igen vid nästa ändring.

### Om en konfliktkopia dyker upp (projektdata-NAMN.json)
OneDrive/SharePoint skapar en konfliktkopia om två datorer skriver till filen innan synkningen hunnit med. Så löser du det:
1. Kontrollera vilken fil som är "huvudfilen" (den appen visar i statusraden). Helst den som senast synkats klart.
2. Öppna appen, klicka **⬆ Importera** och välj konfliktkopieran – appen slår ihop alla projekt/ändringar i den i huvudfilen (inget går förlorat).
3. Klicka 🔄 Synka nu så skrivs den sammanslagna datan till huvudfilen.
4. Ta bort konfliktkopieran ur mappen och låt alla andra klicka 🔄 Synka nu.
5. Undvik framöver att redigera samtidigt som andra – appen skyddar data per projekt, men OneDrive gillar inte samtidiga skrivningar (håll appen öppen i en flik och det fungerar bra i vardagen).

### Reserv: export/import
Fungerar i alla webbläsare: exportera JSON till mappen efter ändringar och låt övriga importera filen. Importen slår ihop nya och uppdaterade projekt.

## Tekniska begränsningar (offline/SharePoint)
En ren HTML-fil kan bara skriva data via webbläsarens filåtkomst-API (Chrome/Edge) eller nedladdning – därför används datafilen `projektdata.json` som "databas". Full samtidig redigering som i ett webbverktyg går inte att få i offline-HTML.

## Starta appen utan mappbladdring (startfil)
Chrome blockerar normalt lagring av mappbeorigheter for lokala filer, vilket tidigare kravde att man bladdrade fram den gemensamma mappen vid varje omstart. Med startfilen **`Starta Projektregister.bat`** startas Chrome med flagget `--allow-file-access-from-files`:

1. Lagg `Starta Projektregister.bat` i er SharePoint-mapp (eller pa skrivbordet).
2. Allt-justera vid behov: hogerklicka -> Redigera, andra raden `set "HTML=..."` sa att den pekar pa er index.html.
3. Dubbelklicka bat-filen for att starta appen. Vid start visas appens popup -> klicka **Anslut nu** -> webblasarens behorighetsdialog visas -> tryck **Tillat**. KLART - ingen mappbladdring, och Chrome sparar mappen mellan omstarter.

OBS: flagget `--allow-file-access-from-files` slackter en av Chromes sandlade-regler for lokala filer. Det ar en avvagning mot funktionalitet for interna verktyg. Om er IT-avdelning har policy mot bat-filer kan Chrome genvagen istallet skapas manuellt: hogerklicka pa Chrome-genvagen -> Eigenskaper -> mal: `chrome.exe --allow-file-access-from-files "file:///C:/Users/DITTNAMN/Kommunsamverkan/UPP-SSF-Tekniska-VA/index.html"`.
