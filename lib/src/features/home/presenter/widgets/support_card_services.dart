import 'package:ecorporativo/src/features/home/domain/entities/helpdesk_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class SupportCardServices extends StatelessWidget {
  final HelpDeskEntity entity;

  const SupportCardServices({required this.entity, super.key});

  String formatOpenDate(DateTime date) {
    initializeDateFormatting();
    String dateFormatter =
        DateFormat("dd MMMM yyyy", "pt_BR").format(date.toLocal());
    return 'Aberto em $dateFormatter';
  }

  String formatScheduledDate(DateTime date) {
    initializeDateFormatting();
    String dateFormatter = DateFormat("dd/MM", "pt_BR").format(date.toLocal());
    return dateFormatter;
  }

  String formatScheduledDateDay(DateTime date) {
    initializeDateFormatting();
    String dateFormatter = DateFormat("EEEE", "pt_BR").format(date.toLocal());
    if (date.toLocal().hour < 12) {
      return '$dateFormatter - manhã';
    } else {
      return '$dateFormatter - tarde';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed('/support_summary', arguments: {"id": entity.id}),
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          width: 350,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.secondary,
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
                        formatScheduledDate(
                            entity.dates.serviceDate ?? DateTime.now()),
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .primary, //ADD IN THEME
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        formatScheduledDateDay(
                            entity.dates.serviceDate ?? DateTime.now()),
                        style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 12), //ADD IN THEME
                      ),
                    ]),
                const Expanded(child: SizedBox()),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Chamado",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "${entity.id}",
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .primary, //ADD IN THEME
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        formatOpenDate(
                            entity.dates.openingDate ?? DateTime.now()),
                        style: TextStyle(
                          color: Colors.grey.shade400, //ADD IN THEME
                          fontSize: 12,
                        ),
                      ),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
