import 'package:flutter/material.dart';
import 'package:proxy_marketers_demo/ProductUpload/productUpload.dart';
import 'package:proxy_marketers_demo/translations.g.dart/locale_keys.g.dart';

import 'Chat/chats.dart';
import 'Product/product.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'generated/lib/translations.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('en'),
        Locale('zh'),
      ],
      fallbackLocale: Locale('en'),
      path: 'assets/translations',
      assetLoader: CodegenLoader(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Proxy Marketers',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Text(LocaleKeys.title).tr(),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(Icons.search),
            )
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                text: LocaleKeys.chat.tr(),
              ),
              Tab(
                text: LocaleKeys.product.tr(),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ChatWidget(),
            Product(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Route route = MaterialPageRoute(builder: (context) => UploadPage());
            Navigator.of(context).push(route);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
