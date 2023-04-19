import 'package:brisk_deals/Packages/Packages.dart';

class TodoContainer extends StatelessWidget {
  final String Restaurant_Name;
  final String Restaurant_Email;
  final String Restaurant_Location;
  final String Restaurant_PhoneNumber;
  final String Restaurant_Image;

  const TodoContainer({
    Key,
    key,
    required this.Restaurant_Name,
    required this.Restaurant_Email,
    required this.Restaurant_Location,
    required this.Restaurant_PhoneNumber,
    required this.Restaurant_Image,
  });

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
        fontSize: 22.sp, color: Colors.grey[900], fontWeight: FontWeight.bold);

    final style2 = TextStyle(
        fontSize: 16.sp, color: Colors.grey[800], fontWeight: FontWeight.w600);

    final style3 = TextStyle(
      fontSize: 14.sp,
      color: Colors.grey[800],
    );

    final style4 = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: Colors.grey[600],
    );
    return Column(
      children: [
        Container(
          height: 210.h,
          width: 370.w,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 4,
                offset: Offset(5, 0), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.h.w)),
            // image: DecorationImage(
            //     image: NetworkImage(Restaurant_Image), fit: BoxFit.fill),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            bottom: 30.h,
          ),
          height: 80.h,
          width: 370.w,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 4,
                  blurRadius: 4,
                  offset: Offset(5, 0), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(10.h.w))),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Restaurant_Name,
                    style: GoogleFonts.poppins(
                      textStyle: style2,
                    )),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
