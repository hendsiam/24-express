import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_up/presentation/Screens/sign_in%20screen.dart';

import 'categories_home_screen.dart';

class HomeScreen extends StatelessWidget {
  List<String> categoryName = [
    "Milk",
    "Vegetables",
    "Meat",
    "Sea Food",
    "Eggs"
  ];
  List<String> categoryImage = [
    "https://img.freepik.com/free-vector/milk-bottle_1020-433.jpg?w=740&t=st=1684836678~exp=1684837278~hmac=9597d70070bf9716f03488b600eda851fbf45292098253ad9f720b593ce2017f",
    "https://images.pexels.com/photos/2255935/pexels-photo-2255935.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://img.freepik.com/free-photo/front-view-fresh-raw-red-meat-wooden-cutting-board-nude-color-towel-lemon-garlic-mixed-color-background_179666-47409.jpg?w=1060&t=st=1684827255~exp=1684827855~hmac=9e7bef270f68ea4dbfb1abd53ec378656339e49c2a75f949ea7c8d82d6280858",
    "https://img.freepik.com/free-vector/seafood-cocktail-ingredients-realistic-composition-with-whole-fresh-salmon-fish-shrimps-octopus-tentacle-lemon-herbs_1284-31931.jpg?w=740&t=st=1684827192~exp=1684827792~hmac=7945829f0006b88f1d0476eef9cabf13277dd91b605f7c17e02d9a0193e1f3d4",
    "https://img.freepik.com/free-photo/front-view-white-chicken-eggs-inside-basket-with-towel-dark-surface_140725-103357.jpg?w=1060&t=st=1684827217~exp=1684827817~hmac=b5f9c69d19b123c050f20eba4991fd4f05ab05021b10314436b5d69f11de04f3"
  ];
  List<String> myProducts = [
    "https://img.freepik.com/free-vector/milk-bottle_1020-433.jpg?w=740&t=st=1684836678~exp=1684837278~hmac=9597d70070bf9716f03488b600eda851fbf45292098253ad9f720b593ce2017f",
    "https://images.pexels.com/photos/2255935/pexels-photo-2255935.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://img.freepik.com/free-photo/front-view-fresh-raw-red-meat-wooden-cutting-board-nude-color-towel-lemon-garlic-mixed-color-background_179666-47409.jpg?w=1060&t=st=1684827255~exp=1684827855~hmac=9e7bef270f68ea4dbfb1abd53ec378656339e49c2a75f949ea7c8d82d6280858",
    "https://img.freepik.com/free-vector/seafood-cocktail-ingredients-realistic-composition-with-whole-fresh-salmon-fish-shrimps-octopus-tentacle-lemon-herbs_1284-31931.jpg?w=740&t=st=1684827192~exp=1684827792~hmac=7945829f0006b88f1d0476eef9cabf13277dd91b605f7c17e02d9a0193e1f3d4",
    "https://img.freepik.com/free-photo/front-view-white-chicken-eggs-inside-basket-with-towel-dark-surface_140725-103357.jpg?w=1060&t=st=1684827217~exp=1684827817~hmac=b5f9c69d19b123c050f20eba4991fd4f05ab05021b10314436b5d69f11de04f3",
    "https://img.freepik.com/free-photo/still-life-fresh-cheese_23-2149668840.jpg?w=1060&t=st=1684836952~exp=1684837552~hmac=59da33306f9c7a506d0669ec318447608c4956cc316957a490486ee40228f1ba"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
        child: BottomNavigationBar(items: [
          BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {},
                child: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return categoriesScreen();
                  },),
                  );
                },
                child: Icon(
                  Icons.category,
                ),
              )
              , label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Like"),
        ]),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xffA71E27),
        //leading:Icon(Icons.menu,color:Colors.white,size: 24, ),
        title: Text(
          "24 EXPRESS",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
      drawer: Drawer(
          backgroundColor: Colors.black,
          child: Column(
            children: [
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffA71E27),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xff6B1319),
                        radius: 30,
                        child: Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Hend Siam",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Spacer(),
                          CircleAvatar(
                            backgroundColor: Color(0xff6B1319),
                            radius: 15,
                            child: Icon(
                              Icons.edit,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "2023",
                        style:
                            TextStyle(color: Color(0xff6B1319), fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home_outlined,
                  color: Color(0xff707070),
                  size: 32,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.category,
                  color: Color(0xff707070),
                  size: 32,
                ),
                title: Text(
                  "Categories",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.favorite,
                  color: Color(0xff707070),
                  size: 32,
                ),
                title: Text(
                  "Like",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.shopping_cart_rounded,
                  color: Color(0xff707070),
                  size: 32,
                ),
                title: Text(
                  "orders",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.language,
                  color: Color(0xff707070),
                  size: 32,
                ),
                title: Text(
                  "Language",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                onTap: () async {
                  final uri = Uri.parse('https://v-mesta.com/api/sign-out');
                  final request = http.Request('DELETE', uri);
                  final pref = await SharedPreferences.getInstance();
                  final cachedToken = pref.getString('token');
                  request.headers.addAll({
                    "Content-Type": "application/json",
                    "Authorization": "Bearer $cachedToken"
                  });
                  final response = await request.send();
                  if (response.statusCode == 200) {
                    final String responseBody =
                        await response.stream.bytesToString();
                    final decodedResponseBody = json.decode(responseBody);
                    print(decodedResponseBody);
                    if (decodedResponseBody['key'] == "success") {
                      pref.clear();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => SignInScreen(),
                        ),
                        (route) => false,
                      );
                    }
                  }
                },
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: 32,
                ),
                title: Text(
                  "sign out",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(
                  Icons.category,
                  color: Colors.white,
                  size: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Categories",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
                Spacer(),
                Container(
                  height: 25,
                  width: 72,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Color(0xff707070)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "see all",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 16,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryName.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 16, top: 13),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 45,
                            backgroundImage: NetworkImage(
                              "${categoryImage[index]}",
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${categoryName[index]}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )
                        ],
                      ),
                    );
                  })),
          Padding(
            padding: const EdgeInsets.only(left: 17, bottom: 8, top: 10),
            child: Row(
              children: [
                Icon(
                  Icons.local_offer,
                  color: Colors.white,
                  size: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "offer",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                        width: 250,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://img.freepik.com/free-psd/food-menu-delicious-pizza-web-banner-template_106176-420.jpg?w=1060&t=st=1684829631~exp=1684830231~hmac=4843dff1fcc3f410094851cecf1ec6a02dfd0ad4290992df227526dca85cb9cf",
                              ),
                              fit: BoxFit.cover,
                            ))),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        width: 250,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://img.freepik.com/premium-psd/food-menu-delicious-pizza-facebook-cover-banner-template_106176-757.jpg?w=1380",
                              ),
                              fit: BoxFit.cover,
                            ))),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        width: 250,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://img.freepik.com/free-psd/delicious-burger-food-menu-web-banner-template_106176-412.jpg?w=1060&t=st=1684829721~exp=1684830321~hmac=1cf6686e60ff6081b3ac97bb07e83c30ab576f6c22cb528719cc4e598ecae7c2"),
                              fit: BoxFit.cover,
                            )))
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17, bottom: 8, top: 10),
            child: Row(
              children: [
                Icon(
                  Icons.local_offer,
                  color: Colors.white,
                  size: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Popular",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 400,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 180,
                      childAspectRatio: 3 / 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16),
                  itemCount: myProducts.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      width: 100,
                      height: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("${myProducts[index]}"),
                            fit: BoxFit.fill,
                          ),
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(5)),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
