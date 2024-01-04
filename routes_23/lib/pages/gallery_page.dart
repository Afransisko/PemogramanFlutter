import 'package:flutter/material.dart';
import 'photo_page.dart';
import 'home_page.dart';

class GalleryPage extends StatelessWidget {
  static const nameRoute = '/gallerypage';

  void navigateToNextPage(BuildContext context) {
    Navigator.of(context).pushNamed(PhotoPage.nameRoute);
  }

  void navigateBackToHome(BuildContext context) {
    Navigator.of(context).pop(); // Kembali ke halaman Home
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery Page"),
      ),
      body: Stack(
        children: [
          Center(
            child: Text(
              "Gallery_Page",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    navigateBackToHome(
                        context); // Panggil fungsi untuk kembali ke halaman Home
                  },
                  child: Text('Back'),
                ),
                SizedBox(width: 10), // Spasi antara tombol
                ElevatedButton(
                  onPressed: () {
                    navigateToNextPage(
                        context); // Panggil fungsi untuk navigasi ke halaman berikutnya
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
