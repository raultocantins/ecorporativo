import 'package:ecorporativo/src/features/home/presenter/pages/invoices_page.dart';
import 'package:ecorporativo/src/features/home/presenter/pages/support_page.dart';
import 'package:ecorporativo/src/features/home/presenter/widgets/home_card_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/home_card_bill_custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
  }

  String appbarTitle() {
    switch (tabController.index) {
      case 0:
        return "Olá Fulano";

      case 1:
        return "Faturas";

      case 2:
        return "Suporte Técnico";
      case 3:
        return "Perfil";
      default:
        return "";
    }
  }

  void changeIndexPage(int index) {
    setState(() {
      tabController.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => tabController.index == 0 ? true : false,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          centerTitle: tabController.index != 0 ? true : false,
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
          title: Text(
            appbarTitle(),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.background),
          ),
          leadingWidth: 49,
          titleSpacing: 16,
          leading: tabController.index == 0
              ? const Padding(
                  padding: EdgeInsets.only(left: 20, top: 7.5),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person_outline_outlined,
                      color: Colors.black,
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    if (tabController.index != 0) {
                      changeIndexPage(0);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 7.5),
                    child: Icon(Icons.arrow_back,
                        size: 30,
                        color: Theme.of(context).colorScheme.background),
                  ),
                ),
        ),
        body: SafeArea(
          child: TabBarView(
            controller: tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              SingleChildScrollView(
                child: SizedBox(
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
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background),
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    HomeCardCustom(
                                        title: 'Ver minhas\nfaturas',
                                        onTap: () => changeIndexPage(1),
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
                                        onTap: () => changeIndexPage(2),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 24),
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
                                itemCount: 3,
                                itemBuilder: ((context, index) {
                                  return Column(
                                    children: const [
                                      CardHomeBillCustom(
                                          title: 'Março 2023',
                                          subtitle:
                                              'Plano Residencial Fibra 300 Mb',
                                          color:
                                              Color(0xffF9BD28), //ADD IN THEME
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
              const InvoicesPage(),
              const SupportPage(),
              const SizedBox(
                child: Center(
                  child: Text("quarta pagina"),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey.shade200,
          type: BottomNavigationBarType.fixed,
          currentIndex: tabController.index,
          onTap: (i) {
            switch (i) {
              case 0:
                changeIndexPage(0);

                break;
              case 1:
                changeIndexPage(1);

                break;
              case 2:
                changeIndexPage(2);

                break;
              case 3:
                changeIndexPage(3);

                break;
              default:
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Início",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.attach_money_outlined), label: "Faturas"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Suporte"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
          ],
        ),
      ),
    );
  }
}
