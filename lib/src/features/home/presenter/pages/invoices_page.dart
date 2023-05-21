import 'package:ecorporativo/src/features/authentication/presenter/controller/auth_controller.dart';
import 'package:ecorporativo/src/features/home/presenter/controllers/invoices_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../widgets/home_card_bill_custom.dart';
import '../widgets/home_card_last_invoices.dart';

class InvoicesPage extends StatefulWidget {
  const InvoicesPage({super.key});

  @override
  State<InvoicesPage> createState() => _InvoicesPageState();
}

class _InvoicesPageState extends State<InvoicesPage> {
  late InvoicesController _controller;
  late AuthController _authController;

  @override
  void initState() {
    super.initState();
    _controller = GetIt.I.get<InvoicesController>();
    _authController = GetIt.I.get<AuthController>();
    _controller
        .changeContractId(_authController.contractsList!.contracts[0].id);
    _controller.changeUser(_authController.user!);
    _controller.fetchInvoices();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return SizedBox(
        child: _controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: double.infinity,
                      color: Theme.of(context).colorScheme.primary,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text(
                                _authController.contractsList?.contracts
                                        .where((element) =>
                                            element.id ==
                                            _controller.contractId)
                                        .first
                                        .status ??
                                    "",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20), //  ADD IN THEME
                              ),
                            ),
                            DropdownButton(
                              value: _controller.contractId,
                              elevation: 0,
                              underline: Container(),
                              dropdownColor:
                                  Theme.of(context).colorScheme.primary,
                              items: (_authController.contractsList?.contracts
                                          .isNotEmpty ??
                                      false)
                                  ? _authController.contractsList?.contracts
                                      .map((e) {
                                      return DropdownMenuItem(
                                        value: e.id,
                                        child: Text(
                                          "Contrato ${e.id}",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .background,
                                              fontSize: 20),
                                        ),
                                      );
                                    }).toList()
                                  : [],
                              onChanged: (i) {
                                _controller.changeContractId(i as int);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ((_authController.contractsList?.contracts
                                          .where((element) =>
                                              element.id ==
                                              _controller.contractId)
                                          .first)
                                      ?.status ==
                                  "Bloqueado financeiramente")
                              ? Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white, //ADD IN THEME
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      height: 124,
                                      width: double.infinity,
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Container(
                                            height: 92,
                                            width: 5,
                                            color: Colors.red, //ADD IN THEME
                                          ),
                                          const SizedBox(
                                            width: 16,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Você possui faturas em aberto ',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                'Seu plano está suspenso',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                    fontSize: 16),
                                              ),
                                              Text(
                                                'Se já tiver efetuado o pagamento favor\n desconsidere este aviso.',
                                                style: TextStyle(
                                                    color: Colors.grey
                                                        .shade400, //ADD IN THEME
                                                    fontSize: 12),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            _controller
                                                .trustReleaseContract(context);
                                          },
                                          style: ButtonStyle(
                                              fixedSize:
                                                  MaterialStateProperty.all(
                                                const Size(200, 48),
                                              ),
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              )),
                                          child: const Center(
                                            child:
                                                Text('Liberação de confiança'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : Container(),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Últimas faturas',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500)),
                          const SizedBox(
                            height: 10,
                          ),
                          (_controller.invoices?.invoices.isNotEmpty ?? false)
                              ? SizedBox(
                                  height: 120,
                                  width: double.infinity,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: (_controller.invoices?.invoices
                                                    .length ??
                                                0) >
                                            3
                                        ? 3
                                        : (_controller
                                                .invoices?.invoices.length ??
                                            0),
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          HomeCardLastIncoices(
                                            linhaDigitavel: _controller
                                                .invoices
                                                ?.invoices[index]
                                                .linhaDigitavel,
                                            status: _controller
                                                    .invoices
                                                    ?.invoices[index]
                                                    .situacao ??
                                                "",
                                            title: _controller.getMonth(
                                                _controller
                                                    .invoices
                                                    ?.invoices[index]
                                                    .dataVencimento),
                                            price: _controller.formatPrice(
                                                _controller.invoices
                                                    ?.invoices[index].valor),
                                            validity: _controller.getDate(
                                                _controller
                                                    .invoices
                                                    ?.invoices[index]
                                                    .dataVencimento),
                                          ),
                                          const SizedBox(
                                            width: 16,
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                )
                              : const SizedBox(
                                  child: Text(
                                      "Nenhuma fatura disponível para esse contrato."),
                                ),
                          (_controller.moreInvoices?.invoices.isNotEmpty ??
                                  false)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text('Demais faturas '),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: SizedBox(
                                        height: 400,
                                        width: double.infinity,
                                        child: ListView.builder(
                                          itemCount: _controller.moreInvoices
                                                  ?.invoices.length ??
                                              0,
                                          itemBuilder: ((context, index) {
                                            return Column(
                                              children: [
                                                CardHomeBillCustom(
                                                  title: _controller.getMonth(
                                                      _controller
                                                          .moreInvoices
                                                          ?.invoices[index]
                                                          .dataVencimento),
                                                  subtitle: _controller.getDate(
                                                      _controller
                                                          .moreInvoices
                                                          ?.invoices[index]
                                                          .dataVencimento),
                                                  price: Text(
                                                      'R\$ ${_controller.formatPrice(_controller.moreInvoices?.invoices[index].valor)}'),
                                                  status: _controller
                                                          .moreInvoices
                                                          ?.invoices[index]
                                                          .situacao ??
                                                      "",
                                                ),
                                                const SizedBox(height: 8),
                                              ],
                                            );
                                          }),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
      );
    });
  }
}
