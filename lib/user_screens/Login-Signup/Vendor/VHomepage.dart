import 'package:brisk_deals/Packages/Packages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class VendorHomepage extends StatefulWidget {
  const VendorHomepage({super.key});

  @override
  State<VendorHomepage> createState() => _VendorHomepageState();
}

class _VendorHomepageState extends State<VendorHomepage> {
  @override
  Widget build(BuildContext context) {
    User user = context.read<UserCubit>().state;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("${user.name}"),
            TextButtons(
                label: "Log out",
                icon: const Icon(
                  Icons.logout_outlined,
                  color: ColorsOn.secondaryColor,
                ),
                onClick: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Text('Log out'),
                            content:
                                const Text('Are you sure you want to Log out?'),
                            actions: [
                              TextButton(
                                  onPressed: () async {
                                    User user = context.read<UserCubit>().state;
                                    await logOutUser(user.token!);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            backgroundColor:
                                                ColorsOn.errorColor,
                                            content: Text(
                                              "Logged Out",
                                              textAlign: TextAlign.center,
                                            )));
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                          builder: (context) => WelcomeScreen(),
                                        ),
                                        (route) => false);
                                  },
                                  child: const Text('Yes')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('NO'))
                            ],
                          ));
                }),
          ],
        ),
      ),
    );
  }
}
