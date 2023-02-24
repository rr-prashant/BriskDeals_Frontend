import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:brisk_deals/Packages/Packages.dart';

import 'BottomNavigationbar.dart';

class SplashScreenSaver extends StatelessWidget {
  const SplashScreenSaver({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/lottie/loading.json',
          height: 100.h, width: 180.w),
      splashIconSize: 250.h,
      duration: 2000,
      nextScreen: btmNavigationBar(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
