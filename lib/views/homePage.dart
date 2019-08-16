import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/providers/homeController.dart';
import 'package:provider_example/utils/margin.dart';
import 'package:provider_example/widgets/inputSunCard.dart';
import 'package:provider_example/widgets/sunCard.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 249, 249, 1),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        brightness: Brightness.light,
        elevation: 0,
        title: Image.asset(
          'assets/sun.png',
        ),
        backgroundColor: Color.fromRGBO(250, 249, 249, 1),
      ),
      drawer: Drawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            const YMargin(10),
            Text(
              'Good Morning!',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
            const YMargin(20),
            const _SearchField(),
            _Slider(),
            const YMargin(20),
            const _BuildFabs(),
          ],
        ),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField();
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<HomeController>(context);
    return new Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.black.withOpacity(0.05),
      ),
      child: TextField(
        textAlign: TextAlign.center,
        onChanged: (val) {
          controller.isSearching = true;
          if (controller.isSearching && val.isNotEmpty) {
            controller.searchText = val;
          } else {
            controller.isSearching = false;
          }
        },
        decoration: new InputDecoration.collapsed(
          hintText: "Search",
        ),
      ),
    );
  }
}

class _BuildFabs extends StatelessWidget {
  const _BuildFabs();
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<HomeController>(context);
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      IconButton(
        onPressed: () => controller.removeCard(),
        icon: Icon(Icons.remove, color: Colors.grey[800]),
      ),
      XMargin(20),
      FloatingActionButton(
        onPressed: () async => await inputDialog(context),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.grey[700],
      ),
      const XMargin(20),
      IconButton(
        onPressed: null,
        icon: Icon(Icons.edit, color: Colors.grey[700]),
      ),
    ]);
  }
}

class _Slider extends StatelessWidget {
  _Slider();
  var index = 0;
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<HomeController>(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int i) {
          index = i;
          if (!controller.isSearching) {
            return new SunCard(
              controller.cardList[i],
            );
          } else {
            if (controller.cardList[i].subtitle
                    .toLowerCase()
                    .contains(controller?.searchText?.toLowerCase()) ||
                controller.cardList[i].title
                    .toLowerCase()
                    .contains(controller?.searchText?.toLowerCase()) ||
                controller.cardList[i].emoji
                    .toLowerCase()
                    .contains(controller?.searchText?.toLowerCase())) {
              return new SunCard(
                controller.cardList[i],
              );
            } else {
              return null;
            }
          }
        },
        itemCount: controller.cardList.length ?? 0,
      ),
    );
  }
}
