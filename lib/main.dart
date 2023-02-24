import 'package:brisk_deals/Packages/Packages.dart';
import 'package:brisk_deals/user_screens/Login-Signup/Vendor/VHomepage.dart';

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
              child: MaterialApp(
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
                                        return UserLoginPage();
                                      } else {
                                        return VendorHomepage();
                                      }
                                    } else {
                                      return WelcomeScreen();
                                    }
                                  } else {
                                    return WelcomeScreen();
                                  }
                                });
                          } else {
                            return WelcomeScreen();
                          }
                        } else if (snapshot.hasError) {
                          return WelcomeScreen();
                        } else {
                          return WelcomeScreen();
                        }
                      })),
            ));
  }
}
