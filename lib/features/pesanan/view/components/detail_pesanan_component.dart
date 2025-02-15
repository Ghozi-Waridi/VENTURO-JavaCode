import 'package:flutter/material.dart';

class DetailPesananComponent extends StatelessWidget {
  const DetailPesananComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Total Pesanan (3 Menu) :"),
              Text("Rp 30.000"),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              const Icon(Icons.local_offer),
              const SizedBox(width: 8.0),
              TextButton(
                onPressed: () {},
                child: const Text("Diskon 20%"),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              const Icon(Icons.card_giftcard),
              const SizedBox(width: 8.0),
              TextButton(
                onPressed: () {},
                child: const Text("Voucher"),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              const Icon(Icons.payment),
              const SizedBox(width: 8.0),
              TextButton(
                onPressed: () {},
                child: const Text("Pembayaran"),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ],
      ),
    );
  }}
