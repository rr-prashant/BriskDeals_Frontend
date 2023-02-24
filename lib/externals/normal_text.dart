import 'package:brisk_deals/Packages/Packages.dart';

class NormalText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  TextOverflow overFlow;
  TextDecoration? decoration;
  NormalText({
    Key? key,
    this.color = const Color(0xFFccc7c5),
    required this.text,
    this.size = 14,
    this.height = 1.2,
    this.overFlow = TextOverflow.ellipsis,
    this.decoration = TextDecoration.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      style: GoogleFonts.lato(
        color: color,
        fontSize: size.sp,
        height: height,
        fontWeight: FontWeight.w400,
        decoration: decoration,
      ),
    );
  }
}
