import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../shared/utils/alerts.dart';

class CardHomeBillCustom extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget price;
  final String status;
  final String? linhaDigitavel;
  const CardHomeBillCustom(
      {required this.title,
      required this.subtitle,
      required this.price,
      required this.status,
      this.linhaDigitavel,
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
            color: status == "Pago"
                ? const Color(0xff4CAF50)
                : const Color(0xffF9BD28),
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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            price,
            status == "Aberto"
                ? SizedBox(
                    height: 25,
                    child: TextButton(
                        onPressed: () {
                          Clipboard.setData(
                              ClipboardData(text: linhaDigitavel));
                          AlertsCustom.success(context,
                              title: "Boleto copiado",
                              message:
                                  "o código já foi copiado para área de transferência");
                        },
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(0)),
                            elevation: MaterialStateProperty.all(0)),
                        child: const Text("Copiar código de barras",
                            style:
                                TextStyle(color: Colors.black, fontSize: 12))),
                  )
                : SizedBox(
                    height: 25,
                    child: Text(status,
                        style: TextStyle(
                            color: Colors.grey.shade400, fontSize: 12)),
                  )
          ],
        ),
      ),
    );
  }
}
