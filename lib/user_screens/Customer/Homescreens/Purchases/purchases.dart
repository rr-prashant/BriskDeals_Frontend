import 'package:brisk_deals/Packages/Packages.dart';

class purchases extends StatefulWidget {
  const purchases({super.key});

  @override
  State<purchases> createState() => _purchasesState();
}

class _purchasesState extends State<purchases> {
  @override
  Widget build(BuildContext context) {
    User user = context.read<UserCubit>().state;
    int id = user.id!;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showSearch(context: context, delegate: SearchCoupon());
          },
          backgroundColor: ColorsOn.secondaryColor,
          child: const Icon(Icons.search_outlined)),
      body: DefaultTabController(
          length: 2, // length of tabs
          initialIndex: 0,
          child: Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: BigText(
                    text: "Your Coupon Purchases",
                    color: ColorsOn.secondaryColor,
                    size: 25,
                  ),
                ),
              ),
              TabBar(
                indicatorColor: ColorsOn.secondaryColor,
                indicatorWeight: 3,
                labelStyle: GoogleFonts.lato(
                  color: ColorsOn.textColor,
                  fontSize: 15.sp,
                  height: 2,
                  fontWeight: FontWeight.w600,
                ),
                labelColor: ColorsOn.secondaryColor,
                unselectedLabelColor: ColorsOn.greyColor,
                tabs: const [
                  Tab(text: 'Active Coupons'),
                  Tab(text: 'Previous Coupons'),
                ],
              ),
              Expanded(
                child: TabBarView(children: <Widget>[
                  const activeCoupon(),
                  PreviousCoupon(
                    id: id,
                  )
                ]),
              )
            ]),
          )),
    );
  }
}
