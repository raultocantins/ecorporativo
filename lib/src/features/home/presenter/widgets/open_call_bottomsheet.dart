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
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            DropdownButtonFormField(
                elevation: 1,
                decoration: const InputDecoration(
                    filled: true, label: Text("Contrato")),
                value: authController.contractsList?.contracts[0].id,
                items: authController.contractsList?.contracts.map((e) {
                  return DropdownMenuItem(
                    value: e.id,
                    child: Text(e.id.toString()),
                  );
                }).toList(),
                onChanged: (v) {}),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
                decoration: const InputDecoration(
                    filled: true, label: Text("Contrato item")),
                value: 1,
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
                onChanged: (v) {}),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
                decoration:
                    const InputDecoration(filled: true, label: Text("Serviço")),
                value: 1,
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
                onChanged: (v) {}),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
                decoration:
                    const InputDecoration(filled: true, label: Text("Sintoma")),
                value: 1,
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
                onChanged: (v) {}),
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
                  controller.createHelpDesk();
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
    );
  }
}
