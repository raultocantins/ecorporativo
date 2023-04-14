import 'package:flutter/material.dart';

class HomeCardLastIncoices extends StatelessWidget {
  final String title;
  final String price;
  final String validity;

  const HomeCardLastIncoices(
      {required this.title,
      required this.price,
      required this.validity,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, //ADD IN THEME
        borderRadius: BorderRadius.circular(12),
      ),
      height: 120,
      width: 290,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                title,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary, fontSize: 12),
              ),
              Text(
                'R\$$price',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary, fontSize: 40),
              ),
              Text(
                validity,
                style: TextStyle(
                    color: Colors.grey.shade400, fontSize: 12), //ADD IN THEME
              ),
            ]),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color(0xffEF5350)), //ADD IN THEME
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ))),
                  child: const Text('Vencida'),
                ),
                const SizedBox(
                  height: 3,
                ),
                TextButton(onPressed: () {}, child: const Text('Pagar'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
