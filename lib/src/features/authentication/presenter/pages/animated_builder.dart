import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnimatedBuilderCustom extends StatefulWidget {
  final double opacity;
  final Function()? onPressed;
  bool? moreInf;
  AnimatedBuilderCustom(
      {required this.moreInf,
      required this.opacity,
      required this.onPressed,
      super.key});

  @override
  State<AnimatedBuilderCustom> createState() => _AnimatedBuilderCustomState();
}

class _AnimatedBuilderCustomState extends State<AnimatedBuilderCustom> {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.opacity,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 100,
            child: AnimatedContainer(
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              child: Image.asset(
                "assets/images/t.png",
              ),
            ),
          ),
          if (widget.moreInf = true)
            const Text(
              'Bem-vindo ao app\ne-Corporativo.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          const SizedBox(
            height: 17,
          ),
          const Text(
            'Todas as informações do seu\nprovedor de internet na\npalma da sua mão.',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          const SizedBox(
            height: 73,
          ),
          ElevatedButton(
            onPressed: widget.onPressed,
            style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.secondary),
                fixedSize: MaterialStateProperty.all(const Size(182, 56))),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Continuar",
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary),
                ),
                Icon(
                  Icons.arrow_forward_outlined,
                  color: Theme.of(context).colorScheme.primary,
                  size: 17,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 117,
          )
        ],
      ),
    );
  }
}
