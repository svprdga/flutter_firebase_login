import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/app.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  final data = createProviders();

  runApp(App(providers: data));
}

List<SingleChildWidget> createProviders() {
  final log = Logger(printer: PrettyPrinter());

  return [
    Provider<Logger>.value(value: log),
  ];
}
