class AppExceptions implements Exception {
  final messages;
  final prefix;

  AppExceptions([this.messages, this.prefix]);

  @override
  String toString() {
    return "$prefix$messages";
  }
}

class NoInternetException extends AppExceptions {
  NoInternetException([String? messages]) : super(messages, 'No Internet');
}

class NoServiceFoundException extends AppExceptions {}

class InvalidFormatException extends AppExceptions {}

class UnknownException extends AppExceptions {}

class TimeoutException extends AppExceptions {
  TimeoutException([String? messages]) : super(messages, 'Request Timeout');
}

class InvalidURLException extends AppExceptions {
  InvalidURLException([String? messages]) : super(messages, 'INVALID URL');
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? messages]) : super(messages, '');
}

class APIException extends AppExceptions {
  APIException([String? messages, String? prefix])
      : super(messages, 'API EXCEPTION ');
}
