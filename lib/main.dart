// import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/Screens/LoginScreen.dart';
import 'package:untitled1/Screens/homepage.dart';

// Future<void> main() async {
void main(){
  // WidgetsFlutterBinding.ensureInitialized();
  // cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Color(0xFF075E54),
          secondary: Color(0xFF128C7E)
        )
      ),
      home: LoginScreen()
    );
  }
}