import 'package:brisk_deals/Packages/Packages.dart';

class VendorDealPurchased extends StatefulWidget {
  const VendorDealPurchased({super.key});

  @override
  State<VendorDealPurchased> createState() => _VendorDealPurchasedState();
}

class _VendorDealPurchasedState extends State<VendorDealPurchased> {
  @override
  Widget build(BuildContext context) {
    User user = context.read<UserCubit>().state;
    int id = user.id!;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showSearch(context: context, delegate: SearchVendorCoupon());
          },
          backgroundColor: ColorsOn.secondaryColor,
          child: const Icon(Icons.search_outlined)),
      body: DefaultTabController(
          length: 2, // length of tabs
          initialIndex: 0,
          child: Column(children: <Widget>[
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: BigText(
                  text: "Your Customer Purchases",
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
                Tab(text: 'Active Customers'),
                Tab(text: 'Previous Customers'),
              ],
            ),
            Expanded(
              child: TabBarView(children: <Widget>[
                activeVPurchase(),
                PreviousCoupon(
                  id: id,
                  isVendor: true,
                )
              ]),
            )
          ])),
    );
  }
}
