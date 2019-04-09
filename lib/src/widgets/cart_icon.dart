import 'package:flutter/material.dart';

class CartIcon extends StatelessWidget {
  final int counter;

  const CartIcon({Key key, @required this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
        Positioned(
          right: 5.0,
          child: Container(
            height: 20.0,
            width: 20.0,
            child: Material(
              elevation: 5.0,
              color: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Center(
                child: Text(
                  counter.toString(),
                  style: TextStyle(fontSize: 10.0, color: Colors.white),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
