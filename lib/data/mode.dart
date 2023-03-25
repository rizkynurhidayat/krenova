class BatikModel {
  String? nama, detail, link, foto;
  String? addTime, updateTime;

  BatikModel(
      {this.nama,
      this.link,
      this.foto,
      this.detail,
      this.addTime,
      this.updateTime});

  factory BatikModel.fromJson(Map<String, dynamic> json) => BatikModel(
      nama: json['nama'],
      link: json['link'],
      foto: json['foto'],
      detail: json['detail'],
      addTime: json['addTime'],
      updateTime: json['updateTime']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['detail'] = detail;
    data['link'] = link;
    data['foto'] = foto;
    data['addTime'] = addTime;
    data['updateTime'] = updateTime;
    return data;
  }
}
