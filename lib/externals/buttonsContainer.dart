import 'package:brisk_deals/Packages/Packages.dart';

class ButtonContainer extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  final Color butColor;
  final Color butborderColor;
  IconData? icon;
  bool hasIcon;
  ButtonContainer(
      {super.key,
      required this.butborderColor,
      required this.text,
      required this.butColor,
      required this.onClick,
      this.hasIcon = false,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: EdgeInsets.only(right: 7.w, left: 10.w),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 17.h,
          ),
          width: 300.w,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5, // soften the shadow
                spreadRadius: 1, //extend the shadow
                offset: Offset(
                  2.0, // Move to right 5  horizontally
                  4.0, // Move to bottom 5 Vertically
                ),
              )
            ],
            border: Border.all(
              color: butborderColor,
            ),
            borderRadius: BorderRadius.circular(
              16,
            ),
            color: butColor,
          ),
          child: Row(
            children: <Widget>[
              hasIcon
                  ? Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 70.w),
                          child: Icon(
                            icon,
                            color: ColorsOn.backgroundColor,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        NormalText(
                          text: text,
                          color: ColorsOn.backgroundColor,
                          size: 18,
                        )
                      ],
                    )
                  : Padding(
                      padding: EdgeInsets.only(left: 90.w),
                      child: NormalText(
                        text: text,
                        color: ColorsOn.backgroundColor,
                        size: 18,
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
