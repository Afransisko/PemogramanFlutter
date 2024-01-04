import 'package:flutter/material.dart';
import './gallery_page.dart';

class HomePage extends StatelessWidget {
  static const nameRoute = '/homepage';

  void navigateToNextPage(BuildContext context) {
    Navigator.of(context)
        .pushNamed(GalleryPage.nameRoute); // Ganti dengan GalleryPage
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Stack(
        children: [
          Center(
            child: Text(
              "Home_Page",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: ElevatedButton(
              onPressed: () {
                navigateToNextPage(
                    context); // Panggil fungsi untuk navigasi ke halaman berikutnya
              },
              child: Text('Next'),
            ),
          ),
        ],
      ),
    );
  }
}
