import 'package:flutter/material.dart';

class HistoryInvoicesPage extends StatefulWidget {
  const HistoryInvoicesPage({super.key});

  @override
  State<HistoryInvoicesPage> createState() => _HistoryInvoicesPageState();
}

class _HistoryInvoicesPageState extends State<HistoryInvoicesPage> {
  List<String> date = [
    'Jan',
    'Fev',
    'Mar',
    'Abr',
    'Mai',
    'Jun',
    'Jul',
    'Ago',
    'set',
    'Out',
    'Nov',
    'Dez',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        leadingWidth: 49,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 7.5),
            child: Icon(Icons.arrow_back,
                size: 30, color: Theme.of(context).colorScheme.background),
          ),
        ),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        'Histórico de faturas ',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.background,
                            fontSize: 24),
                      ),
                      Text(
                        'Escolha qual fatura você quer acessar.',
                        style: TextStyle(
                            color: Colors.grey.shade400), //  ADD IN THEME
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  '2023',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20),
                ),
              ),
              Container(
                height: 200,
                width: double.infinity,
                color: Theme.of(context).colorScheme.background,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 1.7,
                    maxCrossAxisExtent: 200,
                  ),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          child: Center(
                            child: Text(date[index]),
                          )),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  '2022',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20),
                ),
              ),
              Container(
                height: 300,
                width: double.infinity,
                color: Theme.of(context).colorScheme.background,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 1.7,
                    maxCrossAxisExtent: 200,
                  ),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(child: Text(date[index])),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
