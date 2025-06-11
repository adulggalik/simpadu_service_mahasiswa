import 'package:flutter/material.dart';
import 'package:sistem_kel3/models/pengumuman.dart';
import 'package:sistem_kel3/services/api_service.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _showProfileMenu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
              child: Text(
                '',
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 18,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard, color: Colors.white),
              title: Text('Beranda', style: TextStyle(color: Colors.white)),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.check_circle_outline, color: Colors.white),
              title: Text('Presensi', style: TextStyle(color: Colors.white)),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.school, color: Colors.white),
              title: Text('Akademik', style: TextStyle(color: Colors.white)),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.grade, color: Colors.white),
              title: Text('Hasil Studi', style: TextStyle(color: Colors.white)),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header dengan menu dan profil
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder: (context) => IconButton(
                      icon: Icon(Icons.menu, color: Colors.grey),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        setState(() => _showProfileMenu = !_showProfileMenu),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.transparent,
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage('images/profil.png'),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              if (_showProfileMenu)
                Padding(
                  padding: const EdgeInsets.only(top: 8, right: 20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage:
                                      AssetImage('images/profil.png'),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Muhammad Rafly Adriazka',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        'rafka@gmail.com',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                        overflow: TextOverflow.clip,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            _ProfileMenuItem(
                              icon: Icons.person,
                              title: 'Profil',
                              onTap: () => setState(() => _showProfileMenu = false),
                            ),
                            Stack(
                              children: [
                                _ProfileMenuItem(
                                  icon: Icons.assignment,
                                  title: 'Tugas',
                                  onTap: () => setState(() => _showProfileMenu = false),
                                ),
                                Positioned(
                                  right: 16,
                                  top: 8,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      '3',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            _ProfileMenuItem(
                              icon: Icons.settings,
                              title: 'Pengaturan Akun',
                              onTap: () => setState(() => _showProfileMenu = false),
                            ),
                            Divider(height: 1),
                            _ProfileMenuItem(
                              icon: Icons.logout,
                              title: 'Logout',
                              textColor: Colors.red,
                              iconColor: Colors.red,
                              onTap: () {
                                setState(() => _showProfileMenu = false);
                                // Tambahkan logika logout di sini
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 24),
              Text(
                'Yuk, intip progress dan info penting kuliahmu disini',
                style: TextStyle(color: Colors.grey[600]),
              ),
              const SizedBox(height: 16),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage('images/banner 1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _ProgressCard(
                title: 'Progres Perkuliahan Semester Ini',
                percent: 0.35,
                color: Colors.orange,
                description: 'Perjalanan masih panjang, tetap semangat yaa.',
              ),
              const SizedBox(height: 12),
              _ProgressCard(
                title: 'Progres Kehadiran',
                percent: 1.0,
                color: Colors.green,
                description: 'Hadir terus! Mantap, pertahankan konsistensinya.',
              ),
              const SizedBox(height: 12),
              _ProgressCard(
                title: 'Total Tagihan UKT',
                percent: 0.5,
                color: Colors.blue,
                description:
                    'Masih ada sisa Rp.1.500.000 nih. gak ga buru buru kok, cicil aja pelan - pelan',
              ),
              const SizedBox(height: 24),
              Text(
                'Cek Kehadiranmu Hari Ini',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _AttendanceTile(
                      title: 'Keamanan Jaringan',
                      lecturer: 'KOES WIYATMOKO',
                      time: '08.00 - 09.40',
                      statusText: 'Hadir',
                      statusColor: Colors.green,
                    ),
                    const SizedBox(height: 16),
                    _AttendanceTile(
                      title: 'Kecerdasan Buatan',
                      lecturer: 'Frista Rizky Rinandi, S.Kom., M.Kom',
                      time: '10.00 - 11.40',
                      statusText: 'Belum tercatat',
                      statusColor: Colors.grey,
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Lihat Semua Pengumuman',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Info Perkuliahan & Pengumuman',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              FutureBuilder<List<Pengumuman>>(
                future: ApiService.fetchPengumuman(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Gagal memuat pengumuman: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Text('Tidak ada pengumuman.');
                  }

                  return Column(
                    children: snapshot.data!.map((pengumuman) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: _AnnouncementCard(
                          title: pengumuman.judul,
                          date: 'Tanpa Tanggal',
                          content: pengumuman.isi,
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? textColor;

  const _ProfileMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Icon(icon, color: iconColor ?? Colors.black),
        title: Text(
          title,
          style: TextStyle(color: textColor ?? Colors.black),
        ),
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  final String title;
  final double percent;
  final Color color;
  final String description;

  const _ProgressCard({
    required this.title,
    required this.percent,
    required this.color,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          LinearProgressIndicator(
            value: percent,
            backgroundColor: color.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
          SizedBox(height: 8),
          Text(description, style: TextStyle(color: Colors.grey[700])),
        ],
      ),
    );
  }
}

// Diubah jadi StatefulWidget agar tombol "Hadir" bisa interaktif
class _AttendanceTile extends StatefulWidget {
  final String title;
  final String lecturer;
  final String time;
  final String statusText;
  final Color statusColor;

  const _AttendanceTile({
    required this.title,
    required this.lecturer,
    required this.time,
    required this.statusText,
    required this.statusColor,
  });

  @override
  State<_AttendanceTile> createState() => _AttendanceTileState();
}

class _AttendanceTileState extends State<_AttendanceTile> {
  bool _isButtonPressed = false;

  void _handleHadir() {
    setState(() {
      _isButtonPressed = true;
    });

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Kehadiran Tercatat'),
        content: Text('Kehadiran pada mata kuliah ${widget.title} berhasil tercatat.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    )),
                const SizedBox(height: 4),
                Text(widget.lecturer, style: TextStyle(color: Colors.grey[600])),
                const SizedBox(height: 6),
                Text(widget.time,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: widget.statusColor,
                    )),
              ],
            ),
          ),
          _isButtonPressed
              ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 229, 255, 199),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Hadir',
                    style: TextStyle(color: const Color.fromARGB(255, 81, 255, 0)),
                  ),
                )
              : ElevatedButton(
                  onPressed: _handleHadir,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 171, 40),
                  ),
                  child: const Text('Hadir',
                  style: TextStyle(color: Colors.white),
                  ),
                ),
        ],
      ),
    );
  }
}

class _AnnouncementCard extends StatelessWidget {
  final String title;
  final String date;
  final String content;

  const _AnnouncementCard({
    required this.title,
    required this.date,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 8),
          Text(date, style: TextStyle(color: Colors.grey[600])),
          const SizedBox(height: 12),
          Text(content),
        ],
      ),
    );
  }
}
