import 'package:brisk_deals/Packages/Packages.dart';

class RecentAddedContainer extends StatefulWidget {
  String title;
  int discount;

  RecentAddedContainer({
    super.key,
    required this.title,
    required this.discount,
  });

  @override
  State<RecentAddedContainer> createState() => _RecentAddedContainerState();
}

class _RecentAddedContainerState extends State<RecentAddedContainer> {
  @override
  Widget build(BuildContext context) {
    User user = context.read<UserCubit>().state;
    double height = MediaQuery.of(context).size.height * 1;
    double width = MediaQuery.of(context).size.height * 1;
    int id = user.id!;
    return Column(
      children: [
        Container(
          width: width * 0.8,
          height: height * 0.16,
          decoration: BoxDecoration(
            color: ColorsOn.backgroundColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1.8,
                  blurRadius: 2,
                  offset: const Offset(0, 2) // changes position of shadow
                  ),
            ],
          ),
          child: Row(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Image.asset(
                "assets/images/profile.jpeg",
                height: 100.h,
                width: 100.w,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: "${widget.title}",
                      maxline: 1,
                      size: 14,
                    ),
                    NormalText(text: "By " + "${user.name}"),
                    SizedBox(
                      height: 4.h,
                    ),
                    Container(
                      height: (MediaQuery.of(context).size.height * 0.03).h,
                      width: (MediaQuery.of(context).size.width * 0.13).w,
                      color: ColorsOn.greenColor,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: BigText(
                          text: "${widget.discount.toString()}" + "%",
                          color: Color.fromARGB(255, 43, 140, 93),
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
