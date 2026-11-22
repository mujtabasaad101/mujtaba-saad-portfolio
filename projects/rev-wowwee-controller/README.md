# R.E.V WowWee Bluetooth Controller

A browser-based controller for a WowWee R.E.V vehicle using the Web Bluetooth API.

## Features
- Connect to a nearby R.E.V device over Bluetooth Low Energy.
- Dual touch joysticks for forward/reverse and left/right steering.
- Keyboard controls: arrow keys or W/A/S/D.
- Connection status, notification log, and fullscreen landscape mode.
- Joysticks return to center when released.

## Run it
Open `index.html` in a supported Chromium browser on a secure context (HTTPS or localhost), then press **Connect** and select the R.E.V device. **All devices** opens the broader Bluetooth device picker.

Web Bluetooth is not supported by every browser (notably iOS Safari). Bluetooth access also requires a compatible device and browser permission.

## Safety
Use the controller in an open, safe area and keep the vehicle in sight. Disconnect before handling or servicing the vehicle.

## Source
[`index.html`](./index.html)
