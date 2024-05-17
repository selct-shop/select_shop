// ignore_for_file: prefer_const_constructors

part of 'home_screen.dart';

class _CustomBanar extends StatelessWidget {
  const _CustomBanar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              style: _customTitleTextStyle,
              "${S.of(context).most_wanted} :",
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return UnderDevScreen();
                }));
              },
              child: Text(
                style: _customTitleTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.mainColor),
                "${S.of(context).showAll}:",
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return UnderDevScreen();
            }));
          },
          child: Container(
            // height: 140,
            height: 280,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.mainGreyColor.withOpacity(.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 15), 
              scrollDirection: Axis.horizontal,
              children: [
                for (int i = 0; i < 10; i++)
                  ProductCard(
                    width: 180,
                    height: 170,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return UnderDevScreen();
                      }));
                    },
                    newPrice: 400,
                    productCategory: "men",
                    productName: "t-shirt",
                    ratingNumber: 3.8,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
