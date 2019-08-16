import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/model/cardModel.dart';
import 'package:provider_example/utils/margin.dart';
import '../providers/homeController.dart';

Future inputDialog(_) {
  return showDialog(
    context: _,
    builder: (_) => Container(
      height: MediaQuery.of(_).size.height * 0.89,
      child: new BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            backgroundColor: Colors.black54,
            child: const _BuildCard(),
          )),
    ),
  );
}

class _TitleField extends StatelessWidget {
  const _TitleField();
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
      child: TextFormField(
        textAlign: TextAlign.center,
        validator: (val) {
          if (val.isNotEmpty) {
            controller.setNewCard = new CardModel(
                title: val,
                subtitle: controller?.newCard?.subtitle ?? null,
                emoji: controller?.newCard?.emoji ?? null);
            return null;
          } else {
            return "Field Can't be left Empty";
          }
        },
        decoration: new InputDecoration.collapsed(
          hintText: "Title",
        ),
      ),
    );
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle();
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
      child: TextFormField(
        textAlign: TextAlign.center,
        validator: (val) {
          if (val.isNotEmpty) {
            controller.setNewCard = new CardModel(
                subtitle: val,
                emoji: controller?.newCard?.emoji ?? null,
                title: controller?.newCard?.title ?? null);
            return null;
          } else {
            return "Field Can't be left Empty";
          }
        },
        maxLines: null,
        decoration: new InputDecoration.collapsed(
          hintText: "Subtitle",
        ),
      ),
    );
  }
}

class _EmojiField extends StatelessWidget {
  const _EmojiField();
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
      child: TextFormField(
        textAlign: TextAlign.center,
        validator: (val) {
          if (val.isNotEmpty) {
            controller.setNewCard = new CardModel(
                emoji: val,
                subtitle: controller?.newCard?.subtitle ?? null,
                title: controller?.newCard?.title ?? null);
            return null;
          } else {
            return "Field Can't be left Empty";
          }
        },
        decoration: new InputDecoration.collapsed(
          hintText: "Emoji",
        ),
      ),
    );
  }
}

class _BuildCard extends StatelessWidget {
  const _BuildCard();

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<HomeController>(context);
    return Container(
        height: MediaQuery.of(context).size.height * 0.46,
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
        child: Center(
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _EmojiField(),
                const YMargin(5),
                _TitleField(),
                const YMargin(5),
                _Subtitle(),
                const YMargin(20),
                Container(
                  width: double.infinity,
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    textColor: Colors.white,
                    color: Colors.grey[800],
                    child: Text('Add New Card'),
                    onPressed: () {
                      if (controller.formKey.currentState.validate()) {
                        controller.addCard();
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
              ],
            ),
            // height: double.infinity,
          ),
        ));
  }
}
