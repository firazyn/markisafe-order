class FoodData {
  final foodImage;
  final foodName;
  final foodPrice;
  final foodDesc;
  final foodVariant;

  FoodData({
    this.foodImage,
    this.foodName,
    this.foodPrice,
    this.foodDesc,
    this.foodVariant,
  });
}

class CategoryList {
  final categoryImages;
  final categoryText;

  CategoryList({this.categoryImages, this.categoryText});
}

var categoryList = [
  CategoryList(
    categoryImages: "semua",
    categoryText: "Semua",
  ),
  CategoryList(
    categoryImages: "nasi_goreng",
    categoryText: "Nasi Goreng",
  ),
  CategoryList(
    categoryImages: "mie",
    categoryText: "Mie/Kwetiau",
  ),
  CategoryList(
    categoryImages: "ayam",
    categoryText: "Ayam",
  ),
  CategoryList(
    categoryImages: "camilan",
    categoryText: "Camilan",
  ),
  CategoryList(
    categoryImages: "minuman",
    categoryText: "Minuman",
  ),
];

var foodDataList = [
  FoodData(
    foodImage: 'nasi_goreng',
    foodName: 'Nasi Goreng',
    foodPrice: '15.000',
    foodDesc:
        'Bumbu yang dipilih menciptakan rasa yang khas. Meskipun buatan rumahan, tetapi memiliki rasa yang mewah',
    foodVariant: ['+Ayam', '+Sosis', '+Telur Dadar', '+Teri'],
  ),
  FoodData(
    foodImage: 'mie_goreng',
    foodName: 'Mie Goreng',
    foodPrice: '12.000',
    foodDesc:
        'Dengan campuran beberapa rempah, terciptalah aroma yang sedap dari mie goreng tumis yang tidak biasa',
    foodVariant: ['+Ayam', '+Sosis', '+Telur Dadar'],
  ),
  FoodData(
    foodImage: 'kwetiau_goreng',
    foodName: 'Kwetiau',
    foodPrice: '12.000',
    foodDesc:
        'Bumbu pilihannya dapat menggugah selera makan dan dengan khas bentuk kwetiau membuat rasa yang unik',
    foodVariant: ['+Ayam', '+Sosis', '+Telur Dadar'],
  ),
  FoodData(
    foodImage: 'ayam_katsu',
    foodName: 'Ayam Katsu',
    foodPrice: '16.000',
    foodDesc:
        'Potongan daging ayam yang diolah menggunakan tepung roti dan disajikan dengan topping',
    foodVariant: ['+Mayonaise', '+Saus Tiram', '+Asam Manis'],
  ),
  FoodData(
    foodImage: 'french_fries',
    foodName: 'French Fries',
    foodPrice: '8.000',
    foodDesc:
        'Kentang lokal yang digoreng dan disajikan dengan saus tomat dan mayonaise',
  ),
  FoodData(
    foodImage: 'jus_markisa',
    foodName: 'Jus Markisa',
    foodPrice: '5.000',
    foodDesc: 'Dibuat dengan buah markisa segar, langsung dari pohonnya.',
    foodVariant: ['+Susu', '+Soda'],
  ),
];
