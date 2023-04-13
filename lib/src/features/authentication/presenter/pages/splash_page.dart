import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  bool moreInfo = false;
  AnimationController? _animationController;
  Animation<double>? _animation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController!);

    setup();
  }

  setup() async {
    await Future.delayed(const Duration(seconds: 3));
    _animationController?.forward();
    setState(() {
      moreInfo = true;
    });
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 42),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 100,
                      child: AnimatedContainer(
                        duration: _animationController?.duration ??
                            const Duration(seconds: 2),
                        curve: Curves.easeInOut,
                        child: Image.asset(
                          "assets/images/t.png",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              moreInfo
                  ? _animation != null
                      ? AnimatedBuilder(
                          animation: _animationController!,
                          builder: (context, child) {
                            return Opacity(
                              opacity: _animation?.value ?? 0,
                              child: Column(
                                children: [
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
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 73,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed("/signin");
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Theme.of(context)
                                                    .colorScheme
                                                    .secondary),
                                        fixedSize: MaterialStateProperty.all(
                                            const Size(182, 56))),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Continuar",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_outlined,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
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
                          },
                        )
                      : Container()
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
//  _animation != null
//                         ? AnimatedContainer(
//                             duration: _animationController?.duration ??
//                                 const Duration(seconds: 2),
//                             curve: Curves.easeInOut,
//                             width: 267 * (_animationController?.value ?? 0.7),
//                             height: 100,
//                             child: Image.asset(
//                               "assets/images/t.png",
//                             ),
//                           )
//                         : Container()