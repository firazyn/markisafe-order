import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Color primary = Color(0xffc490e4);
  final Color headingColor = Color(0xfff9f9f9);
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0),
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                CategoriesCards(
                  categoryImages: "nasi_goreng",
                  categoryText: "Nasi Goreng",
                ),
                CategoriesCards(
                  categoryImages: "mie",
                  categoryText: "Mie/Kwetiau",
                ),
                CategoriesCards(
                  categoryImages: "ayam",
                  categoryText: "Ayam",
                ),
                CategoriesCards(
                  categoryImages: "camilan",
                  categoryText: "Camilan",
                ),
                CategoriesCards(
                  categoryImages: "minuman",
                  categoryText: "Minuman",
                ),
              ],
            ),
          ),
          SizedBox(height: 30.0),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: <Widget>[
                Text('hola'),
                Text('hola'),
                Text('hola'),
                Text('hola'),
                Text('hola'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoriesCards extends StatelessWidget {
  final Color color = Color(0xfff9f9f9);
  final categoryImages;
  final categoryText;

  CategoriesCards({this.categoryImages, this.categoryText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: color,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              "assets/food_icons_lineal/$categoryImages.png",
              color: color,
              width: 40,
              height: 40,
            ),
          ),
          SizedBox(height: 7),
          Text(
            categoryText,
            style: GoogleFonts.montserrat(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          )
        ],
      ),
    );
  }
}

class FoodInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
