import 'package:flutter/material.dart';

class NumbersWidget extends StatelessWidget {
  const NumbersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildButton(context, '136', 'Покупок'),
        buildDevider(),
        buildButton(context, '185', 'Бонусов'),
        buildDevider(),
        buildButton(context, '0', 'Возвратов'),
      ],
    ),
  );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
          onPressed: (){},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)
            ),
            SizedBox(height: 2),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      );

  Widget buildDevider() => Container(
    height: 24,
    child: VerticalDivider(),
  );
}

