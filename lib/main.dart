import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  runApp(MyApp(
    connectivity: Connectivity(),
  ));
}