import 'package:flutter/material.dart';

class SupportCardServices extends StatelessWidget {
  final Color color;
  final String date;
  final String day;
  final String callNumber;
  final String openDay;
  final String problem;
  final String status;

  const SupportCardServices(
      {required this.date,
      required this.color,
      required this.day,
      required this.callNumber,
      required this.openDay,
      required this.problem,
      required this.status,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      height: 100,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: color,
                ),
                height: 53,
                width: 4,
              ),
              const SizedBox(
                width: 18,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'agendado para',
                      style: TextStyle(
                          color: Colors.grey.shade400, //ADD IN THEME
                          fontSize: 10),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .primary, //ADD IN THEME
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      day,
                      style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 12), //ADD IN THEME
                    ),
                  ]),
            ],
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  callNumber,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  openDay,
                  style: TextStyle(
                    color: Colors.grey.shade400, //ADD IN THEME
                    fontSize: 12,
                  ),
                ),
                Text(
                  problem,
                  style: TextStyle(
                      color: Colors.grey.shade400, fontSize: 12), //ADD IN THEME
                ),
              ]),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  status,
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                ),
              ]),
        ]),
      ),
    );
  }
}
