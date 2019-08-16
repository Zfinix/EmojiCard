import 'package:flutter/material.dart';
import 'package:provider_example/model/cardModel.dart';
import 'package:provider_example/utils/margin.dart';

class SunCard extends StatelessWidget {
  final CardModel cardModel;

  const SunCard(this.cardModel);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                new BoxShadow(
                  offset: Offset(4, 2),
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                ),
              ]),
          margin: EdgeInsets.only(top: 30, left: 30, bottom: 20, right: 10),
          child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 38, vertical: 30),
                    decoration: new BoxDecoration(
                      color: Color.fromRGBO(240, 239, 239, 1),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Text(
                      cardModel?.emoji ?? '',
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                  const YMargin(40),
                  Text(
                    cardModel?.title ?? '',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  const YMargin(10),
                  Text(
                    cardModel?.subtitle ?? '',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              // height: double.infinity,
            ),
          )),
    );
  }
}
