import 'package:get_storage/get_storage.dart';
import 'config/app_theme.dart';
import 'imports.dart';

Future<void> main() async {
  await GetStorage.init();
  Api.initializeInterceptors();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AuthController()),
        ChangeNotifierProvider.value(value: ProductProvider()),
        ChangeNotifierProvider.value(value: OrderProvider())
      ],
      child: MaterialApp(
        title: 'Super Store',
        debugShowCheckedModeBanner: false,
        theme: lightModeTheme,
        darkTheme: darkModeTheme,
        home: Splash(),
      ),
    );
  }
}
