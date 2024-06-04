// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SpkOverDisc {
  String? NoMutasi;
  String? Tanggal;
  String? Tujuan_Kirim;
  String? Keterangan;
  String? Pembuat;
  String? Keputusan;

  SpkOverDisc({
    this.NoMutasi,
    this.Tanggal,
    this.Tujuan_Kirim,
    this.Keterangan,
    this.Pembuat,
    this.Keputusan,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'NoMutasi': NoMutasi,
      'Tanggal': Tanggal,
      'Tujuan_Kirim': Tujuan_Kirim,
      'Keterangan': Keterangan,
      'Pembuat': Pembuat,
      'Keputusan': Keputusan,
    };
  }

  factory SpkOverDisc.fromMap(Map<String, dynamic> map) {
    return SpkOverDisc(
      NoMutasi: map['NoMutasi'] != null ? map['NoMutasi'] as String : null,
      Tanggal: map['Tanggal'] != null ? map['Tanggal'] as String : null,
      Tujuan_Kirim:
          map['Tujuan_Kirim'] != null ? map['Tujuan_Kirim'] as String : null,
      Keterangan:
          map['Keterangan'] != null ? map['Keterangan'] as String : null,
      Pembuat: map['Pembuat'] != null ? map['Pembuat'] as String : null,
      Keputusan: map['Keputusan'] != null ? map['Keputusan'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SpkOverDisc.fromJson(String source) =>
      SpkOverDisc.fromMap(json.decode(source) as Map<String, dynamic>);
}
