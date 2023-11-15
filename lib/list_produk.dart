import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Produk {
  final String nama;
  final int harga;

  Produk({required this.nama, required this.harga});
}

class ListProduk extends StatefulWidget {
  const ListProduk({Key? key}) : super(key: key);

  @override
  State<ListProduk> createState() => _ListProdukState();
}

class _ListProdukState extends State<ListProduk> {
  final TextEditingController _searchController = TextEditingController();
  final List<Produk> produkList = [
    Produk(nama: 'Bando A', harga: 100),
    Produk(nama: 'Bando B', harga: 200),
    Produk(nama: 'Bando C', harga: 300),
    Produk(nama: 'Bando D', harga: 400),
    Produk(nama: 'Bando E', harga: 500),
    Produk(nama: 'Bando F', harga: 600),
    Produk(nama: 'Bando G', harga: 700),
    Produk(nama: 'Bando H', harga: 800),
    Produk(nama: 'Bando I', harga: 900),
    Produk(nama: 'Bando J', harga: 1000),
    Produk(nama: 'Bando K', harga: 1100),
    Produk(nama: 'Bando L', harga: 1200),
  ];

  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void clearFilter() {
    setState(() {
      _searchQuery = '';
      _searchController.clear();
    });
  }

  List<Produk> get _filteredProdukList {
    if (_searchQuery.isEmpty) {
      return produkList;
    } else {
      return produkList
          .where((produk) =>
              produk.nama.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data Produk',
          style: GoogleFonts.barlow(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Filter Produk',
                        hintStyle: GoogleFonts.barlow(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: clearFilter,
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[300],
            thickness: 1,
            height: 0,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredProdukList.length,
              itemBuilder: (BuildContext context, int index) {
                final Produk produk = _filteredProdukList[index];

                return Column(
                  children: [
                    ListTile(
                      leading: SizedBox(
                        width: 40,
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        produk.nama,
                        style: GoogleFonts.barlow(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Harga: Rp. ${produk.harga.toString()}',
                        style: GoogleFonts.barlow(
                          fontSize: 13,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            produkList.removeAt(index);
                          });
                        },
                      ),
                      onTap: () {},
                    ),
                    Divider(
                      color: Colors.grey[300],
                      thickness: 1,
                      height: 0,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: const Color.fromARGB(255, 38, 147, 42),
      ),
    );
  }
}
