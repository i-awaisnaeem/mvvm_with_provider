import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/veiw_model/auth_view_model.dart';
import 'package:mvvm/veiw_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> AuthViewModel()),
      ChangeNotifierProvider(create: (_)=> UserViewModel())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MVVM',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white
          )
      ),
      initialRoute: RouteName.SplashView,
      onGenerateRoute: Routes.generateRoute,
    ));
  }
}
