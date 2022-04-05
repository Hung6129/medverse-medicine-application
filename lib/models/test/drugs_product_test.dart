
class drugProductTest {
  String id;
  String tenThuoc;
  String dotPheDuyet;
  String soQuyetDinh;
  String pheDuyet;
  String soDangKy;
  String hoatChat;
  String phanLoai;
  String nongDo;
  String taDuoc;
  String baoChe;
  String dongGoi;
  String tieuChuan;
  String tuoiTho;
  String congTySx;
  String congTySxCode;
  String nuocSx;
  String diaChiSx;
  String congTyDk;
  String nuocDk;
  String diaChiDk;
  String nhomThuoc;
  String rate;

  drugProductTest({
    this.id,
    this.tenThuoc,
    this.dotPheDuyet,
    this.soQuyetDinh,
    this.pheDuyet,
    this.soDangKy,
    this.hoatChat,
    this.phanLoai,
    this.nongDo,
    this.taDuoc,
    this.baoChe,
    this.dongGoi,
    this.tieuChuan,
    this.tuoiTho,
    this.congTySx,
    this.congTySxCode,
    this.nuocSx,
    this.diaChiSx,
    this.congTyDk,
    this.nuocDk,
    this.diaChiDk,
    this.nhomThuoc,
    this.rate,
  });

  drugProductTest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenThuoc = json['tenThuoc'];
    dotPheDuyet = json['dotPheDuyet'];
    soQuyetDinh = json['soQuyetDinh'];
    pheDuyet = json['pheDuyet'];
    soDangKy = json['soDangKy'];
    hoatChat = json['hoatChat'];
    phanLoai = json['phanLoai'];
    nongDo = json['nongDo'];
    taDuoc = json['taDuoc'];
    baoChe = json['baoChe'];
    dongGoi = json['dongGoi'];
    tieuChuan = json['tieuChuan'];
    tuoiTho = json['tuoiTho'];
    congTySx = json['congTySx'];
    congTySxCode = json['congTySxCode'];
    nuocSx = json['nuocSx'];
    diaChiSx = json['diaChiSx'];
    congTyDk = json['congTyDk'];
    nuocDk = json['nuocDk'];
    diaChiDk = json['diaChiDk'];
    nhomThuoc = json['nhomThuoc'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tenThuoc'] = this.tenThuoc;
    data['dotPheDuyet'] = this.dotPheDuyet;
    data['soQuyetDinh'] = this.soQuyetDinh;
    data['pheDuyet'] = this.pheDuyet;
    data['soDangKy'] = this.soDangKy;
    data['hoatChat'] = this.hoatChat;
    data['phanLoai'] = this.phanLoai;
    data['nongDo'] = this.nongDo;
    data['taDuoc'] = this.taDuoc;
    data['baoChe'] = this.baoChe;
    data['dongGoi'] = this.dongGoi;
    data['tieuChuan'] = this.tieuChuan;
    data['tuoiTho'] = this.tuoiTho;
    data['congTySx'] = this.congTySx;
    data['congTySxCode'] = this.congTySxCode;
    data['nuocSx'] = this.nuocSx;
    data['diaChiSx'] = this.diaChiSx;
    data['congTyDk'] = this.congTyDk;
    data['nuocDk'] = this.nuocDk;
    data['diaChiDk'] = this.diaChiDk;
    data['nhomThuoc'] = this.nhomThuoc;
    data['rate'] = this.rate;
    return data;
  }
}
