import 'response.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? messages;

  ApiResponse(this.status, this.data, this.messages);

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.LOADING;
  ApiResponse.error(this.messages) : status = Status.ERROR;

  @override
  String toString() {
    return "Status: $status \n Messages: $messages \n Data: $data  ";
  }
}
