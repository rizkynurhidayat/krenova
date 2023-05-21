class BatikModel {
  String? nama, detail, link, foto;

  BatikModel({
    this.nama,
    this.link,
    this.detail,
    this.foto,
  });

  factory BatikModel.fromJson(Map<String, dynamic> json) => BatikModel(
        nama: json['nama'],
        link: json['link'],
        detail: json['detail'],
        foto: json['foto'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['detail'] = detail;
    data['link'] = link;
    data['foto'] = foto;

    return data;
  }
}
