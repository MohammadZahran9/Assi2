import 'package:assignment_2/views/tabview/biryani.dart';
import 'package:assignment_2/views/tabview/fastfood.dart';
import 'package:assignment_2/views/tabview/fromTheBarnyard.dart';
import 'package:assignment_2/views/tabview/fromTheHenHouse.dart';
import 'package:assignment_2/views/tabview/fromTheSea.dart';
import 'package:assignment_2/views/tabview/saladsandSoup.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            actions: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: badges.Badge(
                    badgeContent: const Text("0"),
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.grey[600],
                    )),
              )
            ],
            leading: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            bottom: TabBar(
                unselectedLabelColor: Colors.grey[600],
                isScrollable: true,
                labelColor: Colors.red,
                indicatorColor: Colors.red,
                labelStyle: const TextStyle(fontSize: 16),
                tabs: const [
                  Tab(
                    child: Text("Salads and Soup"),
                  ),
                  Tab(
                    child: Text("From The Barnyard"),
                  ),
                  Tab(
                    child: Text("From the Hen House"),
                  ),
                  Tab(
                    child: Text("Fresh From The Sea"),
                  ),
                  Tab(
                    child: Text("Biryani"),
                  ),
                  Tab(
                    child: Text("Fast Food"),
                  ),
                ]),
          ),
          body: const TabBarView(children: [
            Salads(),
            Barnyard(),
            HenHouse(),
            TheSea(),
            Biryani(),
            FastFood()
          ]),
        ));
  }
}
