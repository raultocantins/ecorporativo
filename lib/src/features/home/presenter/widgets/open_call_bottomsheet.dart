import 'package:ecorporativo/src/features/authentication/presenter/controller/auth_controller.dart';
import 'package:ecorporativo/src/features/home/presenter/controllers/support_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class OpenCallBottomSheet extends StatefulWidget {
  const OpenCallBottomSheet({super.key});

  @override
  State<OpenCallBottomSheet> createState() => _OpenCallBottomSheetState();
}

class _OpenCallBottomSheetState extends State<OpenCallBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  late AuthController authController;
  late SupportController controller;
  int? contractId;
  int? contractItem;
  int? service;
  int? prognostic;

  @override
  void initState() {
    super.initState();
    authController = GetIt.I.get<AuthController>();
    controller = GetIt.I.get<SupportController>();
    setState(() {
      contractId = authController.contractsList?.contracts[0].id;
      service = 64;
      prognostic = getPrognostic().first.id;
    });
  }

  List<PrognosticItem> getPrognostic() {
    switch (service) {
      case 64:
        return [
          PrognosticItem(id: 33, label: "Suporte"),
          PrognosticItem(id: 2, label: "Lentidão"),
          PrognosticItem(id: 8, label: "Sem conexão")
        ];
      case 66:
        return [
          PrognosticItem(id: 55, label: "Duvidas"),
          PrognosticItem(id: 48, label: "Financeiro"),
        ];

      case 65:
        return [
          PrognosticItem(id: 14, label: "Alteração de plano"),
          PrognosticItem(id: 77, label: "Assunto comercial"),
        ];

      default:
        return [];
    }
  }

  void save() {
    validate();
  }

  bool validate() {
    if (contractItem == null || prognostic == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            children: [
              DropdownButtonFormField(
                  elevation: 1,
                  decoration: const InputDecoration(
                      filled: true, label: Text("Contrato")),
                  value: contractId,
                  items: authController.contractsList?.contracts.map((e) {
                    return DropdownMenuItem(
                      value: e.id,
                      child: Text(e.id.toString()),
                    );
                  }).toList(),
                  onChanged: (v) {
                    setState(() {
                      contractId = v;
                    });
                  }),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                  validator: (value) =>
                      value == null ? 'Campo requerido!' : null,
                  decoration: const InputDecoration(
                      filled: true, label: Text("Contrato item")),
                  value: null,
                  items: const [
                    DropdownMenuItem(
                      value: 1,
                      child: Text("teste1"),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: Text("teste2"),
                    ),
                    DropdownMenuItem(
                      value: 3,
                      child: Text("teste3"),
                    )
                  ],
                  onChanged: (v) {
                    setState(() {
                      contractItem = v;
                    });
                  }),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                  decoration: const InputDecoration(
                      filled: true, label: Text("Serviço")),
                  value: service,
                  items: const [
                    DropdownMenuItem(
                      value: 64,
                      child: Text("Suporte Técnico"),
                    ),
                    DropdownMenuItem(
                      value: 66,
                      child: Text("Financeiro"),
                    ),
                    DropdownMenuItem(
                      value: 65,
                      child: Text("Comercial"),
                    )
                  ],
                  onChanged: (v) {
                    setState(() {
                      service = v ?? service;
                      prognostic = getPrognostic().first.id;
                    });
                  }),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                  decoration: const InputDecoration(
                      filled: true, label: Text("Sintoma")),
                  value: prognostic,
                  items: getPrognostic().map((e) {
                    return DropdownMenuItem(
                      value: e.id,
                      child: Text(e.label),
                    );
                  }).toList(),
                  onChanged: (v) {
                    setState(() {
                      prognostic = v;
                    });
                  }),
              const Expanded(
                child: SizedBox(),
              ),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.secondary),
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Navigator.of(context).pop();
                      controller.createHelpDesk(
                          contractId: contractId!,
                          contractItem: contractItem!,
                          prognostic: prognostic!,
                          service: service!);
                    }
                  },
                  child: Text(
                    "Criar chamado",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PrognosticItem {
  final int id;
  final String label;

  PrognosticItem({required this.id, required this.label});
}
