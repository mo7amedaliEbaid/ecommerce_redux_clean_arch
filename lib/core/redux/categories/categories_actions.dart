import 'package:redux_thunk/redux_thunk.dart';

import '../../di/di.dart' as di;
import '../app_state.dart';

class LoadCategoriesRequest {}

class LoadCategoriesSuccess {
  LoadCategoriesSuccess(this.categories);
  final List<String> categories;
}

class LoadCategoriesFailure {
  LoadCategoriesFailure(this.message);
  final String message;
}

class SelectCategoryAction {
  SelectCategoryAction(this.category);
  final String category;
}

ThunkAction<AppState> fetchCategories() {
  return (store) async {
    store.dispatch(LoadCategoriesRequest());
    final result = await di.categoryUseCase.categories();
    result.fold(
      (l) => store.dispatch(LoadCategoriesFailure(l.toString())),
      (r) => store.dispatch(LoadCategoriesSuccess(r)),
    );
  };
}


