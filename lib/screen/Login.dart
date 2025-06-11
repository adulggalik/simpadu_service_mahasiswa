import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoHeader extends StatefulWidget {
  const VideoHeader({super.key});

  @override
  State<VideoHeader> createState() => _VideoHeaderState();
}

class _VideoHeaderState extends State<VideoHeader> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('videos/bannervideo.mp4')
      ..initialize().then((_) {
        _controller.setLooping(true);
        _controller.setVolume(0);
        _controller.play();
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _controller.value.size.width,
              height: _controller.value.size.height,
              child: VideoPlayer(_controller),
            ),
          )
        : const SizedBox();
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Video sebagai background
          const Positioned.fill(
            child: VideoHeader(),
          ),

          // Lapisan gelap agar teks/form lebih jelas
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),

          // Konten di atas video
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 210), // ⬅️ ATUR: posisi logo & form (semakin kecil semakin ke atas)

                  // Logo
                  Image.asset(
                    'images/LOGOPOLIBAN.png',
                    height: 90, // ⬅️ ATUR: ukuran logo
                  ),

                  const SizedBox(height: 14), // ⬅️ ATUR: jarak antara logo dan teks

                  const Text(
                    'Masuk dan Verifikasi',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
                    child: Text(
                      'Baru! Nikmati kemudahan sistem autentikasi tunggal untuk mengakses semua layanan dengan satu akun.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // FORM
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email/akun pengguna*',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 6),
                        const TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Masukkan email/NIM/NIP/username yang terdaftar',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Password*',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Masukkan password',
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.visibility_off),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Aksi lupa password
                            },
                            child: const Text(
                              'Lupa kata sandi?',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              print('Tombol Masuk ditekan');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16), // ⬅️ ATUR: tinggi tombol
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                            child: const Text('Masuk'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40), // ⬅️ ATUR: jarak bawah terakhir
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
