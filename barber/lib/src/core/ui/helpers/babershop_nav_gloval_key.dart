import 'package:flutter/material.dart';

class BabershopNavGlovalKey {
  final navkey = GlobalKey<NavigatorState>();
  static BabershopNavGlovalKey? _instance;

  BabershopNavGlovalKey._();

  static BabershopNavGlovalKey get instance =>
      _instance ??= BabershopNavGlovalKey._();
}
