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
  String? selected;
  @override
  Widget build(BuildContext context) {
    var _currencies = [
      "Food",
      "Transport",
    ];
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
            DropDownField(currencies: _currencies, selected: selected!)
            // TextFieldForCustomer(''),
            // TextFieldForCustomer(),
            // TextFieldForCustomer(),
          ],
        ),
      ),
    );
  }
}

class DropDownField extends StatelessWidget {
void set isSeletced(val){

}
  final String selected;
  final List<String> currencies;
  const DropDownField({
    Key? key,
    required this.currencies,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration: InputDecoration(
              errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
          // isEmpty: _currentSelectedValue == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: Text('Please Select Option'),
              value: selected,
              isDense: true,
              onChanged: (newValue) {
                selected = newValue;
              },
              items: currencies.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        );
      },
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
