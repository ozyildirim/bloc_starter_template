import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_starter_template/config/themes/dark_theme.dart';
import 'package:bloc_starter_template/config/themes/light_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/routers/app_router.dart';
import 'core/auth/bloc/auth_bloc.dart';
import 'core/auth/view/screens/sign_in_screen.dart';
import 'core/auth/view/screens/splash_screen.dart';
import 'core/dashboard/view/screens/dashboard_screen.dart';
import 'core/settings/cubit/settings_cubit.dart';
import 'core/theme/cubit/theme_cubit.dart';
import 'utils/app_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // final storage = await HydratedStorage.build(
  //   storageDirectory: await getApplicationDocumentsDirectory(),
  // );
  BlocOverrides.runZoned(
    () => runApp(
      MyApp(router: AppRouter()),
    ),
    blocObserver: AppBlocObserver(),
    // storage: storage,
  );
}

class MyApp extends StatefulWidget {
  final AppRouter router;
  const MyApp({Key? key, required this.router}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthRepository _authRepository = AuthRepository();
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = AuthBloc(authRepository: _authRepository);
  }

  @override
  void dispose() {
    _authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => _authBloc),
        BlocProvider<SettingsCubit>(create: (context) => SettingsCubit()),
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
      ],
      child: Builder(
        builder: (context) {
          return ScreenUtilInit(
            designSize: const Size(392, 737),
            builder: () => MaterialApp(
              theme: context.watch<ThemeCubit>().state.isDarkModeActive
                  ? darkTheme
                  : lightTheme,
              onGenerateRoute: AppRouter.onGenerateRoute,
              debugShowCheckedModeBanner: false,
              home: BlocBuilder(
                bloc: _authBloc,
                builder: (context, AuthState state) {
                  if (state is Initializing) {
                    return const SplashScreen();
                  }
                  if (state is Authenticated) {
                    return const DashboardScreen();
                  }
                  if (state is UnAuthenticated) {
                    return const SignInScreen();
                  }
                  if (state is Loading) {
                    return const Scaffold(
                      body: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
