import 'package:flutter/material.dart';

import '../widgets/home_card_bill_custom.dart';
import '../widgets/home_card_last_invoices.dart';

class InvoicesPage extends StatefulWidget {
  const InvoicesPage({super.key});

  @override
  State<InvoicesPage> createState() => _InvoicesPageState();
}

class _InvoicesPageState extends State<InvoicesPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          children: [
            Container(
              height: 66,
              width: double.infinity,
              color: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Plano Res. 300Mb ',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.background,
                          fontSize: 24),
                    ),
                    Text(
                      'Suspenso',
                      style: TextStyle(
                          color: Colors.grey.shade400), //  ADD IN THEME
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, //  ADD IN THEME
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 124,
                width: double.infinity,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 92,
                      width: 5,
                      color: Colors.red, //ADD IN THEME
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Você possui faturas em aberto ',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 20),
                        ),
                        Text(
                          'Seu plano está suspenso',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 16),
                        ),
                        Text(
                          'Se já tiver efetuado o pagamento favor\n desconsidere este aviso.',
                          style: TextStyle(
                              color: Colors.grey.shade400, //ADD IN THEME
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 48,
                        width: 180,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(child: Text('informar pagamento')),
                      ),
                      Container(
                        height: 48,
                        width: 180,
                        decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(8)),
                        child:
                            const Center(child: Text('Liberação de confiança')),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text('Últimas faturas',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 120,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Row(
                          children: const [
                            HomeCardLastIncoices(
                              title: 'Fevereiro',
                              price: '99,00',
                              validity: 'Vencimento 15/03/23',
                            ),
                            SizedBox(
                              width: 16,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Demais faturas '),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: ((context, index) {
                        return Column(
                          children: const [
                            CardHomeBillCustom(
                                title: 'Março 2023',
                                subtitle: 'Plano Residencial Fibra 300 Mb',
                                color: Color(0xffF9BD28), //ADD IN THEME
                                price: Text('R\$ 99.00')),
                            SizedBox(height: 8)
                          ],
                        );
                      }),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Ver mais',
                        ),
                      ),
                    ],
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
