import 'package:flutter/material.dart';

class SupportCardPreviousCallWidget extends StatelessWidget {
  final String title;
  final String date;
  final String problem;

  const SupportCardPreviousCallWidget(
      {required this.title,
      required this.date,
      required this.problem,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, //ADD IN THEME
        borderRadius: BorderRadius.circular(12),
      ),
      height: 72,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                        color: Colors.grey.shade400, //ADD IN THEME
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    problem,
                    style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 12,
                        fontWeight: FontWeight.w400), //ADD IN THEME
                  ),
                ]),
            const Expanded(child: SizedBox()),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color(0xff4CAF50)), //ADD IN THEME
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ))),
                  child: const Text('atendido'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
