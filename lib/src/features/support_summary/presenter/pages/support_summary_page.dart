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
            height: 48,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, i) {
                  return const ListTile(
                    title: Text("asdasdasd"),
                  );
                }),
          )
        ],
      ),
    );
  }
}
