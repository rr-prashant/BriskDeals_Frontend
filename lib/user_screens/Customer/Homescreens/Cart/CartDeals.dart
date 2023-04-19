import 'package:brisk_deals/Packages/Packages.dart';

class CartDealsDetails extends StatefulWidget {
  String VendorBusinessName;
  String Business_location;
  String Business_Phone;
  // String Business_photo;
  String Deals_Title;
  // String Deals_Photo;
  String Deals_Desc;
  String Deals_category;
  String Deals_condition;
  int Deals_Discount;
  int Deals_Price;
  String Deals_applicable_time;
  String Deals_applicable_day;
  String Deals_expiry_date;
  int Customer_User;
  int Vendor_User;

  CartDealsDetails({
    super.key,
    required this.VendorBusinessName,
    required this.Business_Phone,
    // required this.Business_photo,
    required this.Business_location,
    required this.Deals_Title,
    required this.Deals_Price,
    // required this.Deals_Photo,
    required this.Deals_Desc,
    required this.Deals_category,
    required this.Deals_condition,
    required this.Deals_Discount,
    required this.Deals_applicable_time,
    required this.Deals_applicable_day,
    required this.Deals_expiry_date,
    required this.Customer_User,
    required this.Vendor_User,
  });

  @override
  State<CartDealsDetails> createState() => _CartDealsDetailsState();
}

class _CartDealsDetailsState extends State<CartDealsDetails> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double n = height * 0.2;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15.h, bottom: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    GestureDetector(
                      child: Icon(Icons.arrow_back_ios_rounded),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    BigText(text: "${widget.VendorBusinessName}"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 50.h, left: 12.w),
                child: Container(
                  width: width * 0.92,
                  decoration: BoxDecoration(
                    color: ColorsOn.backgroundColor,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1.8,
                          blurRadius: 2,
                          offset: Offset(0, 2) // changes position of shadow
                          ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: width * 0.92,
                        color: Colors.transparent,
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: height * 0.3,
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/image.jpg",
                                        ),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: n),
                              child: Container(
                                width: width * 0.92,
                                decoration: BoxDecoration(
                                  color: ColorsOn.backgroundColor,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1.8,
                                        blurRadius: 2,
                                        offset: const Offset(
                                            0, 2) // changes position of shadow
                                        ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 10.h,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BigText(
                                        text: "${widget.Deals_Title}",
                                        maxline: 2,
                                      ),
                                      NormalText(
                                          text: "By " +
                                              "${widget.VendorBusinessName}"),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Container(
                                        height: height * 0.04,
                                        width: width * 0.2,
                                        color: ColorsOn.greenColor,
                                        child: Center(
                                          child: BigText(
                                            text: "${widget.Deals_Discount}" +
                                                "%OFF",
                                            color: Color.fromARGB(
                                                255, 43, 140, 93),
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.w),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: height * 0.2,
                                              width: width * 0.26,
                                              decoration: BoxDecoration(
                                                  color: ColorsOn.blueColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(
                                                  child: Text(
                                                      "${widget.Deals_applicable_time}")),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Container(
                                              height: height * 0.2,
                                              width: width * 0.26,
                                              decoration: BoxDecoration(
                                                  color: ColorsOn.greenColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(
                                                  child: Text(
                                                      "${widget.Deals_applicable_day}")),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Container(
                                              height: height * 0.2,
                                              width: width * 0.26,
                                              decoration: BoxDecoration(
                                                  color: ColorsOn.errorColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(
                                                  child: Text(
                                                      "${widget.Deals_expiry_date}")),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      BigText(text: "Description"),
                                      NormalText(
                                          maxline: 50,
                                          text: "${widget.Deals_Desc}"),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      BigText(text: "Condition"),
                                      NormalText(
                                          maxline: 50,
                                          text: "${widget.Deals_condition}"),
                                      SizedBox(
                                        height: 40.h,
                                      ),
                                      ButtonContainer(
                                          butborderColor:
                                              ColorsOn.secondaryColor,
                                          text: "Buy Coupon",
                                          butColor: ColorsOn.secondaryColor,
                                          onClick: () {
                                            showModalBottomSheet(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                  top: Radius.circular(50.0),
                                                ),
                                              ),
                                              context: context,
                                              isScrollControlled: true,
                                              builder: (context) {
                                                return SizedBox(
                                                  height: 360.h,
                                                  child: PaymentPage(
                                                    VendorBusinessName: widget
                                                        .VendorBusinessName,
                                                    // Business_photo:
                                                    //     widget.Business_photo,
                                                    Business_location: widget
                                                        .Business_location,
                                                    Business_Phone:
                                                        widget.Business_Phone,
                                                    Deals_Title:
                                                        widget.Deals_Title,
                                                    Deals_Price:
                                                        widget.Deals_Price,
                                                    // Deals_Photo:
                                                    //     widget.Deals_Photo,
                                                    Deals_Desc:
                                                        widget.Deals_Desc,
                                                    Deals_category:
                                                        widget.Deals_category,
                                                    Deals_condition:
                                                        widget.Deals_condition,
                                                    Deals_Discount:
                                                        widget.Deals_Discount,
                                                    Deals_applicable_time: widget
                                                        .Deals_applicable_time,
                                                    Deals_applicable_day: widget
                                                        .Deals_applicable_day,
                                                    Deals_expiry_date: widget
                                                        .Deals_expiry_date,
                                                    Customer_User:
                                                        widget.Customer_User,
                                                    Vendor_User:
                                                        widget.Vendor_User,
                                                  ),
                                                );
                                              },
                                            );
                                          }),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
