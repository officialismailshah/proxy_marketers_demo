import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        minVerticalPadding: 40,
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image(image: AssetImage('assets/product.jpeg'))),
        title: Text('Your Title Goes Here'),
        trailing: FittedBox(
          child: Column(
            children: [
              Text('Product Id'),
              ElevatedButton(onPressed: () {}, child: Text('View'))
            ],
          ),
        ),
      ),
    );
  }
}
