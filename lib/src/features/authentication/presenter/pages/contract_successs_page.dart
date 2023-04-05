import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/button_custom_widget.dart';

class ContractSuccessPage extends StatelessWidget {
  const ContractSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/images/Group 27.svg',
                  fit: BoxFit.cover,
                  height: 72,
                  width: 72,
                ),
                const SizedBox(
                  height: 33,
                ),
                const Text('Tudo pronto!',
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  'Contrato assinado com sucesso. Você já pode utilizar nosso app e desfrutar de todas as funcionalidades.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 72,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                ButtonCustomWidget(
                  height: 56,
                  width: double.infinity,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/home');
                  },
                  title: 'Acessar o app',
                  fontSize: 16,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 72,
          )
        ],
      ),
    );
  }
}
