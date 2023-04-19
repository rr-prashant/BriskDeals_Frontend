import 'package:brisk_deals/Packages/Packages.dart';

class SearchVendorCoupon extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(
          Icons.close,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  FetchVendorCoupon _couponList = FetchVendorCoupon();

  @override
  Widget buildResults(BuildContext context) {
    User user = context.read<UserCubit>().state;
    int id = user.id!;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Center(
          child: FutureBuilder(
            future: _couponList.getVendorCouponList(query: query, pk: id),
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
                      children: [
                        SizedBox(height: 15.h),
                        Row(
                          children: [
                            SizedBox(width: 10.w),
                            Expanded(
                                child: BigText(
                                    size: 16,
                                    maxline: 2,
                                    text:
                                        "Your Search Results for '${query}'")),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 100),
                          child: Column(
                            children: [
                              Lottie.asset("assets/lottie/search_empty.json"),
                              BigText(
                                text: "No Deals Found!",
                              ),
                              BigText(text: "Search Other Deals."),
                            ],
                          ),
                        )
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        SizedBox(height: 15.h),
                        Row(
                          children: [
                            SizedBox(width: 10.w),
                            Expanded(
                                child: BigText(
                                    size: 16,
                                    maxline: 2,
                                    text:
                                        "Your Search Results for '${query}'")),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Center(
                          child: Column(
                              children: snapshot.data.map<Widget>((e) {
                            int couponId = int.parse("${e.couponID}");
                            String Deals_title = "${e.deal_title}";
                            int Deals_discount =
                                int.parse("${e.deal_discount}");
                            String Deals_applicable_time =
                                "${e.deal_applicable_time}";
                            String Deals_applicable_day =
                                "${e.deal_applicable_day}";
                            String Deals_expiry_date = "${e.deal_expiry_date}";
                            int Customer_User = e.Customer_user;
                            int Deals_user = e.Vendor_user;

                            String Business_name = "${e.VendorBusiness_Name}";
                            String Business_location =
                                "${e.VendorBusiness_Location}";
                            String Business_Phone = "${e.Vendor_Phone}";
                            int Total_coupon_price =
                                int.parse("${e.Total_Coupon_Price}");
                            String CustomerName = "${e.Customer_Name}";
                            String CustomerEmail = "${e.Customer_Email}";
                            String CustomerLocation = "${e.Customer_Address}";
                            String CustomerPhone = "${e.Customer_Phonenumber}";
                            String coupon_Status = "${e.coupon_Status}";
                            String Payment_Complete = "${e.Payment_Complete}";
                            // String Deals_photo = "${e.Deals_photo}";
                            if (coupon_Status == "Active") {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(PageTransition(
                                        type: PageTransitionType.bottomToTop,
                                        child: activeCouponDeal(
                                            couponID: couponId,
                                            DealTitle: Deals_title,
                                            DealTime: Deals_applicable_time,
                                            DealDay: Deals_applicable_day,
                                            DealExpire: Deals_expiry_date,
                                            DealDiscount: Deals_discount,
                                            CouponPrice: Total_coupon_price,
                                            CustomerName: CustomerName,
                                            CustomerEmail: CustomerEmail,
                                            CustomerPhone: CustomerPhone,
                                            CustomerAddress: CustomerLocation,
                                            BusinessName: Business_name,
                                            BusinessLocation: Business_location,
                                            BusinessContact: Business_Phone)));
                                  },
                                  child: smallContainer(
                                    dealTitle: Deals_title,
                                    businessName: Business_name,
                                    discount: Deals_discount,
                                    frontLabel: "Status",
                                    newLabel: coupon_Status,
                                    smallboxColor: ColorsOn.greenColor,
                                    smallboxWidght: 0.28,
                                    couponID: couponId,
                                  ));
                            } else if (coupon_Status == "Used") {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(PageTransition(
                                        type: PageTransitionType.bottomToTop,
                                        child: activeCouponDeal(
                                            couponID: couponId,
                                            DealTitle: Deals_title,
                                            DealTime: Deals_applicable_time,
                                            DealDay: Deals_applicable_day,
                                            DealExpire: Deals_expiry_date,
                                            DealDiscount: Deals_discount,
                                            CouponPrice: Total_coupon_price,
                                            CustomerName: CustomerName,
                                            CustomerEmail: CustomerEmail,
                                            CustomerPhone: CustomerPhone,
                                            CustomerAddress: CustomerLocation,
                                            BusinessName: Business_name,
                                            BusinessLocation: Business_location,
                                            BusinessContact: Business_Phone)));
                                  },
                                  child: smallContainer(
                                    dealTitle: Deals_title,
                                    businessName: Business_name,
                                    discount: Deals_discount,
                                    frontLabel: "Status",
                                    newLabel: coupon_Status,
                                    discountColor: ColorsOn.errorColor,
                                    smallboxWidght: 0.28,
                                    couponID: couponId,
                                  ));
                            } else {
                              return Container();
                            }
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
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigText(
              text: "Search Your Customer's Coupons By",
              size: 16,
              color: ColorsOn.secondaryColor,
            ),
            BigText(
              text: "Their Respective Coupon ID Like 1,2 etc.",
              size: 16,
              color: ColorsOn.secondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
