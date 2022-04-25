class Datasertifikat {
  int? sertifikasiId;
  String? sertifikasiName;
  String? sertifikasiNomor;
  String? sertifikasiTanggalDari;
  String? sertifikasiTanggalSampai;
  String? foto;


  Datasertifikat({this.sertifikasiId, this.sertifikasiName, this.sertifikasiNomor, this.sertifikasiTanggalDari, this.sertifikasiTanggalSampai, this.foto});

  Datasertifikat.fromJson(Map<String, dynamic> json) {
    sertifikasiId = json['sertifikasi_id'];
    sertifikasiName = json['sertifikasi_name'];
    sertifikasiNomor = json["sertifikasi_nomor"];
    sertifikasiTanggalDari = json['sertifikasi_tanggal_dari'];
    sertifikasiTanggalSampai = json['serifikasi_tanggal_sampai'];
    foto = json["foto"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sertifikasi_id'] = this.sertifikasiId;
    data['sertifikasi_name'] = this.sertifikasiName;
    data['sertifikasi_nomor'] = this.sertifikasiNomor;
    data['sertifikasi_tanggal_dari'] = this.sertifikasiTanggalDari;
    data['sertifikasi_tanggal_sampai'] = this.sertifikasiTanggalSampai;
    data['foto'] = this.foto;
    return data;
  }
}