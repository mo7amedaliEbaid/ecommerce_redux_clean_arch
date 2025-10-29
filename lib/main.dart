import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'core/redux/app_state.dart';
import 'core/redux/store.dart';
import 'core/redux/theme/theme_actions.dart';
import 'core/router/router_config.dart';

void main() {
  final store = createAppStore();
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.store});

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: StoreConnector<AppState, ThemeMode>(
        converter: (s) => s.state.themeState.mode,
        builder: (context, themeMode) {
          return MaterialApp.router(
            title: 'ecommerce',
            debugShowCheckedModeBanner: false,
            routerConfig: appRouter,
            theme: themeMode == ThemeMode.light
                ? ThemeData.light()
                : ThemeData.dark(),
            darkTheme: ThemeData.dark().copyWith(
                elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber.shade700))),
            themeMode: themeMode,
          );
        },
        distinct: true,
      ),
    );
  }
}
