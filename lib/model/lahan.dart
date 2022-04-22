class lahan {
  bool? isSuccess;
  String? message;
  List<Data2>? data;
  String? error;

  lahan({this.isSuccess, this.message, this.data, this.error});

  lahan.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data2>[];
      json['data'].forEach((v) {
        data!.add(new Data2.fromJson(v));
      });
    }
  }

  factory lahan.withError(String error) => lahan(error: error);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data2 {
  int? statusLahanId;
  String? statusLahanName;

  Data2({this.statusLahanId, this.statusLahanName});

  Data2.fromJson(Map<String, dynamic> json) {
    statusLahanId = json['status_lahan_id'];
    statusLahanName = json['status_lahan_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_lahan_id'] = this.statusLahanId;
    data['status_lahan_name'] = this.statusLahanName;
    return data;
  }
}
