import 'package:brisk_deals/Packages/Packages.dart';
import 'package:brisk_deals/user_screens/Vendor/HomeScreens/VendorPurchases/Vpurchases.dart';

class VendorSetting extends StatefulWidget {
  const VendorSetting({super.key});

  @override
  State<VendorSetting> createState() => _VendorSettingState();
}

class _VendorSettingState extends State<VendorSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                  child: Icon(Icons.arrow_back_ios),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          Column(
            children: [
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
              TextButtons(
                  label: "Purchases",
                  icon: const Icon(
                    Icons.currency_rupee_outlined,
                    color: ColorsOn.secondaryColor,
                  ),
                  onClick: () {
                    Navigator.of(context).push(PageTransition(
                        type: PageTransitionType.bottomToTop,
                        child: VendorDealPurchased()));
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
