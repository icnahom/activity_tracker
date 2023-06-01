import 'package:flutter/foundation.dart';

enum Status {
  idle,
  loading,
  success,
  error;

  bool get isIdle => this == idle;
  bool get isLoading => this == loading;
  bool get isSuccess => this == success;
  bool get isError => this == error;
}

mixin StatusProviderMixin on ChangeNotifier {
  Status get status => _status;
  Status _status = Status.idle;
  set status(Status value) {
    if (_status == value) return;
    _status = value;
    notifyListeners();
  }
}
