import 'package:brisk_deals/Packages/Packages.dart';
import 'package:brisk_deals/user_screens/splashScreen.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:dcdg/dcdg.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
    return ScreenUtilInit(
        designSize: Size(360, 690),
        builder: (context, child) => BlocProvider(
              create: (context) {
                return UserCubit(
                  User(),
                );
              },
              child: KhaltiScope(
                builder: (context, navigatorKey) {
                  return MaterialApp(
                      navigatorKey: navigatorKey,
                      supportedLocales: const [
                        Locale('en', 'US'),
                        Locale('ne', 'NP')
                      ],
                      localizationsDelegates: const [
                        KhaltiLocalizations.delegate
                      ],
                      debugShowCheckedModeBanner: false,
                      title: 'Brisk',
                      home: FutureBuilder<Box>(
                          future: Hive.openBox(tokenBox),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var box = snapshot.data;
                              var token = box!.get("token");
                              if (token != null) {
                                return FutureBuilder<User?>(
                                    future: getUser(token),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        if (snapshot.data != null) {
                                          User user = snapshot.data!;
                                          user.token = token;
                                          context.read<UserCubit>().emit(user);
                                          if (user.is_user == 1) {
                                            return SplashScreen(
                                                page: btmNavigationBar());
                                          } else {
                                            return SplashScreen(
                                                page: VendorHomePage());
                                          }
                                        } else {
                                          return SplashScreen(
                                              page: WelcomeScreen());
                                        }
                                      } else {
                                        return SplashScreen(
                                            page: WelcomeScreen());
                                      }
                                    });
                              } else {
                                return SplashScreen(page: WelcomeScreen());
                              }
                            } else if (snapshot.hasError) {
                              return SplashScreen(page: WelcomeScreen());
                            } else {
                              return SplashScreen(page: WelcomeScreen());
                            }
                          }));
                },
                publicKey: 'test_public_key_e80c174c1868458284542ffcf8f009f5',
              ),
            ));
  }
}
