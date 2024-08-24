class AppExceptions implements Exception {
  final String? message;
  final String? prefix;

  AppExceptions({this.message, this.prefix});

  String toString() {
    return '$prefix$message';
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message: message, prefix: 'Error During Communication');
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message])
      : super(message: message, prefix: 'Invalid Request');
}

class UnauthorisedException extends AppExceptions {
  UnauthorisedException([String? message])
      : super(message: message, prefix: 'Unauthorised Request');
}

class InvalidInputException extends AppExceptions {
  InvalidInputException([String? message])
      : super(message: message, prefix: 'Invalid Input');
}
