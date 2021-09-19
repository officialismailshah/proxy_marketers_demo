import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:proxy_marketers_demo/translations.g.dart/locale_keys.g.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Center(child: Text(LocaleKeys.body_text).tr()),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () async {
                await context.setLocale(Locale('en'));
              },
              child: Text('English'),
            ),
            ElevatedButton(
              onPressed: () async {
                await context.setLocale(Locale('zh'));
              },
              child: Text('Chinese'),
            ),
          ],
        )
      ],
    );
  }
}
