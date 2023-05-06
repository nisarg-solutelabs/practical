///standar response for the every function or methos
class Result<T> {
  ///initialize the response
  Result({this.isSuccess = true, this.message = '', this.data, this.exception});

  ///it will true if function executed successfully
  final bool isSuccess;

  ///message for the console or snackbar
  final String message;

  ///return data for the usage
  final T? data;

  ///itw will contains exception if it has any
  final List<Exception>? exception;
}
