class sertifikat2 {
  bool? isSuccess;
  String? message;
  List<Data2>? data;
  String? error;

  sertifikat2({this.isSuccess, this.message, this.data, this.error});

  sertifikat2.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data2>[];
      json['data'].forEach((v) {
        data!.add(new Data2.fromJson(v));
      });
    }
  }

  factory sertifikat2.withError(String error) =>
      sertifikat2(error: error);

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
  int? sertifikasiId;
  String? sertifikasiName;
  String? sertifikasiNomor;
  String? sertifikasiTanggalDari;
  String? sertifikasiTanggalSampai;


  Data2({this.sertifikasiId, this.sertifikasiName, this.sertifikasiNomor, this.sertifikasiTanggalDari, this.sertifikasiTanggalSampai});

  Data2.fromJson(Map<String, dynamic> json) {
    sertifikasiId = json['sertifikasi_id'];
    sertifikasiName = json['sertifikasi_name'];
    sertifikasiNomor = json["sertifikasi_nomor"];
    sertifikasiTanggalDari = json['sertifikasi_tanggal_dari'];
    sertifikasiTanggalSampai = json['serifikasi_tanggal_sampai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sertifikasi_id'] = this.sertifikasiId;
    data['sertifikasi_name'] = this.sertifikasiName;
    data['sertifikasi_nomor'] = this.sertifikasiNomor;
    data['sertifikasi_tanggal_dari'] = this.sertifikasiTanggalDari;
    data['sertifikasi_tanggal_sampai'] = this.sertifikasiTanggalSampai;
    return data;
  }
}
