class Pengumuman {
  final int id;
  final String judul;
  final String isi;
  final String gambar;

  Pengumuman({
    required this.id,
    required this.judul,
    required this.isi,
    required this.gambar,
  });

  factory Pengumuman.fromJson(Map<String, dynamic> json) {
    return Pengumuman(
      id: json['id'],
      judul: json['judul'],
      isi: json['isi'],
      gambar: json['gambar'],
    );
  }
}
