enum AppEnvironment { dev, stage, prod }

abstract class EnvInfo {
  static AppEnvironment _environment = AppEnvironment.dev;

  static void initialize(AppEnvironment environment) {
    EnvInfo._environment = environment;
  }

  static String get appName => _environment._appTitle;
  static String get envName => _environment._envName;
  static String get connectionString => _environment._connectionString;
  static AppEnvironment get environment => _environment;
  static bool get isProduction => _environment == AppEnvironment.prod;
}

extension _EnvProperties on AppEnvironment {
  static const _appTitles = {
    AppEnvironment.dev: 'Riverpod Sample Dev',
    AppEnvironment.stage: 'Riverpod Sample Stage',
    AppEnvironment.prod: 'Riverpod Sample Prod',
  };

  static const _connectionStrings = {
    AppEnvironment.dev: 'https://dev.swan-aws.com/',
    AppEnvironment.stage: 'https://dev.swan-aws.com/',
    AppEnvironment.prod: 'https://dev.swan-aws.com/',
  };

  static const _envs = {
    AppEnvironment.dev: 'dev',
    AppEnvironment.stage: 'staging',
    AppEnvironment.prod: 'prod',
  };

  String get _appTitle => _appTitles[this]!;
  String get _envName => _envs[this]!;
  String get _connectionString => _connectionStrings[this]!;
}
