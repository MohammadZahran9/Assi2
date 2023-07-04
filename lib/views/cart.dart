import 'package:assignment_2/controllers/addAndRemove.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<AAR>(builder: (context, val, child) {
        return ListView.builder(
          itemCount:val.cart.length,
          itemBuilder: (context,i){
            return Card(
              child: ListTile(
                title: Text(val.cart[i].tableMenuList[1].categoryDishes[i].dishName.toString()),
                subtitle: Text("SAR ${val.cart[i].tableMenuList[1].categoryDishes[i].dishPrice}"),
                trailing: IconButton(onPressed: (){
                  val.remove(val.cart[i]);
                }, icon: Icon(Icons.remove)),
              ),
            );

        });
      },),
    );
  }
}