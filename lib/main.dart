import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'routes/app_router.dart';
import 'package:todo2/controller/todo_provider.dart';
import 'package:go_router/go_router.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://fjacqengukftjmzwskdo.supabase.co', 
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZqYWNxZW5ndWtmdGptendza2RvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzk3ODEzNTMsImV4cCI6MjA1NTM1NzM1M30.W4kk1dtTyzM-D7WjsfYQrAuTaPnq6hlWmnJ2rbLsi-M', 
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
