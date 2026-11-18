/// Build-time configuration, passed with `--dart-define` or
/// `--dart-define-from-file=.env`. Never hard-code secrets here.
/// Every name used here must also be listed in `.env.example`.
class Env {
  const Env({required this.supabaseUrl, required this.supabasePublishableKey});

  /// Values compiled into this build.
  factory Env.fromEnvironment() => const Env(
    supabaseUrl: String.fromEnvironment('SUPABASE_URL'),
    supabasePublishableKey: String.fromEnvironment('SUPABASE_PUBLISHABLE_KEY'),
  );

  final String supabaseUrl;
  final String supabasePublishableKey;

  /// True when both Supabase values were provided at build time.
  bool get hasSupabase =>
      supabaseUrl.isNotEmpty && supabasePublishableKey.isNotEmpty;
}
