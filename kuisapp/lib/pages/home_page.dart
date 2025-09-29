import 'package:flutter/material.dart';
import 'order_page.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> menuList = const [
    {
      'name': '🍔 Burger Spesial',
      'price': 25000,
      'desc': 'Burger dengan daging sapi premium',
      'image':
          'https://static.vecteezy.com/system/resources/previews/030/683/548/non_2x/burgers-high-quality-4k-hdr-free-photo.jpg',
    },
    {
      'name': '🍜 Mie Ayam',
      'price': 15000,
      'desc': 'Mie ayam hangat dengan pangsit',
      'image':
          'https://tse4.mm.bing.net/th/id/OIP.5j40mfxHstb-T544FmkoZgHaHa?pid=Api&P=0&h=220',
    },
    {
      'name': '🍚 Nasi Goreng',
      'price': 20000,
      'desc': 'Nasi goreng khas dengan telur dan ayam',
      'image':
          'https://tse4.mm.bing.net/th/id/OIP.CSJ9yCYWqsnOLb1sE-8k6QHaFj?pid=Api&P=0&h=220',
    },
    {
      'name': '🍕 Pizza Mini',
      'price': 30000,
      'desc': 'Pizza ukuran personal dengan topping keju',
      'image':
          'https://theawesomedaily.com/wp-content/uploads/2016/09/pictures-of-pizza-23-1.jpg',
    },
    {
      'name': '🥤 Es Teh Manis',
      'price': 5000,
      'desc': 'Minuman segar favorit semua orang',
      'image':
          'https://asset.kompas.com/crops/9iB_ruTEMU7otPYnbCNVng8zhrQ=/0x0:4939x3293/1200x800/data/photo/2022/09/25/63300cfd403f0.jpg',
    },
    {
      'name': '🍩 Donat Cokelat',
      'price': 10000,
      'desc': 'Donat empuk dengan taburan cokelat',
      'image':
          'https://tse2.mm.bing.net/th/id/OIP.DmkX4OZ5NE_TaabZw-DJdgHaHa?pid=Api&P=0&h=220',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FoodApp Home"),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: "Sign Out",
            onPressed: () {
              // Setelah sign out arahkan ke LoginPage
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.75, // lebih proporsional
          ),
          itemCount: menuList.length,
          itemBuilder: (context, index) {
            final m = menuList[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Gambar menu
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.network(
                      m['image'],
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            m['name'],
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            m['desc'],
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Spacer(),
                          Text(
                            "Rp ${m['price']}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => OrderPage(
                                      itemName: m['name'],
                                      price: (m['price'] as int).toDouble(),
                                      imageUrl: m['image'],
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                              ),
                              child: const Text(
                                "PESAN",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
