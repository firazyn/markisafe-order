import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrksf/food_details.dart';
import 'package:mrksf/food_info_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Color primary = Color(0xfff9f9f9);
  final Color headingColor = Color(0xff910bfe);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.primary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: widget.primary,
        leading: IconButton(
          icon: Icon(Icons.menu_rounded),
          color: widget.headingColor,
          onPressed: () {},
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.shopping_cart_outlined),
                color: widget.headingColor,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.notifications_none_rounded),
                color: widget.headingColor,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
      body: Container(
        color: widget.headingColor,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 140,
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35.0),
                  bottomRight: Radius.circular(35.0),
                ),
                color: widget.primary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 15.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Markisafe',
                      style: GoogleFonts.montserrat(
                        color: widget.headingColor,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  CategoriesCards(
                    primary: widget.primary,
                    headingColor: widget.headingColor,
                  ),
                  SizedBox(height: 10.0),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 15.0,
                        mainAxisSpacing: 25.0,
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                      ),
                      padding:
                          EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                      itemCount: foodDataList.length,
                      itemBuilder: (context, index) {
                        final FoodData foods = foodDataList[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return FoodDetails(
                                    name: foods.foodName,
                                    price: foods.foodPrice,
                                    image: foods.foodImage,
                                    desc: foods.foodDesc,
                                    variants: foods.foodVariant,
                                  );
                                },
                              ),
                            );
                          },
                          child: FoodInfo(
                            foodImage: foods.foodImage,
                            foodName: foods.foodName,
                            foodPrice: foods.foodPrice,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: BottomNavigationBar(
                backgroundColor: widget.headingColor,
                selectedItemColor: Color(0xff97e0fb),
                unselectedItemColor: widget.primary,
                elevation: 0,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Beranda',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings_applications_outlined),
                    label: 'Pengaturan',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.photo_rounded),
                    label: 'Profil',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoriesCards extends StatefulWidget {
  final Color primary;
  final Color headingColor;

  CategoriesCards({this.primary, this.headingColor});

  @override
  _CategoriesCardsState createState() => _CategoriesCardsState();
}

class _CategoriesCardsState extends State<CategoriesCards> {
  String selectedCategory = "Semua";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          final CategoryList categories = categoryList[index];
          return InkWell(
            onTap: () {
              setState(() {
                selectedCategory = categories.categoryText;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Column(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: categories.categoryText == selectedCategory
                          ? widget.headingColor
                          : widget.primary,
                      border: Border.all(
                        color: widget.headingColor,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      "assets/food_icons_lineal/${categories.categoryImages}.png",
                      color: categories.categoryText == selectedCategory
                          ? widget.primary
                          : widget.headingColor,
                      width: 40,
                      height: 40,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    categories.categoryText,
                    style: GoogleFonts.montserrat(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: widget.headingColor,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class FoodInfo extends StatelessWidget {
  final Color primaryColor = Color(0xfff9f9f9);
  final Color secondaryColor = Color(0xff910bfe);

  final foodImage;
  final foodName;
  final foodPrice;

  FoodInfo({this.foodImage, this.foodName, this.foodPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.0),
        color: secondaryColor,
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Hero(
                  tag: foodImage,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              AssetImage('assets/food_images/$foodImage.png')),
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          foodName,
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: primaryColor,
                          ),
                        ),
                        Text(
                          "Rp$foodPrice",
                          style: GoogleFonts.montserrat(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: primaryColor),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: secondaryColor,
                        size: 20,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
