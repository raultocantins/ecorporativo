import 'package:ecorporativo/src/features/home/presenter/widgets/home_card_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/home_card_bill_custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
          title: Text(
            'Olá Fulano',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.background),
          ),
          leadingWidth: 49,
          titleSpacing: 16,
          leading: const Padding(
            padding: EdgeInsets.only(left: 20, top: 7.5),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person_outline_outlined,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: SizedBox(
          child: Column(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                color: Theme.of(context).colorScheme.primary,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Como podemos te ajudar?',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.background),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            HomeCardCustom(
                                title: 'Ver minhas\nfaturas',
                                image: SvgPicture.asset(
                                  'assets/images/Vector.svg',
                                  height: 26,
                                  width: 24,
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            HomeCardCustom(
                                title: 'Solicitar suporte\ntécnico',
                                image: SvgPicture.asset(
                                  'assets/images/settings.svg',
                                  height: 26,
                                  width: 24,
                                )),
                          ],
                        ),
                      ]),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Últimas faturas',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 400,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: ((context, index) {
                          return Column(
                            children: const [
                              CardHomeBillCustom(
                                  title: 'Março 2023',
                                  subtitle: 'Plano Residencial Fibra 300 Mb',
                                  color: Color(0xffF9BD28),
                                  price: Text('R\$ 99.00')),
                              SizedBox(height: 8)
                            ],
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
