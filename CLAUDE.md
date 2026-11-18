# Project rules

## The app

[same one-sentence description]

## How to work

* Never push to main. Work on a branch.
* One feature or fix at a time.
* Every feature comes with tests, including one end-to-end test for the main thing a user does.
* For a bug, write a test that fails first, then fix it.
* Never delete, skip or weaken a test to make it pass.
* Before saying a task is done, run `scripts/check.sh` and show me the results.
* Never put passwords or API keys in the code. Use environment variables or --dart-define, and list the names in .env.example.
* Every database table with user data must have Row Level Security turned on.
* Database changes only through migration files.
* Don’t change the tech stack or add packages without asking.
* Keep a pinned Flutter version in one place, and use it in the setup script and in CI.

## When you finish a task, tell me

1. What changed, in plain English.
2. How to test it on the preview link, step by step.
3. Anything I need to set up myself, with click-by-click steps.

## Project map (for reference)

* Pinned Flutter version: `.flutter-version` (the one place; CI and `scripts/cloud-setup.sh` read it).
* App code: `lib/` (`lib/app.dart` home screen, `lib/config/env.dart` build-time config).
* Unit/widget tests: `test/`. End-to-end tests: `integration_test/`, run with `scripts/e2e.sh`.
* All checks: `scripts/check.sh` (analyze, test, build web).
* Database migrations: `supabase/migrations/`.
* CI: `.github/workflows/ci.yml`. Deploys: `.github/workflows/deploy.yml` (Firebase Hosting).
