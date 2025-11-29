// exceptions/api_exceptions.dart
class CustomException implements Exception {
  final String message;
  final String prefix;

  CustomException(this.message, this.prefix);

  @override
  String toString() {
    return "$prefix$message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String message = ""])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException([String message = ""])
      : super(message, "Invalid Request: ");
}

class UnauthorizedException extends CustomException {
  UnauthorizedException([String message = ""])
      : super(message, "Unauthorized: ");
}

class ForbiddenException extends CustomException {
  ForbiddenException([String message = ""])
      : super(message, "Forbidden: ");
}

class NotFoundException extends CustomException {
  NotFoundException([String message = ""])
      : super(message, "Not Found: ");
}

class ValidationException extends CustomException {
  final dynamic errors;

  ValidationException([this.errors, String message = ""])
      : super(message, "Validation Failed: ");
}

class InternalServerErrorException extends CustomException {
  InternalServerErrorException([String message = ""])
      : super(message, "Internal Server Error: ");
}