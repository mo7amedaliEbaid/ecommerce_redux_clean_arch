import 'package:equatable/equatable.dart';

class CategoriesState extends Equatable {
  const CategoriesState({
    required this.categories,
    required this.isLoading,
    required this.error,
    required this.selected,
  });

  final List<String> categories;
  final bool isLoading;
  final String? error;
  final String selected;

  factory CategoriesState.initial() => const CategoriesState(
        categories: [],
        isLoading: false,
        error: null,
        selected: '',
      );

  CategoriesState copyWith({
    List<String>? categories,
    bool? isLoading,
    String? error,
    String? selected,
  }) {
    return CategoriesState(
      categories: categories ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      selected: selected ?? this.selected,
    );
  }

  @override
  List<Object?> get props => [categories, isLoading, error, selected];
}


