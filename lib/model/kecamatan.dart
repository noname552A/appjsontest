class kecamatan {
  bool? isSuccess;
  String? message;
  List<Data3>? data;
  String? error;

  kecamatan({this.isSuccess, this.message, this.data, this.error});

  kecamatan.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data3>[];
      json['data'].forEach((v) {
        data!.add(new Data3.fromJson(v));
      });
    }
  }

  factory kecamatan.withError(String error) =>
      kecamatan(error: error);

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

class Data3 {
  int? kecamatanId;
  int? kabupatenKotaId;
  String? kecamatanName;

  Data3({this.kecamatanId, this.kabupatenKotaId, this.kecamatanName});

  Data3.fromJson(Map<String, dynamic> json) {
    kecamatanId = json['kecamatan_id'];
    kabupatenKotaId = json['kabupaten_kota_id'];
    kecamatanName = json['kecamatan_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kecamatan_id'] = this.kecamatanId;
    data['kabupaten_kota_id'] = this.kabupatenKotaId;
    data['kecamatan_name'] = this.kecamatanName;
    return data;
  }
}
