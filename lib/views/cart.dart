import 'package:assignment_2/controllers/addAndRemove.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0.0,
      ),
      body: Consumer<AAR>(builder: (context, val, child) {
        return Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 500,
              child: ListView.builder(
                itemCount:val.cart.length,
                itemBuilder: (context,i){
                  return Card(
                    child: ListTile(
                      title:Text(val.cart[i].tableMenuList[1].categoryDishes[i].dishName.toString()),
                      subtitle: Text("SAR ${val.cart[i].tableMenuList[1].categoryDishes[i].dishPrice}"),
                      trailing: IconButton(onPressed: (){
                        val.remove(val.cart[i] , i);
                      }, icon: const Icon(Icons.remove)),
                    ),
                  );
              }),
            ),

            Text("total : ${val.total}"),
          ],
        );
      },),
    );
  }
}