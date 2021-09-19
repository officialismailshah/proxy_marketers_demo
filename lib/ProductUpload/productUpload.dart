import 'package:flutter/material.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  TextEditingController keyWord = TextEditingController();
  TextEditingController brandName = TextEditingController();
  TextEditingController soldBy = TextEditingController();
  TextEditingController amazonLink = TextEditingController();
  TextEditingController dropDown = TextEditingController();
  bool isSelected = false;
  var _currencies = [
    "Food",
    "Transport",
  ];
  // String? selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Product Details'),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              child: Text('Upload Your Product Here'),
            ),
            Container(
              width: 200,
              height: 200,
              child: Image(
                image: AssetImage('assets/product.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.camera_alt),
                  Icon(Icons.collections),
                ],
              ),
            ),
            TextFieldForCustomer(
              hintText: 'Enter KeyWord',
              controller: keyWord,
            ),
            TextFieldForCustomer(
              hintText: 'Enter Brand Name(optional)',
              controller: brandName,
            ),
            TextFieldForCustomer(
              hintText: 'Enter Sold By',
              controller: soldBy,
            ),
            TextFieldForCustomer(
              hintText: 'Enter Amazon Link',
              controller: amazonLink,
            ),
            DropDownField(
              currencies: _currencies,
              controller: dropDown,
            ),
            Row(
              children: [
                Checkbox(
                    value: isSelected,
                    activeColor: Colors.blue,
                    onChanged: (val) {
                      setState(() {
                        isSelected = val!;
                      });
                    }),
                Text('Text')
              ],
            )
            // TextFieldForCustomer(''),
            // TextFieldForCustomer(),
            // TextFieldForCustomer(),
          ],
        ),
      ),
    );
  }
}

class DropDownField extends StatefulWidget {
  final List<String> currencies;
  final TextEditingController controller;

  DropDownField({
    Key? key,
    required this.currencies,
    required this.controller,
  }) : super(key: key);

  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  @override
  Widget build(BuildContext context) {
    // String? selected;
    return TextField(
      // textAlign: TextAlign.center,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: 'Please Select One Option',
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        suffixIcon: PopupMenuButton<String>(
          icon: const Icon(Icons.arrow_drop_down),
          onSelected: (String value) {
            widget.controller.text = value;
          },
          itemBuilder: (BuildContext context) {
            return widget.currencies.map<PopupMenuItem<String>>((String value) {
              return new PopupMenuItem(child: new Text(value), value: value);
            }).toList();
          },
        ),
      ),
    );
  }
}

class TextFieldForCustomer extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const TextFieldForCustomer({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.all(10),
      ),
    );
  }
}
