import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx_list/app/app_widget.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  runApp(new AppWidget());
}
