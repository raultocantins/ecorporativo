import 'package:ecorporativo/src/features/authentication/presenter/controller/auth_controller.dart';
import 'package:ecorporativo/src/features/authentication/presenter/widgets/card_contract_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../widgets/button_custom_widget.dart';

class ContractAcceptancePage extends StatefulWidget {
  const ContractAcceptancePage({super.key});

  @override
  State<ContractAcceptancePage> createState() => _ContractAcceptancePageState();
}

class _ContractAcceptancePageState extends State<ContractAcceptancePage> {
  late AuthController authController;

  @override
  void initState() {
    super.initState();
    authController = GetIt.I.get<AuthController>();
  }

  shortText(String text) {
    return (text.length > 18 ? text.substring(0, 18) : text).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          leading:
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back))),
      body: Observer(builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 120,
                ),
                Text(
                  "Bem-vindo,\n${shortText(authController.user?.fullname ?? "")}!",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Neste primeiro acesso,\nantes de começarmos,\nprecisamos que você leia\natentamente os termos do\nnosso contrato.",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 76,
                ),
                CardContractWidget(
                  id: authController.unsignedContracts[0].id,
                  title: 'Contrato de\nprestação de serviço',
                  subtile: 'Contrato ${authController.unsignedContracts[0].id}',
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                ButtonCustomWidget(
                  title: "Continuar",
                  fontSize: 16,
                  height: 56,
                  width: double.infinity,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/contract_acceptance/read',
                        arguments: {
                          "contractId": authController.unsignedContracts[0].id
                        });
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
