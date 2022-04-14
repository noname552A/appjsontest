class edit {
  bool? isSuccess;
  String? message;
  String? error;

  edit({this.isSuccess, this.message, this.error});

  edit.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
  }

  factory edit.withError(String error) =>
      edit(error: error);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    return data;
  }
}
