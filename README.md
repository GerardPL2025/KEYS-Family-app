# KEYS Family

A Flutter app, built for the web first (Android and iOS folders are ready for later).
Backend: Supabase (database + logins). Hosting: Firebase Hosting.

## Prerequisites

* Flutter — the exact version in [`.flutter-version`](.flutter-version).
  In the Claude Code cloud, `scripts/cloud-setup.sh` installs it.
* Chrome (to run the app and the end-to-end tests) and `chromedriver` (end-to-end tests only).

## Run locally

```bash
cp .env.example .env   # then fill in the values
flutter pub get
flutter run -d chrome --dart-define-from-file=.env
```

Without Supabase values the app still starts; it just doesn't connect to a backend.

## Tests and checks

| Command | What it does |
|---|---|
| `scripts/check.sh` | `flutter analyze`, `flutter test`, `flutter build web`. Fails if any step fails. |
| `flutter test` | Unit and widget tests in `test/` |
| `scripts/e2e.sh` | End-to-end tests in `integration_test/`, in headless Chrome |

A Claude Code Stop hook (`.claude/settings.json`) runs `scripts/check.sh` before Claude
finishes a task, and makes Claude keep fixing things if it fails (at most 3 times in a row).

## CI and deploys

* `.github/workflows/ci.yml` — on every pull request: `scripts/check.sh` and the end-to-end tests.
* `.github/workflows/deploy.yml` — builds the web app and deploys to Firebase Hosting:
  a preview link (posted as a PR comment) for every pull request, and the live site when `main` changes.

GitHub settings it needs:

| Name | Kind | Value |
|---|---|---|
| `FIREBASE_SERVICE_ACCOUNT` | Secret | JSON key of a Firebase Hosting service account |
| `FIREBASE_PROJECT_ID` | Variable | Firebase project ID |
| `SUPABASE_URL` | Secret (optional) | Supabase project URL |
| `SUPABASE_PUBLISHABLE_KEY` | Secret (optional) | Supabase publishable key |

## Database

Change the database only with migration files in `supabase/migrations/`.
Every table with user data must have Row Level Security turned on.

## Updating Flutter

Change the version in `.flutter-version` (and `FALLBACK_FLUTTER_VERSION` in
`scripts/cloud-setup.sh`, plus the copy pasted in the cloud environment settings),
then run `scripts/check.sh`.
