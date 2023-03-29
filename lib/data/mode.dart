class BatikModel {
  String? nama, detail, link;

  BatikModel({
    this.nama,
    this.link,
    this.detail,
  });

  factory BatikModel.fromJson(Map<String, dynamic> json) => BatikModel(
        nama: json['nama'],
        link: json['link'],
        detail: json['detail'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['detail'] = detail;
    data['link'] = link;

    return data;
  }
}
