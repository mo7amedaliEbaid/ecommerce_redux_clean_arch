import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeState extends Equatable {
  const ThemeState({required this.mode});

  final ThemeMode mode;

  factory ThemeState.initial() => const ThemeState(mode: ThemeMode.system);

  ThemeState copyWith({ThemeMode? mode}) => ThemeState(mode: mode ?? this.mode);

  @override
  List<Object?> get props => [mode];
}


