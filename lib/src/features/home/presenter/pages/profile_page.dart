import 'package:ecorporativo/src/features/authentication/presenter/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late AuthController authController;
  late TextEditingController nameEditingController;
  late TextEditingController documentEditingController;

  @override
  void initState() {
    super.initState();
    authController = GetIt.I.get<AuthController>();
    nameEditingController =
        TextEditingController(text: authController.user?.fullname ?? "");
    documentEditingController =
        TextEditingController(text: "29.586.340/0001-28");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 80,
              width: double.infinity,
              color: Theme.of(context).colorScheme.primary,
            ),
            Positioned(
                child: SizedBox(
              height: 120,
              width: 120,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                child: const Icon(
                  Icons.person,
                  size: 70,
                  color: Colors.white,
                ),
              ),
            ))
          ],
        ),
        const SizedBox(
          height: 48,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              TextField(
                controller: nameEditingController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  filled: true,
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: documentEditingController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Documento',
                  filled: true,
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
