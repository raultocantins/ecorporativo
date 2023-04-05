import 'package:flutter/material.dart';

class HomeCardCustom extends StatelessWidget {
  final Widget image;
  final String title;
  const HomeCardCustom({
    required this.title,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          borderRadius: BorderRadius.circular(12)),
      height: 120,
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.77, top: 20),
            child: image,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.background),
            ),
          )
        ],
      ),
    );
  }
}
