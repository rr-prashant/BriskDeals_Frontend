import 'package:brisk_deals/Packages/Packages.dart';

class ButtonContainerIcon extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  final Color butColor;
  final Color butborderColor;
  IconData? icon;
  final Color textColor;
  ButtonContainerIcon(
      {Key? key,
      required this.butborderColor,
      required this.text,
      required this.butColor,
      required this.onClick,
      this.textColor = ColorsOn.backgroundColor,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: EdgeInsets.only(right: 7.w, left: 10.w),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 16.h,
          ),
          width: 300.w,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1.5,
                  blurRadius: 1.8,
                  offset: const Offset(
                    0,
                    3,
                  )),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                color: ColorsOn.backgroundColor,
              ),
              SizedBox(
                width: 8.w,
              ),
              BigText(
                text: text,
                color: textColor,
                size: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
