import 'package:e_market/features/auth/presentation/manager/cubit/authentication_cubit.dart';
import 'package:e_market/features/nav_bar/presentation/views/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://vlsmvtmxeceraphscpma.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZsc212dG14ZWNlcmFwaHNjcG1hIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM5NzY5NTAsImV4cCI6MjA3OTU1Mjk1MH0.fJPsakBH6298YVByce7VufvTata7b_CNdZvUvAzC0FQ',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E Market',
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        home: BottomNavBar(),
      ),
    );
  }
}
