import 'package:ecorporativo/src/features/authentication/presenter/controller/auth_controller.dart';
import 'package:ecorporativo/src/features/support_summary/presenter/controllers/support_summary_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class SupportSummaryPage extends StatefulWidget {
  final String helpDeskId;
  const SupportSummaryPage({super.key, required this.helpDeskId});

  @override
  State<SupportSummaryPage> createState() => _SupportSummaryPageState();
}

class _SupportSummaryPageState extends State<SupportSummaryPage> {
  late SupportSummaryController _controller;
  AuthController? _authController;

  @override
  void initState() {
    _controller = GetIt.I.get<SupportSummaryController>();
    _controller.changeUserId(_authController?.user?.id ?? 0);
    _controller.changeHelpDeskId(widget.helpDeskId);
    _controller.getHelpDesk(context);

    super.initState();
  }

  String formatDate(DateTime? date) {
    initializeDateFormatting();

    if (date != null) {
      String dateFormatter =
          DateFormat("dd/MM/yyyy HH:mm", "pt_BR").format(date.toLocal());
      return dateFormatter;
    } else {
      return '';
    }
  }

  String formatDateHistoric(DateTime? date, {String? hours}) {
    initializeDateFormatting();

    if (date != null) {
      String dateFormatter =
          DateFormat("dd/MM/yyyy", "pt_BR").format(date.toLocal());
      return '$dateFormatter $hours';
    } else {
      return '';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
      body: Observer(builder: (context) {
        return _controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Container(
                    height: 80,
                    width: double.infinity,
                    color: Theme.of(context).colorScheme.primary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Requisição de serviço",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white.withOpacity(0.9)),
                              ),
                              Text(
                                "Chamado #${_controller.called?.id}",
                                style: const TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  (_controller.called?.status.code == '0' ||
                          _controller.called?.status.code == '1')
                      ? LinearProgressIndicator(
                          color: Theme.of(context).colorScheme.secondary,
                        )
                      : const LinearProgressIndicator(
                          color: Color(0xff4CAF50),
                          value: 1.0,
                        ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
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
                                      "Status do chamado: ",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const Expanded(child: SizedBox()),
                                    Text(
                                      _controller.called?.status.description ??
                                          "",
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
                                      "Data de abetura: ",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const Expanded(child: SizedBox()),
                                    Text(
                                      formatDate(_controller
                                          .called?.dates.openingDate),
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
                                      "Data de atendimento: ",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const Expanded(child: SizedBox()),
                                    Text(
                                      formatDate(_controller
                                          .called?.dates.serviceDate),
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
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const Expanded(child: SizedBox()),
                                    Text(
                                      formatDate(
                                          _controller.called?.dates.finishDate),
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
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
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
                  (_controller.called?.historicList ?? []).isNotEmpty
                      ? Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ListView.builder(
                                itemCount:
                                    (_controller.called?.historicList ?? [])
                                        .length,
                                itemBuilder: (context, i) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 1),
                                    child: Column(
                                      children: [
                                        (i != 0)
                                            ? Row(children: [
                                                Expanded(
                                                    child: Divider(
                                                  thickness: 1,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                )),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: Icon(
                                                    Icons
                                                        .arrow_drop_down_circle_rounded,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                  ),
                                                ),
                                                Expanded(
                                                    child: Divider(
                                                  thickness: 1,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                )),
                                              ])
                                            : Container(),
                                        ListTile(
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Atendente",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color:
                                                        Colors.grey.shade600),
                                              ),
                                              Text(
                                                _controller
                                                        .called
                                                        ?.historicList?[i]
                                                        .historicAttendant ??
                                                    "",
                                                style: const TextStyle(
                                                    fontSize: 14),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Descrição",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color:
                                                        Colors.grey.shade600),
                                              ),
                                              Text(
                                                _controller
                                                        .called
                                                        ?.historicList?[i]
                                                        .historicDescription
                                                        ?.toLowerCase() ??
                                                    "",
                                                style: const TextStyle(
                                                    fontSize: 14),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Data",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color:
                                                        Colors.grey.shade600),
                                              ),
                                              Text(
                                                formatDateHistoric(
                                                    _controller
                                                        .called
                                                        ?.historicList?[i]
                                                        .historicDate,
                                                    hours: _controller
                                                        .called
                                                        ?.historicList?[i]
                                                        .historicHours),
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        )
                      : const Text("Sem informações do chamado")
                ],
              );
      }),
    );
  }
}
