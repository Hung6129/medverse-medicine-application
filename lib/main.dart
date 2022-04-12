import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:medverse_mobile_app/controller/cubit/search_cache/search_cache_cubit.dart';
import 'package:medverse_mobile_app/routes/app_routes.dart';
import 'package:provider/provider.dart';
import '/components/life_cycle_event_handler.dart';
import '/landing/landing_page.dart';
import '/services/user_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/models/test/saved_drug_list_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'controller/cubit/drugs_data/drugs_data_cubit.dart';
import '/utils/config.dart';
import '/utils/constants.dart';
import '/utils/providers.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<SavedDrugListModel>(SavedDrugListModelAdapter());
  await Hive.openBox<SavedDrugListModel>("savedList");
  await Hive.openBox("search-cache");
  WidgetsFlutterBinding.ensureInitialized();
  await Config.initFirebase();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(
      LifecycleEventHandler(
        detachedCallBack: () => UserService().setUserStatus(false),
        resumeCallBack: () => UserService().setUserStatus(true),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
            title: Constants.appName,
            debugShowCheckedModeBanner: false,
            theme: notifier.dark ? Constants.darkTheme : Constants.lightTheme,
            home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                if (snapshot.hasData) {
                  return
                      BlocProvider(
                        create: (context) => DrugsDataCubit(),
                      

                    
                    child: GetMaterialApp(
                      debugShowCheckedModeBanner: false,
                      onGenerateRoute: AppRoutes.onGeneratedRoutes,
                    ),
                  );
                } else {
                  return Landing();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
