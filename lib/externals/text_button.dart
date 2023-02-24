import 'package:brisk_deals/Packages/Packages.dart';

class TextButtons extends StatelessWidget {
  final String label;
  final Icon icon;
  final VoidCallback onClick;
  const TextButtons(
      {super.key,
      required this.label,
      required this.icon,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      style: TextButton.styleFrom(
        padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
        textStyle: TextStyle(fontSize: 16.sp),
      ),
      child: Row(children: [
        SizedBox(
          width: 20.w,
        ),
        icon,
        SizedBox(
          width: 20.w,
        ),
        NormalText(
          text: label,
          size: 18,
          color: ColorsOn.greyColor,
        )
      ]),
    );
  }
}
