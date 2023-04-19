import 'package:brisk_deals/Packages/Packages.dart';

class SearchUser extends SearchDelegate {
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

  FetchUser _dealList = FetchUser();

  @override
  Widget buildResults(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Center(
          child: FutureBuilder(
            future: _dealList.getUserList(query: query),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error: ${snapshot.error}'),
                  ],
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
                        SizedBox(height: 15.h),
                        Center(
                          child: Column(
                            children: snapshot.data.map<Widget>((e) {
                              String VendorBusiness_Name = "${e.Business_name}";
                              String VendorBusiness_Location =
                                  "${e.Business_location}";
                              String Deals_Title = "${e.Deals_title}";
                              String Deals_Photo = "${e.Deals_photo}";
                              int Deals_Price = e.Deals_price;
                              String Deals_Desc = "${e.Deals_desc}";
                              String Deal_category = "${e.Deals_category}";
                              String Deals_condition = "${e.Deals_condition}";
                              int Deals_Discount = e.Deals_discount;
                              String Deals_applicable_time =
                                  "${e.Deals_applicable_time}";
                              String Deals_applicable_day =
                                  "${e.Deals_applicable_day}";
                              String Deals_expiry_date =
                                  "${e.Deals_expiry_date}";
                              int Deal_user = e.Deals_user;

                              return HomeDealContainer(
                                  VendorBusiness_Name: VendorBusiness_Name,
                                  VendorBusiness_Location:
                                      VendorBusiness_Location,
                                  Deals_Title: Deals_Title,
                                  // Deals_Photo: Deals_Photo,
                                  Deals_Price: Deals_Price,
                                  Deals_Desc: Deals_Desc,
                                  Deals_category: Deal_category,
                                  Deals_condition: Deals_condition,
                                  Deals_Discount: Deals_Discount,
                                  Deals_applicable_time: Deals_applicable_time,
                                  Deals_applicable_day: Deals_applicable_day,
                                  Deals_expiry_date: Deals_expiry_date,
                                  Deal_user: Deal_user);
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    );
                  }
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
                                  text: "Your Search Results for '${query}'")),
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
              text: "Search Deals Here!",
              size: 20,
              color: ColorsOn.secondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
