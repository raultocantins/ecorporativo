import 'package:flutter/material.dart';

class CardHomeBillCustom extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget price;
  final Color? color;
  final String status;
  const CardHomeBillCustom(
      {required this.title,
      required this.subtitle,
      required this.price,
      required this.status,
      this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      height: 72,
      width: double.infinity,
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: color,
          ),
          height: 41,
          width: 4,
        ),
        minLeadingWidth: 0,
        title: Text(
          title,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        subtitle: Text(subtitle,
            style: TextStyle(color: Colors.grey.shade400, fontSize: 12)),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            price,
            Text(status,
                style: TextStyle(color: Colors.grey.shade400, fontSize: 12))
          ],
        ),
      ),
    );
  }
}
