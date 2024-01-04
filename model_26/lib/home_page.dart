import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marketplace'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return GridTile(
            child: Image.network(dummyData[index].imageURL),
            footer: Container(
              height: 80,
              color: Colors.green,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    dummyData[index].judul,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Rp ${dummyData[index].harga}",
                  ),
                  Text(
                    dummyData[index].deskripsi,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: dummyData.length,
      ),
    );
  }
}

class Product {
  final String imageURL;
  final String judul;
  final int harga;
  final String deskripsi;

  Product(
      {required this.imageURL,
      required this.judul,
      required this.harga,
      required this.deskripsi});
}

// Dummy data
List<Product> dummyData = [
  Product(
    imageURL: 'images/1.jpeg',
    judul: 'Produk 1',
    harga: 100000,
    deskripsi: 'Deskripsi Produk 1',
  ),
  Product(
    imageURL: 'images/2.jpeg',
    judul: 'Produk 2',
    harga: 150000,
    deskripsi: 'Deskripsi Produk 2',
  ),
  Product(
    imageURL: 'images/1.jpeg',
    judul: 'Produk 1',
    harga: 100000,
    deskripsi: 'Deskripsi Produk 1',
  ),
  Product(
    imageURL: 'images/2.jpeg',
    judul: 'Produk 2',
    harga: 150000,
    deskripsi: 'Deskripsi Produk 2',
  ),
  Product(
    imageURL: 'images/1.jpeg',
    judul: 'Produk 1',
    harga: 100000,
    deskripsi: 'Deskripsi Produk 1',
  ),
  Product(
    imageURL: 'images/2.jpeg',
    judul: 'Produk 2',
    harga: 150000,
    deskripsi: 'Deskripsi Produk 2',
  ),
  Product(
    imageURL: 'images/1.jpeg',
    judul: 'Produk 1',
    harga: 100000,
    deskripsi: 'Deskripsi Produk 1',
  ),
  Product(
    imageURL: 'images/2.jpeg',
    judul: 'Produk 2',
    harga: 150000,
    deskripsi: 'Deskripsi Produk 2',
  ),
  Product(
    imageURL: 'images/1.jpeg',
    judul: 'Produk 1',
    harga: 100000,
    deskripsi: 'Deskripsi Produk 1',
  ),
  Product(
    imageURL: 'images/2.jpeg',
    judul: 'Produk 2',
    harga: 150000,
    deskripsi: 'Deskripsi Produk 2',
  ),
  // Tambahkan lebih banyak data produk di sini sesuai kebutuhan
];
