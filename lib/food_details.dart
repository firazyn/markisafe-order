import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodDetails(),
    );
  }
}

class FoodDetails extends StatefulWidget {
  final Color primary = Color(0xfff9f9f9);
  final Color headingColor = Color(0xffbeaee2);
  final name;
  final image;
  final desc;
  final price;
  final variants;

  FoodDetails({this.desc, this.image, this.name, this.price, this.variants});

  @override
  _FoodDetailsState createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: widget.primary,
        title: Text(
          "Detail",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            color: widget.headingColor,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          color: widget.headingColor,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(25.0),
          color: widget.primary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Hero(
                  tag: widget.image,
                  child: Container(
                    height: 180,
                    width: 180,
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: widget.headingColor,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: widget.primary,
                          width: 5.0,
                        ),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              'assets/food_images/${widget.image}.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                widget.name,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 5.0),
              Center(
                child: Text(
                  widget.desc,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Rp${widget.price.toString()}',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  QuantityBox(
                    primary: widget.primary,
                    headingColor: widget.headingColor,
                    // basePrice: widget.price.toInt(),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Text(
                "Varian",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10.0),
              Variant(
                primary: widget.primary,
                headingColor: widget.headingColor,
                variants: widget.variants,
              ),
              SizedBox(height: 70.0),
              OrderButton(
                primary: widget.primary,
                headingColor: widget.headingColor,
                // price: widget.price,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuantityBox extends StatefulWidget {
  final primary;
  final headingColor;
  // final basePrice;

  QuantityBox({this.primary, this.headingColor});

  @override
  _QuantityBoxState createState() => _QuantityBoxState();
}

class _QuantityBoxState extends State<QuantityBox> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    // double totalPrice = widget.basePrice;
    return Container(
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: widget.headingColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(
                () {
                  if (count != 0) {
                    count--;
                    // totalPrice = widget.basePrice - widget.basePrice;
                    // return OrderButton(price: totalPrice);
                  }
                },
              );
            },
            child: Icon(
              Icons.remove,
              color: widget.primary,
              size: 15,
            ),
          ),
          SizedBox(width: 10.0),
          Text(
            count.toString(),
            style: GoogleFonts.montserrat(color: widget.primary),
          ),
          SizedBox(width: 10.0),
          InkWell(
            onTap: () {
              setState(() {
                count++;
                // totalPrice = widget.basePrice + widget.basePrice;
                // return OrderButton(price: totalPrice);
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: widget.primary,
              ),
              child: Icon(
                Icons.add,
                color: widget.headingColor,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Variant extends StatefulWidget {
  final primary;
  final headingColor;
  final variants;

  Variant({this.primary, this.headingColor, this.variants});

  @override
  _VariantState createState() => _VariantState();
}

class _VariantState extends State<Variant> {
  String selectedVariant;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.variants.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                selectedVariant = widget.variants[index];
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: widget.variants[index] == selectedVariant
                      ? widget.headingColor
                      : widget.primary,
                  border: Border.all(
                    color: widget.headingColor,
                    width: 2.0,
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.variants[index],
                    style: GoogleFonts.montserrat(
                      color: widget.variants[index] == selectedVariant
                          ? widget.primary
                          : Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class OrderButton extends StatefulWidget {
  final primary;
  final headingColor;
  // final price;

  OrderButton({this.primary, this.headingColor});

  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: widget.headingColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            'Pesan',
            style: GoogleFonts.montserrat(
              color: widget.primary,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
