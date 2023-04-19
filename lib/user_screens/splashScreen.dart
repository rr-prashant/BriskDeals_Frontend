import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:brisk_deals/Packages/Packages.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  Widget page;
  SplashScreen({super.key, required this.page});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SvgPicture.asset(
        "assets/images/splashscreen.svg",
        height: 90.h,
        width: 200.w,
      ),
      nextScreen: widget.page,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRight,
    );
  }
}
