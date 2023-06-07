import 'package:ecorporativo/src/features/support_summary/presenter/pages/support_summary_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/helpdesk_entity.dart';

class SupportCardPreviousCallWidget extends StatelessWidget {
  final HelpDeskEntity entity;
  const SupportCardPreviousCallWidget({required this.entity, super.key});
  String formatFinishedDate(DateTime date) {
    initializeDateFormatting();
    String dateFormatter =
        DateFormat("dd MMMM yyyy", "pt_BR").format(date.toLocal());
    return dateFormatter;
  }

  shortText(String text) {
    return (text.length > 40 ? text.substring(0, 40) : text).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SupportSummaryPage(
            helpDeskId: entity.id.toString(),
          ),
        ),
      ),
      child: Container(
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
                      'Chamado ${entity.id}',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16),
                    ),
                    Text(
                      formatFinishedDate(
                          entity.dates.finishDate ?? DateTime.now()),
                      style: TextStyle(
                          color: Colors.grey.shade400, //ADD IN THEME
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      shortText(entity.prognostic.description ?? ""),
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
                  SizedBox(
                    height: 20,
                    width: 96,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xff4CAF50)), //ADD IN THEME
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ))),
                      child: Text(
                        'atendido',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.background),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
