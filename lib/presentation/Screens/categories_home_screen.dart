import 'package:flutter/material.dart';

class Category {
  String name;
  String Image;
  Category(
    this.Image,
    this.name,
  );
}

class categoriesScreen extends StatefulWidget {
  const categoriesScreen({Key? key}) : super(key: key);

  @override
  State<categoriesScreen> createState() => _categoriesScreenState();
}

class _categoriesScreenState extends State<categoriesScreen> {
  final List<Category> Categories = [
    Category(
        "https://img.freepik.com/free-vector/milk-bottle_1020-433.jpg?w=740&t=st=1684836678~exp=1684837278~hmac=9597d70070bf9716f03488b600eda851fbf45292098253ad9f720b593ce2017f",
        'Milk'),
    Category(
        "https://images.pexels.com/photos/2255935/pexels-photo-2255935.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        'Vegetables'),
    Category(
        "https://img.freepik.com/free-photo/front-view-fresh-raw-red-meat-wooden-cutting-board-nude-color-towel-lemon-garlic-mixed-color-background_179666-47409.jpg?w=1060&t=st=1684827255~exp=1684827855~hmac=9e7bef270f68ea4dbfb1abd53ec378656339e49c2a75f949ea7c8d82d6280858",
        'Meat'),
    Category(
        "https://img.freepik.com/free-vector/seafood-cocktail-ingredients-realistic-composition-with-whole-fresh-salmon-fish-shrimps-octopus-tentacle-lemon-herbs_1284-31931.jpg?w=740&t=st=1684827192~exp=1684827792~hmac=7945829f0006b88f1d0476eef9cabf13277dd91b605f7c17e02d9a0193e1f3d4",
        'Sea Food'),
    Category(
        "https://img.freepik.com/free-photo/front-view-white-chicken-eggs-inside-basket-with-towel-dark-surface_140725-103357.jpg?w=1060&t=st=1684827217~exp=1684827817~hmac=b5f9c69d19b123c050f20eba4991fd4f05ab05021b10314436b5d69f11de04f3",
        'Eggs'),
    Category(
        "https://img.freepik.com/free-vector/milk-bottle_1020-433.jpg?w=740&t=st=1684836678~exp=1684837278~hmac=9597d70070bf9716f03488b600eda851fbf45292098253ad9f720b593ce2017f",
        'Milk'),
    Category(
        "https://images.pexels.com/photos/2255935/pexels-photo-2255935.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        'Vegetables'),
    Category(
        "https://img.freepik.com/free-photo/front-view-fresh-raw-red-meat-wooden-cutting-board-nude-color-towel-lemon-garlic-mixed-color-background_179666-47409.jpg?w=1060&t=st=1684827255~exp=1684827855~hmac=9e7bef270f68ea4dbfb1abd53ec378656339e49c2a75f949ea7c8d82d6280858",
        'Meat'),
    Category(
        "https://img.freepik.com/free-vector/seafood-cocktail-ingredients-realistic-composition-with-whole-fresh-salmon-fish-shrimps-octopus-tentacle-lemon-herbs_1284-31931.jpg?w=740&t=st=1684827192~exp=1684827792~hmac=7945829f0006b88f1d0476eef9cabf13277dd91b605f7c17e02d9a0193e1f3d4",
        'Sea Food'),
    Category(
        "https://img.freepik.com/free-photo/front-view-white-chicken-eggs-inside-basket-with-towel-dark-surface_140725-103357.jpg?w=1060&t=st=1684827217~exp=1684827817~hmac=b5f9c69d19b123c050f20eba4991fd4f05ab05021b10314436b5d69f11de04f3",
        'Eggs'),
    Category(
        "https://img.freepik.com/free-vector/milk-bottle_1020-433.jpg?w=740&t=st=1684836678~exp=1684837278~hmac=9597d70070bf9716f03488b600eda851fbf45292098253ad9f720b593ce2017f",
        'Milk'),
    Category(
        "https://images.pexels.com/photos/2255935/pexels-photo-2255935.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        'Vegetables'),
    Category(
        "https://img.freepik.com/free-photo/front-view-fresh-raw-red-meat-wooden-cutting-board-nude-color-towel-lemon-garlic-mixed-color-background_179666-47409.jpg?w=1060&t=st=1684827255~exp=1684827855~hmac=9e7bef270f68ea4dbfb1abd53ec378656339e49c2a75f949ea7c8d82d6280858",
        'Meat'),
    Category(
        "https://img.freepik.com/free-vector/seafood-cocktail-ingredients-realistic-composition-with-whole-fresh-salmon-fish-shrimps-octopus-tentacle-lemon-herbs_1284-31931.jpg?w=740&t=st=1684827192~exp=1684827792~hmac=7945829f0006b88f1d0476eef9cabf13277dd91b605f7c17e02d9a0193e1f3d4",
        'Sea Food'),
    Category(
        "https://img.freepik.com/free-photo/front-view-white-chicken-eggs-inside-basket-with-towel-dark-surface_140725-103357.jpg?w=1060&t=st=1684827217~exp=1684827817~hmac=b5f9c69d19b123c050f20eba4991fd4f05ab05021b10314436b5d69f11de04f3",
        'Eggs'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xffA71E27),
        //leading:Icon(Icons.menu,color:Colors.white,size: 24, ),
        title: Text(
          "categories",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 18,
          ),
          Icon(
            Icons.shopping_cart_rounded,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: Categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),

                          child: Column(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Image.network(
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                      "${Categories[index].Image}")),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    "${Categories[index].name}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ))
                            ],
                          ),
                        ));
                  }))
        ],
      ),
    );
  }
}
