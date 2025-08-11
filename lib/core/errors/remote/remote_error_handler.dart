import 'package:scene/core/errors/app_exception.dart';

class RemoteErrorHandler implements AppException {
  @override
  final String message;

  RemoteErrorHandler({required this.message});

  @override
  String toString() {
    return message;
  }
}
