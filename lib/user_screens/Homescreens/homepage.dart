import 'package:brisk_deals/Packages/Packages.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    User user = context.read<UserCubit>().state;
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 40.h, bottom: 15.h),
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: "BriskDeals",
                        color: ColorsOn.secondaryColor,
                      ),
                      Row(
                        children: [
                          NormalText(
                            text: user.location!,
                            color: ColorsOn.textColor,
                          ),
                          const Icon(Icons.arrow_drop_down_rounded),
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserSettings()));
                      },
                      child: Container(
                        width: 45.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorsOn.secondaryColor,
                        ),
                        child: const Icon(
                          Icons.person_2_outlined,
                          color: ColorsOn.backgroundColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
