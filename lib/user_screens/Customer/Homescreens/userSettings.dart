import 'package:brisk_deals/Packages/Packages.dart';
import 'package:brisk_deals/user_screens/Customer/Homescreens/Editprofile.dart';
import 'package:brisk_deals/user_screens/Customer/Homescreens/feedback.dart';
import 'package:flutter/cupertino.dart';

class UserSettings extends StatefulWidget {
  UserSettings({
    super.key,
  });

  @override
  State<UserSettings> createState() => UserSettingsState();
}

class UserSettingsState extends State<UserSettings> {
  //GoogleSignInAccount user = GoogleSignInAccount;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User user = context.read<UserCubit>().state;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 35.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40.h,
                    backgroundColor: ColorsOn.secondaryColor,
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              TextButtons(
                  label: "Edit Profile",
                  icon: const Icon(
                    Icons.person_outline,
                    color: ColorsOn.secondaryColor,
                  ),
                  onClick: () {
                    Navigator.of(context).push(PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: EditProfile(),
                    ));
                  }),
              SizedBox(
                height: 5.h,
              ),
              TextButtons(
                  label: "About Us",
                  icon: const Icon(
                    Icons.info_outline,
                    color: ColorsOn.secondaryColor,
                  ),
                  onClick: () {}),
              SizedBox(
                height: 5.h,
              ),
              TextButtons(
                  label: "Send Feedback",
                  icon: const Icon(
                    Icons.mail_outline_outlined,
                    color: ColorsOn.secondaryColor,
                  ),
                  onClick: () {
                    Navigator.of(context).push(PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: SendFeedback(),
                    ));
                  }),
              SizedBox(
                height: 5.h,
              ),
              TextButtons(
                  label: "How to use BriskDeals",
                  icon: const Icon(
                    Icons.info_outline,
                    color: ColorsOn.secondaryColor,
                  ),
                  onClick: () {}),
              SizedBox(
                height: 5.h,
              ),
              TextButtons(
                  label: "Contact Us",
                  icon: const Icon(
                    Icons.phone_outlined,
                    color: ColorsOn.secondaryColor,
                  ),
                  onClick: () {}),
              SizedBox(
                height: 5.h,
              ),
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
                              content: const Text(
                                  'Are you sure you want to Log out?'),
                              actions: [
                                TextButton(
                                    onPressed: () async {
                                      User user =
                                          context.read<UserCubit>().state;
                                      await logOutUser(user.token!);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              duration:
                                                  Duration(milliseconds: 1000),
                                              backgroundColor:
                                                  ColorsOn.errorColor,
                                              content: Text(
                                                "Logged Out",
                                                textAlign: TextAlign.center,
                                              )));

                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                WelcomeScreen(),
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
      )),
    );
  }
}
