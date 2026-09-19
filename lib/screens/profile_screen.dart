import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hồ sơ cá nhân'),
      ),

      body: const Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
                size: 60,
              ),
            ),

            SizedBox(height: 20),

            Text(
              'Hồ sơ người dùng',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 30),

            ListTile(
              leading: Icon(Icons.person),
              title: Text('Họ và tên'),
              subtitle: Text('Hồ Nguyễn Phúc Thông'),
            ),

            ListTile(
              leading: Icon(Icons.badge),
              title: Text('MSSV'),
              subtitle: Text('2324801030068'),
            ),

            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('2324801030068@student.tdmu.edu.vn'),
            ),
          ],
        ),
      ),
    );
  }
}