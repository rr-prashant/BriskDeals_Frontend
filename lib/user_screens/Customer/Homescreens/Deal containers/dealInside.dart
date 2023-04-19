import 'package:brisk_deals/Packages/Packages.dart';

class mainDetailedDeals extends StatefulWidget {
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
  int Deal_user;
  mainDetailedDeals({
    super.key,
    required this.VendorBusinessName,
    // required this.Business_photo,
    required this.Business_location,
    required this.Business_Phone,
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
    required this.Deal_user,
  });

  @override
  State<mainDetailedDeals> createState() => _mainDetailedDealsState();
}

class _mainDetailedDealsState extends State<mainDetailedDeals> {
  @override
  Widget build(BuildContext context) {
    User user = context.read<UserCubit>().state;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double n = height * 0.2;
    int id = user.id!;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40.h, bottom: 10.h),
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
                    // changes position of shadow
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
                                  // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 10.h,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                        text:
                                            "${widget.Deals_Discount}" + "%OFF",
                                        color: Color.fromARGB(255, 43, 140, 93),
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.w),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: height * 0.2,
                                          width: width * 0.26,
                                          decoration: BoxDecoration(
                                              color: ColorsOn.blueColor,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
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
                                                  BorderRadius.circular(10)),
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
                                                  BorderRadius.circular(10)),
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
                                  ButtonContainerIcon(
                                      butborderColor: ColorsOn.secondaryColor,
                                      text: "Add to Cart ",
                                      icon: Icons.shopping_cart_outlined,
                                      butColor: ColorsOn.secondaryColor,
                                      onClick: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                                  title:
                                                      const Text('Add to Cart'),
                                                  content: const Text(
                                                      'Do you want this Item to add in your Cart?'),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () async {
                                                          setState(() {});

                                                          postCart(
                                                            widget
                                                                .VendorBusinessName,
                                                            // widget
                                                            //     .Business_photo,
                                                            widget
                                                                .Business_location,
                                                            widget.Deals_Title,
                                                            widget.Deals_Price,
                                                            widget
                                                                .Deals_category,
                                                            widget.Deals_Desc,
                                                            widget
                                                                .Deals_condition,
                                                            widget
                                                                .Deals_Discount,
                                                            widget
                                                                .Deals_applicable_time,
                                                            widget
                                                                .Deals_applicable_day,
                                                            widget
                                                                .Deals_expiry_date,
                                                            id,
                                                            widget.Deal_user,
                                                            // widget.Deals_Photo,
                                                            widget
                                                                .Business_Phone,
                                                          );
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child:
                                                            const Text('YES')),
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text('NO'))
                                                  ],
                                                ));
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
    );
  }
}
