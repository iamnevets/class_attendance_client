class ReturnObject {
  dynamic data;
  bool? success = false;
  String message = '';

  ReturnObject({required this.data, required this.success, required this.message});

  factory ReturnObject.fromJson(Map<String, dynamic> json) {
    final ReturnObject returnObject = ReturnObject(data: json['data'], success: json['success'], message: json['message']);

    returnObject.success ??= false;

    return returnObject;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.data != null) {
  //     data['data'] = this.data.toJson();
  //   }
  //   data['success'] = this.success;
  //   data['message'] = this.message;
  //   return data;
  // }
}
