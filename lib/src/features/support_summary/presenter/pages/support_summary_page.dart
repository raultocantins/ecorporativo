import 'package:flutter/material.dart';

class SupportSummaryPage extends StatefulWidget {
  const SupportSummaryPage({super.key});

  @override
  State<SupportSummaryPage> createState() => _SupportSummaryPageState();
}

class _SupportSummaryPageState extends State<SupportSummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        leadingWidth: 49,
        titleSpacing: 16,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, top: 7.5),
          child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(Icons.arrow_back,
                  size: 30, color: Theme.of(context).colorScheme.background)),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            color: Theme.of(context).colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Requisição de serviço",
                        style: TextStyle(
                            fontSize: 13, color: Colors.white.withOpacity(0.9)),
                      ),
                      const Text(
                        "Chamado #1234",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              elevation: 1,
              child: Container(
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.background,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Data do abetura: ",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            const Expanded(child: SizedBox()),
                            Text(
                              "11/12/2023 as 10:20",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Data do atendimento: ",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            const Expanded(child: SizedBox()),
                            Text(
                              "11/12/2023 as 10:20",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Data de finalização:",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            const Expanded(child: SizedBox()),
                            Text(
                              "11/12/2023 as 10:20",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 2,
                  color: Colors.grey.shade200,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Center(
                    child: Text(
                  'Histórico',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                )),
              ),
              Expanded(
                child: Container(
                  height: 2,
                  color: Colors.grey.shade200,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Card(
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 5),
                          child: Text(
                            'Status',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
