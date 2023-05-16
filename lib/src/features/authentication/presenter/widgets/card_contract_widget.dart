import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardContractWidget extends StatelessWidget {
  final int id;
  final String title;
  final String subtile;

  const CardContractWidget(
      {required this.id,
      required this.title,
      required this.subtile,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 22, top: 20),
                child: SvgPicture.asset(
                  'assets/images/Document.svg',
                  height: 34,
                  width: 34,
                )),
            const SizedBox(width: 16),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Text(
                    subtile,
                    style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
