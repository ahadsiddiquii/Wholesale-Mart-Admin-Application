import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../generic/helper_functions/loader_service.dart';
import '../category.dart';
import '../category_resources/category_repository.dart';

part 'all_categories_event.dart';
part 'all_categories_state.dart';

class AllCategoriesBloc extends Bloc<AllCategoriesEvent, AllCategoriesState> {
  AllCategoriesBloc() : super(AllCategoriesInitial()) {
    final CategoryRepository categoryRepository = CategoryRepository();

    on<ResetAllCategoriesStateToInitial>(
      (event, emit) async {
        emit(
          AllCategoriesInitial(),
        );
      },
    );
    on<FetchAllCategories>(
      (event, emit) async {
        try {
          emit(
            AllCategoriesLoading(),
          );
          LoaderService.setContextSafeLoader(
            startLoader: true,
            loaderKeyForBloc: 'fetchAllCategories',
          );
          final List<Category> allCategoriesRetrieved =
              await categoryRepository.getCategories();

          emit(
            AllCategoriesRetrieved(
              allCategories: allCategoriesRetrieved,
            ),
          );
          LoaderService.setContextSafeLoader(
            startLoader: false,
            loaderKeyForBloc: 'fetchAllCategories',
          );
        } catch (e) {
          emit(
            AllCategoriesInitial(),
          );
          LoaderService.setContextSafeLoader(
            startLoader: false,
            loaderKeyForBloc: 'fetchAllCategories',
          );
        }
      },
    );

    on<RefreshAllCategories>((event, emit) async {
      try {
        final List<Category> allCategoriesRetrieved =
            await categoryRepository.getCategories();
        emit(
          AllCategoriesRetrieved(
            allCategories: allCategoriesRetrieved,
          ),
        );
      } catch (e) {
        emit(
          AllCategoriesRetrieved(
            allCategories: event.previousCategories,
          ),
        );
      }
    });
  }
}
