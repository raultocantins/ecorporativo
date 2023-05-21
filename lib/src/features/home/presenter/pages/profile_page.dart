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
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    authController = GetIt.I.get<AuthController>();
    textEditingController =
        TextEditingController(text: authController.user?.fullname ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.background,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
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
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              TextField(
                controller: textEditingController,
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
            ],
          ),
        ),
      ],
    );
  }
}
