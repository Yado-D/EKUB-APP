import 'package:ekub_application/config/theme/theme_mode_provider.dart';
import 'package:ekub_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ekub_application/features/home_page/data/data_source/home_remote_data_source.dart';
import 'package:ekub_application/features/home_page/data/repository/home_repository_implm.dart';
import 'package:ekub_application/features/home_page/domain/usecases/home_%20equb_loading.dart';
import 'package:ekub_application/features/home_page/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'config/theme/theme.dart';
import 'features/onboarding/presentation/pages/onboarding_first_page.dart';
import 'init_dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (create) => serviceLocator<AuthBloc>(),
        ),
        BlocProvider(
          create: (create) => HomeBloc(
            homeEqubLoading: HomeEqubLoading(
              HomeRepositoryImpl(
                HomeRemoteDataResourceImplm(),
              ),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeManager themeManager = ThemeManager();

  @override
  void initState() {
    themeManager.addListener(themeListener);
    // TODO: implement initState
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    themeManager.removeListener(themeListener);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeManager()),
        ],
        child: Builder(builder: (context) {
          return MaterialApp(
            theme: lightMode,
            darkTheme: darkMode,
            themeMode: context.watch<ThemeManager>().themeMode,
            debugShowCheckedModeBanner: false,
            home: onBoardingOnePage(),
          );
        }),
      ),
    );
  }
}
