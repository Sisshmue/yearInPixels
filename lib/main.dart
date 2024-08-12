import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:year_in_pixels/auth.dart';
import 'package:year_in_pixels/colorProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'colorAdapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //initialize the HIVE
  await Hive.initFlutter();
  Hive.registerAdapter(ColorAdapter());
  //open the box
  var box = await Hive.openBox('myBox');

  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => ColorProvider())],
    child: YIP(),
  ));
}

class YIP extends StatelessWidget {
  const YIP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Auth(),
    );
  }
}
