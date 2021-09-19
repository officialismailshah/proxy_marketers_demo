// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "title": "Proxy Marketing",
  "chat": "Chat",
  "product": "Product",
  "body_text": "This is a Body Text"
};
static const Map<String,dynamic> zh = {
  "title": "代理营销",
  "chat": "聊天",
  "product": "产品",
  "body_text": "这是正文"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "zh": zh};
}
