import 'api_status.dart';

class ApiResponse<T> {
  ApiStatus? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.none() : status = ApiStatus.none;

  ApiResponse.loading() : status = ApiStatus.loading;

  ApiResponse.success(this.data) : status = ApiStatus.success;

  ApiResponse.failed(this.message) : status = ApiStatus.failure;

  @override
  String toString() {
    return "Status: $status \n Message:$message \n Data: $data";
  }

}

class ResponseFormat {
  int? statusCode;
  String? requestResult;
  Map<String, dynamic>? data;

  ResponseFormat({this.statusCode, this.requestResult, this.data});

  ResponseFormat.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    requestResult = json['request_result'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['request_result'] = requestResult;
    data['data'] = this.data;
    return data;
  }
}

// class ApiStatus {
//   int? status_code;
//   String? request_result;

//   ApiStatus({this.status_code, this.request_result});

//   ApiStatus.fromJson(Map<String, dynamic> json) {
//     status_code = json['status_code'];
//     request_result = json['request_result'];
//   }
// }
