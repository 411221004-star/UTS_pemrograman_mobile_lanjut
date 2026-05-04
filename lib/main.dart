import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV Mobile App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const HomeScreen(),
        '/detail': (context) => const DetailScreen(),
      },
      initialRoute: '/',
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String _name = 'Falendi';
  static const String _role = 'Pedagang dan Mahasiswa Teknik Informatika Universitas Dian Nusantara';
  static const String _location = 'Jakarta, Indonesia';
  static const String _email = 'falendihb@gmail.com';
  static const String _phone = '+62 831-6972-6314';

  Future<void> _openLink(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Curriculum Vitae'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Detail CV',
            onPressed: () => Navigator.pushNamed(context, '/detail'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Text('Menu Navigasi', style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil Saya'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.work),
              title: const Text('Pengalaman & Pendidikan'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/detail');
              },
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Kontak via Email'),
              onTap: () {
                Navigator.pop(context);
                _openLink(Uri(scheme: 'mailto', path: _email));
              },
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ProfileCard(
            name: _name,
            role: _role,
            location: _location,
            email: _email,
            phone: _phone,
            onContactTap: _openLink,
          ),
          const SizedBox(height: 20),
          const SectionHeader(title: 'Tentang Saya'),
          const Text(
            'Saya seorang pedagang yang sedang menempuh pendidikan di Universitas Dian Nusantara jurusan Teknik Informatika. Saya fokus pada pengalaman pengguna dan suka membangun aplikasi yang efisien dan mudah digunakan.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 20),
          const SectionHeader(title: 'Keahlian Utama'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              SkillChip(label: 'Flutter'),
              SkillChip(label: 'Dart'),
              SkillChip(label: 'UI/UX'),
              SkillChip(label: 'REST API'),
              SkillChip(label: 'Firebase'),
              SkillChip(label: 'Git'),
              SkillChip(label: 'Web Development'),
              SkillChip(label: 'Manajemen Bisnis'),
            ],
          ),
          const SizedBox(height: 20),
          const SectionHeader(title: 'Pendidikan'),
          const InfoCard(
            title: 'S1 Teknik Informatika',
            subtitle: 'Universitas Dian Nusantara',
            description: '2022 - Sekarang | Fokus pada Pemrograman Mobile, Sistem Informasi, dan Pengembangan Aplikasi Bisnis.',
          ),
          const SizedBox(height: 20),
          const SectionHeader(title: 'Pengalaman Singkat'),
          const InfoCard(
            title: 'Magang Web Developer',
            subtitle: 'Pondok Pesantren Al-Mumtazaah',
            description: 'Membangun aplikasi absensi berbasis web untuk pengelolaan kehadiran santri dan laporan harian.',
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Lihat Detail CV'),
            onPressed: () => Navigator.pushNamed(context, '/detail'),
          ),
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail CV'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          SectionHeader(title: 'Pengalaman Kerja'),
          InfoCard(
            title: 'Pedagang',
            subtitle: 'Usaha Pribadi',
            description: '2024 - Sekarang | Mengelola usaha perdagangan dengan menggunakan aplikasi mobile untuk manajemen inventori, penjualan online, dan analisis data penjualan.',
          ),
          InfoCard(
            title: 'Magang Web Developer',
            subtitle: 'Pondok Pesantren Al-Mumtazaah',
            description: '2023 | Mengembangkan aplikasi absensi berbasis web untuk pengelolaan kehadiran santri dan laporan kehadiran.',
          ),
          SizedBox(height: 20),
          SectionHeader(title: 'Proyek Utama'),
          InfoCard(
            title: 'Aplikasi Absensi Pondok Pesantren',
            subtitle: 'Web',
            description: 'Membangun sistem absensi online untuk santri dengan fitur daftar hadir, rekap harian, dan laporan otomatis.',
          ),
          InfoCard(
            title: 'Aplikasi Event Organizer',
            subtitle: 'Flutter & REST API',
            description: 'Mengimplementasikan kalender acara, booking tiket, dan manajemen peserta.',
          ),
          SizedBox(height: 20),
          SectionHeader(title: 'Kualifikasi Tambahan'),
          InfoCard(
            title: 'Bahasa Pemrograman',
            subtitle: 'Dart, Java, Kotlin',
            description: 'Berpengalaman membuat aplikasi mobile dan backend sederhana menggunakan Dart dan Java.',
          ),
          InfoCard(
            title: 'Komunikasi',
            subtitle: 'Kerja Tim & Presentasi',
            description: 'Terbiasa bekerja dalam tim lintas fungsi dan mempresentasikan hasil kerja kepada pemangku kepentingan.',
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.name,
    required this.role,
    required this.location,
    required this.email,
    required this.phone,
    required this.onContactTap,
  });

  final String name;
  final String role;
  final String location;
  final String email;
  final String phone;
  final Future<void> Function(Uri uri) onContactTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 34,
                  backgroundImage: AssetImage('assets/images/profile_photo.png'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Text(role, style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 6),
                      Text(location, style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ContactButton(
              icon: Icons.email,
              label: email,
              onTap: () => onContactTap(Uri(scheme: 'mailto', path: email)),
            ),
            ContactButton(
              icon: Icons.chat,
              label: 'WhatsApp: $phone',
              onTap: () => onContactTap(Uri.parse('https://wa.me/6283169726314')),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactButton extends StatelessWidget {
  const ContactButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, size: 20, color: Colors.teal.shade700),
            const SizedBox(width: 12),
            Expanded(child: Text(label, style: const TextStyle(fontSize: 15))),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  const SkillChip({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.teal.shade50,
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.title, required this.subtitle, required this.description});

  final String title;
  final String subtitle;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(subtitle, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[700])),
            const SizedBox(height: 10),
            Text(description, style: const TextStyle(fontSize: 15, height: 1.5)),
          ],
        ),
      ),
    );
  }
}
