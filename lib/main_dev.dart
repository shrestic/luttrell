import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'app/app.dart';
import 'app/app_bloc_observer.dart';
import 'flavors.dart';
import 'package:luttrell/app/settings/keys.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/di/injection.dart';

void main() async {
  F.appFlavor = Flavor.DEV;
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Hive.initFlutter();
  await Hive.openBox(AppStorageKey.BOX);
  runApp(const MyApp());
}
