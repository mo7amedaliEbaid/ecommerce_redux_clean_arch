import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'theme_actions.dart';
import 'theme_state.dart';

final Reducer<ThemeState> themeReducer = combineReducers<ThemeState>([
  TypedReducer<ThemeState, ToggleThemeAction>(_toggleTheme),
]);

ThemeState _toggleTheme(ThemeState state, ToggleThemeAction action) {
  final next = state.mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  return state.copyWith(mode: next);
}


