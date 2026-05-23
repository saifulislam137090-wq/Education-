---
name: testing-x-ray
description: Test the X-Ray Flutter app end-to-end. Use when verifying UI changes to the X-Ray home screen or adding new screens/widgets.
---

# Testing X-Ray Flutter App

## Prerequisites

- Flutter SDK installed (tested with 3.44.0 stable)
- Chrome browser available
- No external credentials needed — self-contained UI app

## Environment Setup

1. Install Flutter SDK if not present:
   ```bash
   curl -sL https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.44.0-stable.tar.xz -o flutter.tar.xz
   tar xf flutter.tar.xz && rm flutter.tar.xz
   export PATH="$HOME/flutter/bin:$PATH"
   ```

2. Enable web platform:
   ```bash
   flutter config --enable-web
   ```

3. If the project was created without web support, add it:
   ```bash
   flutter create --platforms web .
   ```

## Running the App for Testing

Flutter's `flutter run -d chrome` may fail if Chrome is already running. Use web-server mode instead:

```bash
flutter run -d web-server --web-port=8080
```

Then open `http://localhost:8080` in the existing Chrome browser.

## Lint & Analysis

```bash
flutter analyze
flutter test
```

## Key UI Flows to Test

### State 1 (Idle) — Default View
- Top app bar: profile avatar (left), "X-Ray" title (center), settings gear (right)
- Pill-shaped search bar with placeholder "Search Grok for unfiltered truth..."
- Centered Grok Diamond Spark icon with "Cut through the noise" title
- Bottom nav: 5 icons — Home (blue), Search, Grok Spark, Bell, Bookmark (gray)

### State 2 (Search Results)
- Tap the search bar → dialog opens
- Type a query and click "Search"
- Verification card appears with "Verified by Grok" header
- 3 bullet-point summaries, 3-image grid, trust score progress bar
- Close (X) icon returns to State 1

## Common Issues

- `flutter run -d chrome` fails when Chrome is already open — use `-d web-server` instead
- `--web-renderer` flag may not exist in newer Flutter versions — omit it
- If web platform not configured, run `flutter create --platforms web .` in the project root

## Devin Secrets Needed

None — this is a self-contained UI application with no backend or API dependencies.
