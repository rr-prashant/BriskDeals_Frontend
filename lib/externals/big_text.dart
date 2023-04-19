import 'package:brisk_deals/Packages/Packages.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  int maxline;
  BigText({
    Key? key,
    this.color = const Color(0xFF333333),
    required this.text,
    this.size = 20,
    this.overFlow = TextOverflow.ellipsis,
    this.maxline = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxline,
      overflow: overFlow,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: size.sp,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
