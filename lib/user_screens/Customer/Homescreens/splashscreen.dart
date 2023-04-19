import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:brisk_deals/Packages/Packages.dart';

class LoadingSplashScreen extends StatelessWidget {
  const LoadingSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/lottie/loading.json',
          height: 100.h, width: 180.w),
      splashIconSize: 250.h,
      duration: 2000,
      nextScreen: emailConfirmation(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}

// class LoadingSplashScreen2 extends StatelessWidget {
//   const LoadingSplashScreen2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen(
//       splash: Lottie.asset('assets/lottie/loading.json',
//           height: 100.h, width: 180.w),
//       splashIconSize: 250.h,
//       duration: 3000,
//       nextScreen: btmNavigationBar(),
//       splashTransition: SplashTransition.fadeTransition,
//     );
//   }
// }
