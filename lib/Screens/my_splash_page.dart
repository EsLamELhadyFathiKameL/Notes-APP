import 'package:flutter/material.dart';
import 'package:my_notes_app/my_constants.dart';

class MySpLashPage extends StatefulWidget {
  const MySpLashPage({super.key});
  static String id = kSpLashPage;

  @override
  State<MySpLashPage> createState() => _MySpLashPageState();
}

class _MySpLashPageState extends State<MySpLashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> textSLidingAnimation;
  @override
  void initState() {
    super.initState();
    myInitTextSLidingAnimationMethod();
    myNavigationToNotesPageMethod();
  }

  @override
  void dispose() {
    super.dispose();
    animationController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            "Images/Scholar.png",
            height: 100,
          ),
          const Text(
            "WeLcome!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: "Pacifico",
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SlideTransition(
            position: textSLidingAnimation,
            child: const Text(
              "Every Great Idea Begins With Note",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontFamily: "Pacifico",
              ),
            ),
          ),
        ],
      ),
    );
  }

  void myInitTextSLidingAnimationMethod() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    );
    textSLidingAnimation = Tween<Offset>(
      begin: const Offset(0, 15),
      end: Offset.zero,
    ).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    animationController.forward();
  }

  void myNavigationToNotesPageMethod() {
    Future.delayed(
      const Duration(
        seconds: 5,
      ),
      () {
        if (!mounted) return;

        Navigator.pushNamed(context, kNotesPage);
      },
    );
  }
}
