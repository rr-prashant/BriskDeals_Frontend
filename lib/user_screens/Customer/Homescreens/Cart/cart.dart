import 'package:brisk_deals/Packages/Packages.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({super.key});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User user = context.read<UserCubit>().state;
    int id = user.id!;

    return RefreshIndicator(
      onRefresh: () async {
        GetCart(id);
        setState(() {});
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorsOn.backgroundColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: BigText(
            text: "Your Cart",
            size: 25,
            color: ColorsOn.secondaryColor,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: FutureBuilder(
              future: GetCart(id),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text("Something went wrong"),
                  );
                } else {
                  if (snapshot.hasData) {
                    if (snapshot.hasData && snapshot.data.isEmpty) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50.h,
                          ),
                          Center(
                            child: Lottie.asset(
                              'assets/lottie/noDealsFound.json',
                              height: 200.h,
                              width: 200.w,
                            ),
                          ),
                          BigText(
                            text: "No Deals In Cart",
                            size: 18,
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          Center(
                            child: Column(
                                children: snapshot.data.map<Widget>((e) {
                              int Deals_Id = e.Deals_Id;
                              String Deals_title = "${e.Deals_title}";
                              int Deals_price = e.Deals_price;
                              // String Deals_photo = "${e.Deals_photo}";
                              String Deals_category = "${e.Deals_category}";
                              String Deals_desc = "${e.Deals_desc}";
                              String Deals_condition = "${e.Deals_condition}";
                              String Business_Phone = "${e.Vendor_Phone}";
                              int Deals_discount =
                                  int.parse("${e.Deals_discount}");
                              String Deals_applicable_time =
                                  "${e.Deals_applicable_time}";
                              String Deals_applicable_day =
                                  "${e.Deals_applicable_day}";
                              String Deals_expiry_date =
                                  "${e.Deals_expiry_date}";
                              String Business_name = "${e.Business_name}";
                              String Business_location =
                                  "${e.Business_location}";
                              // String Business_photo = "${e.Business_photo}";
                              int Customer_User = e.Customer_User;
                              int Deals_user = e.Vendor_User;

                              return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(PageTransition(
                                        type: PageTransitionType.bottomToTop,
                                        child: CartDealsDetails(
                                          VendorBusinessName: Business_name,
                                          // Business_photo: Business_photo,
                                          Business_location: Business_location,
                                          Business_Phone: Business_Phone,
                                          Deals_Title: Deals_title,
                                          Deals_Price: Deals_price,
                                          // Deals_Photo: Deals_photo,
                                          Deals_Desc: Deals_desc,
                                          Deals_category: Deals_category,
                                          Deals_condition: Deals_condition,
                                          Deals_Discount: Deals_discount,
                                          Deals_applicable_time:
                                              Deals_applicable_time,
                                          Deals_applicable_day:
                                              Deals_applicable_day,
                                          Deals_expiry_date: Deals_expiry_date,
                                          Customer_User: Customer_User,
                                          Vendor_User: Deals_user,
                                        )));
                                  },
                                  child: smallContainer(
                                    dealTitle: Deals_title,
                                    businessName: Business_name,
                                    discount: Deals_discount,
                                    frontLabel: "Expire",
                                    newLabel: Deals_expiry_date,
                                    smallboxWidght: 0.38,
                                    iscart: true,
                                  ));
                            }).toList()),
                          ),
                        ],
                      );
                    }
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        Center(
                          child: Lottie.asset(
                            'assets/lottie/noDealsFound.json',
                            height: 200.h,
                            width: 200.w,
                          ),
                        ),
                        BigText(
                          text: "No Deals In Cart",
                          size: 18,
                        ),
                      ],
                    );
                  }
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
