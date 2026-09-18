# PC Booking App — Generatore QR Code per Prenotazioni (Flutter)

Applicazione mobile Flutter per la prenotazione di postazioni PC, con generazione di un QR Code associato a ciascuna prenotazione tramite chiamata a un backend REST.

## 📋 Descrizione

Il progetto è uno scaffold Flutter avviato a partire dal template standard (`flutter create`) e successivamente esteso con una funzionalità di generazione QR Code. L'utente, tramite un pulsante, invia una richiesta al backend con l'ID di una prenotazione; il server restituisce i dati del codice QR corrispondente, che l'app è predisposta a mostrare a schermo (la visualizzazione vera e propria è al momento disattivata nel codice).

## 🗂️ Struttura del progetto

```
flutter_application_1/
├── lib/
│   ├── main.dart      # Entry point generato dal template Flutter (counter demo)
│   └── MyApp.dart      # Logica della PC Booking App (generazione QR Code)
├── pubspec.yaml         # Dipendenze e configurazione del progetto
├── android/, ios/, web/, windows/, macos/, linux/   # Codice nativo per ciascuna piattaforma
└── test/
    └── widget_test.dart # Test di base generato dal template
```

## ⚠️ Nota importante sulla struttura attuale

Il progetto contiene **due file con logica di avvio in conflitto**:

- `main.dart` definisce `void main()` e una classe `MyApp` con il classico contatore demo generato da `flutter create`.
- `MyApp.dart` definisce **anch'esso** `void main()` e **anch'esso** una classe `MyApp`, ma con la vera logica applicativa (la "PC Booking App").

Poiché sono due file separati con la stessa classe `MyApp` e la stessa funzione `main()`, **il progetto non compila così com'è** finché entrambi i file sono importati insieme nello stesso build, e ad oggi è `main.dart` (il file standard generato dal template) a essere effettivamente eseguito, non la logica di prenotazione. Prima di proseguire lo sviluppo è necessario:

1. Scegliere un solo file come entry point (tipicamente `main.dart`).
2. Spostare la logica di `MyApp.dart` dentro `main.dart`, oppure rinominare la classe in `MyApp.dart` (es. `BookingApp`) ed effettuare l'import esplicito da `main.dart`, richiamandola in `runApp()`.

## ⚙️ Requisiti

- Flutter SDK (Dart >= 3.3.1, come da `pubspec.yaml`)
- Un IDE con supporto Flutter (Android Studio, VS Code con estensione Flutter, ecc.)
- Un backend raggiungibile su `http://localhost:3000/api/generateQR` che risponda con un JSON contenente il campo `qrCode`, per testare la generazione del codice

## 📦 Dipendenze principali

| Pacchetto | Utilizzo |
|---|---|
| `http` | Esecuzione della richiesta POST verso il backend di generazione QR |
| `qr_flutter` | Rendering del QR Code a schermo (import presente, utilizzo attualmente commentato) |
| `fluttertoast` | Notifiche toast in caso di errore nella chiamata al backend |
| `cupertino_icons` | Icone in stile iOS |
| `flutter_lints` | Regole di lint raccomandate (dev dependency) |

## 🚀 Installazione

1. Assicurati di avere Flutter installato (`flutter --version` per verificare).
2. Clona il repository e posizionati nella cartella `flutter_application_1`.
3. Installa le dipendenze:
   ```bash
   flutter pub get
   ```
4. Risolvi il conflitto tra `main.dart` e `MyApp.dart` descritto sopra prima di lanciare l'app.
5. Avvia un backend locale sulla porta 3000 che esponga l'endpoint `POST /api/generateQR` (accetta `{"bookingId": "..."}` e risponde con `{"qrCode": "..."}`), oppure aggiorna l'URL nel codice se il backend è ospitato altrove.
6. Avvia l'app:
   ```bash
   flutter run
   ```

## 💻 Utilizzo (funzionalità prevista)

1. L'utente apre l'app e vede un pulsante "Generate QR Code".
2. Alla pressione, l'app invia una richiesta `POST` al backend con un `bookingId` (attualmente hardcoded come `'your_booking_id'` — da collegare a una vera selezione/prenotazione).
3. Se la richiesta ha successo (status 200), i dati del QR Code vengono salvati nello stato dell'app.
4. Se la richiesta fallisce, viene mostrato un toast di errore ("Failed to generate QR Code") tramite `fluttertoast`.
5. Durante la chiamata di rete viene mostrato un indicatore di caricamento (`CircularProgressIndicator`).

## 🛠️ Tecnologie utilizzate

- **Flutter / Dart**
- **HTTP client** (`http` package) per la comunicazione con il backend
- **qr_flutter** per la generazione/visualizzazione di QR Code
- **fluttertoast** per le notifiche non bloccanti

## ⚠️ Limitazioni note / possibili miglioramenti

- **Conflitto tra `main.dart` e `MyApp.dart`** (vedi sezione dedicata sopra): il progetto non è nello stato in cui la logica di prenotazione viene effettivamente eseguita.
- La visualizzazione del QR Code generato è **commentata** nel codice (`QrImage(data: qrCode)`): la UI non mostra ancora il risultato della chiamata.
- L'ID prenotazione (`bookingId`) è **hardcoded**, non collegato a un flusso reale di selezione/prenotazione.
- L'URL del backend (`http://localhost:3000`) è cablato nel codice: andrebbe estratto in una configurazione (es. file `.env` o costante separata) per poter puntare facilmente ad ambienti diversi (sviluppo, staging, produzione).
- Manca la gestione di eventuali timeout di rete o errori di parsing della risposta JSON.
- Il backend che espone `/api/generateQR` non fa parte di questo repository: è un progetto separato necessario per il funzionamento end-to-end dell'app.

## 📄 Licenza

Progetto realizzato a scopo di esercitazione personale.
