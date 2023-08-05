import 'package:flutter/material.dart';
class milkScreen extends StatelessWidget {
  const milkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xffA71E27),
        //leading:Icon(Icons.menu,color:Colors.white,size: 24, ),
        title: Text(
          "milk",
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
      body:ListView.builder(
    itemCount: 5,
    itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Image.network(
                      fit: BoxFit.cover,
                      "https://img.freepik.com/free-vector/milk-bottle_1020-433.jpg?w=740&t=st=1684836678~exp=1684837278~hmac=9597d70070bf9716f03488b600eda851fbf45292098253ad9f720b593ce2017f")),
              Expanded(
                  flex: 1,
                  child: Text(
                    "milk",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ))
            ],
          ),

        ),
      );

    }
      ),
    );
  }
}
