import 'package:flutter/material.dart';
import 'package:btltodolist/page/bottom_navigation_custom/bottom_custom.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nhóm 21'),
        backgroundColor: const Color(0xFF6FA0D6),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF86B0DE), Color(0xFF6FA0D6), Color(0xFF4A7FC1)],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/weather/hinh-nen-anime-83.jpg',
                width: 120,
                height: 120,
              ),
              const SizedBox(height: 16),

              Text(
                'Ứng dụng thời tiết',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Phiên bản 1.18.36',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 30),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: ListTile(
                  leading: const Icon(
                    Icons.school,
                    color: Color(0xFF4A7FC1),
                    size: 30,
                  ),
                  title: Text(
                    'Giảng viên hướng dẫn',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    'Thầy Nguyễn Xuân Quế\nĐại học Phenikaa',
                  ),
                  isThreeLine: true,
                ),
              ),
              const SizedBox(height: 16),

              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.group,
                        color: Color(0xFF4A7FC1),
                        size: 30,
                      ),
                      title: Text(
                        'Thành viên nhóm',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Divider(height: 1),
                    const ListTile(
                      leading: Icon(Icons.person_outline),
                      title: Text('Nguyễn Duy Quang '),
                      subtitle: Text('MSSV: 23010448'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.person_outline),
                      title: Text('Nguyễn Kiến Quốc'),
                      subtitle: Text('MSSV: 23010041'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Card 3: Nguồn Github
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: const ListTile(
                  leading: Icon(Icons.code, color: Color(0xFF4A7FC1), size: 30),
                  title: Text(
                    'GitHub Repository',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'https://github.com/NguyenDuyQuang2005/2025_2_LTTBDD_N03_Nhom_21.git',
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF4A7FC1),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  // Điều hướng sang giao diện chính
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavigationCustom(),
                    ),
                  );
                },
                child: Text(
                  'Bắt đầu sử dụng',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
