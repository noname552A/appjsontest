class bibit {
  bool? isSuccess;
  String? message;
  List<Data>? data;
  String? error;

  bibit({this.isSuccess, this.message, this.data, this.error});

  bibit.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  factory bibit.withError(String error) => bibit(error: error);

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

class Data {
  int? jenisBibitId;
  Null? jenisBibit;
  String? jenisBibitName;
  Null? keteranganBibit;

  Data(
      {this.jenisBibitId,
        this.jenisBibit,
        this.jenisBibitName,
        this.keteranganBibit});

  Data.fromJson(Map<String, dynamic> json) {
    jenisBibitId = json['jenis_bibit_id'];
    jenisBibit = json['jenis_bibit'];
    jenisBibitName = json['jenis_bibit_name'];
    keteranganBibit = json['keterangan_bibit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jenis_bibit_id'] = this.jenisBibitId;
    data['jenis_bibit'] = this.jenisBibit;
    data['jenis_bibit_name'] = this.jenisBibitName;
    data['keterangan_bibit'] = this.keteranganBibit;
    return data;
  }
}
