class Datadokumen {
  int? dokumenId;
  String? dokumenName;
  String? dokumenNoBlanko;
  String? foto;

  Datadokumen(
      {this.dokumenId,
        this.dokumenName,
        this.dokumenNoBlanko,
        this.foto,
      });

  Datadokumen.fromJson(Map<String, dynamic> json) {
    dokumenId = json['dokumen_id'];
    dokumenName = json['dokumen_name'];
    dokumenNoBlanko = json['dokumen_no_blanko'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dokumen_id'] = this.dokumenId;
    data['dokumen_name'] = this.dokumenName;
    data['dokumen_no_blanko'] = this.dokumenNoBlanko;
    data['foto'] = this.foto;
    return data;
  }
}
