import 'package:flutter/material.dart';

void main() {
  runApp(const FishStoreApp());
}

class FishStoreApp extends StatelessWidget {
  const FishStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wireframe Toko Ikan',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black54),
          titleTextStyle: TextStyle(color: Colors.black87, fontSize: 20),
        )
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Name'),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Icon(Icons.person_outline, color: Colors.black54, size: 28),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Icon(Icons.shopping_cart_outlined, color: Colors.black54, size: 26),
          ),
          SizedBox(width: 8),
        ],
      ),
      body: ListView(
        children: [
          _buildHeaderBanner(),
          const SizedBox(height: 16),
          _buildSearchBar(),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text( 'Kategori', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),
          _buildCategories(),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Produk', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),
          _buildProductGrid(),
          const SizedBox(height: 24), 
        ],
      ),
    );
  }

  Widget _buildHeaderBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      height: 180,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.photo_library_outlined, size: 48, color: Colors.grey),
            SizedBox(height: 8),
            Text('Header Banner'),
          ],
        ),
      ),
    );
  }
  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 8),
          Text('Search...', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
  Widget _buildCategories() {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          _buildCategoryItem('Kategori 1'),
          _buildCategoryItem('Kategori 2'),
          _buildCategoryItem('Kategori 3'),
          _buildCategoryItem('Kategori 4'),
          _buildCategoryItem('Kategori 5'),
        ],
      ),
    );
  }
  Widget _buildCategoryItem(String name) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 54,
            width: 54,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontSize: 12), overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
  Widget _buildProductGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.8,
        children: List.generate(6, (index) => _buildProductItem()),
      ),
    );
  }
  Widget _buildProductItem() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration( color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
            child: const Center( child: Icon(Icons.image_outlined, color: Colors.grey, size: 40)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 10, width: double.infinity, color: Colors.grey[300]),
                const SizedBox(height: 6),
                Container(height: 10, width: 80, color: Colors.grey[300]),
              ],
            ),
          )
        ],
      ),
    );
  }
}