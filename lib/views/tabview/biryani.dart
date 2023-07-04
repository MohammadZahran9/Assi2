
import 'package:assignment_2/models/restaurant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:badges/badges.dart' as badges;

Future<List<Restaurant>> getdata(http.Client client) async {
  final response = await http
      .get(Uri.parse("https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad"));
  if (response.statusCode == 200) {
    final List<Restaurant> list = restaurantFromJson(response.body);
    return list;
  }
  throw "error";
}

class Biryani extends StatelessWidget {
  const Biryani({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getdata(http.Client()),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else if (snapshot.hasData) {
          return bir(ll: snapshot.data);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class bir extends StatelessWidget {
   bir({super.key, required this.ll});

  final List<Restaurant> ll;

  final List<Color> colors = [Colors.green, Colors.red];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: ll.length,
        itemBuilder: (context, i) {
          return SizedBox(
            height: 540,
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ll[i].tableMenuList.length,
                itemBuilder: (context, k) {
                  return SizedBox(
                      height: 180,
                      child: Card(
                          borderOnForeground: true,
                          child: ListTile(
                            title: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: badges.Badge(
                                      position: badges.BadgePosition.center(),
                                      badgeStyle: badges.BadgeStyle(
                                          badgeColor:
                                              colors[k % colors.length]),
                                      child: const Icon(
                                          Icons.check_box_outline_blank_sharp)),
                                ),
                                SizedBox(
                                  height: 44,
                                  width: 270,
                                  child: Text(
                                      ll[i]
                                          .tableMenuList[4]
                                          .categoryDishes[k]
                                          .dishName!,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ],
                            ),
                            subtitle: Column(
                              children: [
                                const Padding(padding: EdgeInsets.all(1)),
                                SizedBox(
                                  width: 250,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 60),
                                        child: Text(
                                          "SAR ${ll[i].tableMenuList[4].categoryDishes[k].dishPrice} ",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: Text(
                                            "${ll[i].tableMenuList[4].categoryDishes[k].dishCalories} calories",
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.all(4)),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 50,
                                            width: 270,
                                            child: Text(
                                              ll[i]
                                                  .tableMenuList[4]
                                                  .categoryDishes[k]
                                                  .dishDescription!,
                                              style: TextStyle(
                                                  color: Colors.grey[700]),
                                            ),
                                          )
                                        ],
                                      ),
                                      const Padding(padding: EdgeInsets.all(3)),
                                      Row(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: const Padding(
                                              padding: EdgeInsets.only(
                                                  right: 7, left: 9),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Icon(
                                                    Icons.remove,
                                                    color: Colors.white,
                                                  ),
                                                  Text(
                                                    "0",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15),
                                                  ),
                                                  Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            trailing: CachedNetworkImage(
                              imageUrl: ll[i]
                                  .tableMenuList[4]
                                  .categoryDishes[k]
                                  .dishImage,
                              fit: BoxFit.fill,
                              progressIndicatorBuilder:
                                  (context, url, progress) =>
                                      const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          )));
                }),
          );
        });
  }
}

