import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final String itemName;
  final double price;
  final String imageUrl; // properti baru

  const OrderPage({
    super.key,
    required this.itemName,
    required this.price,
    required this.imageUrl, // tambahkan required
  });

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    double total = widget.price * qty;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Page"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Gambar sesuai menu
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                widget.imageUrl, // gunakan imageUrl dari HomePage
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            Text(
              "Pesanan: ${widget.itemName}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 20),

            // Kontrol jumlah pesanan
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (qty > 1) setState(() => qty--);
                  },
                  icon: const Icon(Icons.remove_circle, color: Colors.deepPurple),
                  iconSize: 32,
                ),
                Text(
                  qty.toString(),
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    setState(() => qty++);
                  },
                  icon: const Icon(Icons.add_circle, color: Colors.deepPurple),
                  iconSize: 32,
                ),
              ],
            ),
            const SizedBox(height: 20),

            Text(
              "Total: Rp ${total.toStringAsFixed(0)}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),

            // Tombol konfirmasi
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Konfirmasi Pesanan"),
                      content: Text(
                        "Anda memesan $qty x ${widget.itemName}\nTotal: Rp ${total.toStringAsFixed(0)}",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Konfirmasi",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
