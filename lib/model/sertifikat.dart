class sertifikat {
  bool? isSuccess;
  String? message;
  String? error;
  List<Data3>? data;

  sertifikat(
      {this.isSuccess, this.message, this.error, this.data});

  sertifikat.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    error = json['error'];
    if (json['data'] != null) {
      data = <Data3>[];
      json['data'].forEach((v) {
        data!.add(new Data3.fromJson(v));
      });
    }
  }

  factory sertifikat.withError(String error) =>
      sertifikat(error: error);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data3 {
  int? id;
  int? kebunId;
  int? sertifikasiId;
  String? sertifikasiName;
  String? sertifikasiNo;
  String? sertifikasiDari;
  String? sertifikasiSampai;
  String? sertifikasiImage;
  String? rowStatus;

  Data3(
      {this.id,
        this.kebunId,
        this.sertifikasiId,
        this.sertifikasiName,
        this.sertifikasiNo,
        this.sertifikasiDari,
        this.sertifikasiSampai,
        this.sertifikasiImage,
        this.rowStatus});

  Data3.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kebunId = json['kebun_id'];
    sertifikasiId = json['sertifikasi_id'];
    sertifikasiName = json['sertifikasi_name'];
    sertifikasiNo = json['sertifikasi_no'];
    sertifikasiDari = json['sertifikasi_dari'];
    sertifikasiSampai = json['sertifikasi_sampai'];
    sertifikasiImage = json['sertifikasi_image'];
    rowStatus = json['row_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kebun_id'] = this.kebunId;
    data['sertifikasi_id'] = this.sertifikasiId;
    data['sertifikasi_name'] = this.sertifikasiName;
    data['sertifikasi_no'] = this.sertifikasiNo;
    data['sertifikasi_dari'] = this.sertifikasiDari;
    data['sertifikasi_sampai'] = this.sertifikasiSampai;
    data['sertifikasi_image'] = this.sertifikasiImage;
    data['row_status'] = this.rowStatus;
    return data;
  }
}