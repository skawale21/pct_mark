import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pct_mark/core/theme.dart';
import 'package:pct_mark/features/auth/presentation/bloc/login_bloc.dart';
import 'package:pct_mark/features/auth/presentation/login_screen.dart';
import 'package:pct_mark/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => serviceLocator<
          LoginBloc>(), //bloc provider for registered service LoginBloc
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Property Care Taker',
      theme: AppTheme.lightThemeMode,
      home: const LoginScreen(),
    );
  }
}
