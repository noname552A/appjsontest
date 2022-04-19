class kota {
  bool? isSuccess;
  String? message;
  List<Data2>? data;
  String? error;

  kota({this.isSuccess, this.message, this.data, this.error});

  kota.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data2>[];
      json['data'].forEach((v) {
        data!.add(new Data2.fromJson(v));
      });
    }
  }

  factory kota.withError(String error) =>
      kota(error: error);


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
  int? kabupatenKotaId;
  int? provinsiId;
  String? kabupatenKotaName;

  Data2({this.kabupatenKotaId, this.provinsiId, this.kabupatenKotaName});

  Data2.fromJson(Map<String, dynamic> json) {
    kabupatenKotaId = json['kabupaten_kota_id'];
    provinsiId = json['provinsi_id'];
    kabupatenKotaName = json['kabupaten_kota_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kabupaten_kota_id'] = this.kabupatenKotaId;
    data['provinsi_id'] = this.provinsiId;
    data['kabupaten_kota_name'] = this.kabupatenKotaName;
    return data;
  }
}
