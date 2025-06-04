import 'package:logger/logger.dart';

class DebugLog {
  static final DebugLog _instance = DebugLog._internal();

  late final Logger _logger;

  DebugLog._internal() {
    _logger = Logger(
      printer: PrefixPrinter(
        PrettyPrinter(
          methodCount: 0,
          printEmojis: true,
          noBoxingByDefault: true,
          levelEmojis: {
            Level.debug: '💬',
            Level.warning: '⚠️',
            Level.error: '❌',
          },
        ),
        debug: "[DEBUG]",
      ),
    );
  }

  factory DebugLog() {
    return _instance;
  }

  void debug(String message) {
    _logger.d(message);
  }

  void warning(String message) {
    _logger.w(message);
  }

  void error(String message) {
    _logger.e(message);
  }
  
}
