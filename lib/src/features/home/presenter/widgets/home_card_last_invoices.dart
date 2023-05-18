import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../shared/utils/alerts.dart';

class HomeCardLastIncoices extends StatelessWidget {
  final String title;
  final String price;
  final String validity;
  final String status;
  final String? linhaDigitavel;

  const HomeCardLastIncoices(
      {required this.title,
      required this.price,
      required this.validity,
      required this.status,
      this.linhaDigitavel,
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
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 12),
                  ),
                  Text(
                    'R\$$price',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 40,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    validity,
                    style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 12), //ADD IN THEME
                  ),
                ]),
            const Expanded(
              child: SizedBox(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: status == "Pago"
                          ? MaterialStateProperty.all(const Color(0xff4CAF50))
                          : MaterialStateProperty.all(
                              const Color(0xffEF5350)), //ADD IN THEME
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ))),
                  child: status == "Pago"
                      ? const Text('Pago')
                      : const Text('Aberto'),
                ),
                status == "Aberto"
                    ? TextButton(
                        onPressed: () {
                          Clipboard.setData(
                              ClipboardData(text: linhaDigitavel));
                          AlertsCustom.success(context,
                              title: "Boleto copiado",
                              message:
                                  "o código já foi copiado para área de transferência");
                        },
                        child: const Icon(
                          Icons.copy,
                          size: 20,
                        ))
                    : Container()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
