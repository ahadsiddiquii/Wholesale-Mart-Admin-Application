import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../generic/helper_functions/loader_service.dart';
import '../../../../generic/helper_functions/response_popup_service.dart';
import '../category_resources/category_repository.dart';

part 'category_cud_event.dart';
part 'category_cud_state.dart';

class CategoryCudBloc extends Bloc<CategoryCudEvent, CategoryCudState> {
  CategoryCudBloc() : super(CategoryCudInitial()) {
    final CategoryRepository categoryRepository = CategoryRepository();
    on<AddCategory>((event, emit) async {
      try {
        emit(
          CategoryCudAdding(),
        );
        LoaderService.setContextSafeLoader(
          startLoader: true,
          loaderKeyForBloc: 'categoryCudAdding',
        );
        final bool categoryAdded = await categoryRepository.addCategory(
          categoryName: event.categoryName,
          categoryImage: event.categoryImage,
        );
        if (categoryAdded) {
          emit(
            CategoryCudAdded(),
          );
          LoaderService.setContextSafeLoader(
            startLoader: false,
            loaderKeyForBloc: 'categoryCudAdding',
          );
          ResponsePopUpService.showVerificationSuccessfullPopUp(
            heading: 'Category Added',
            message: 'Successfully added category.',
          );
        } else {
          throw Exception();
        }
      } catch (e) {
        emit(
          CategoryCudInitial(),
        );
        LoaderService.setContextSafeLoader(
          startLoader: false,
          loaderKeyForBloc: 'categoryCudAdding',
        );
        ResponsePopUpService.showVerificationFailedPopUp(
          heading: 'Error',
          message: 'Cannot add category, please try again.',
        );
      }
    });

    on<DeleteCategory>((event, emit) async {
      try {
        emit(
          CategoryCudDeleting(),
        );
        LoaderService.setContextSafeLoader(
          startLoader: true,
          loaderKeyForBloc: 'categoryCudDeleting',
        );
        final bool categoryDeleted = await categoryRepository.deleteCategory(
          categoryId: event.categoryId,
        );
        if (categoryDeleted) {
          emit(
            CategoryCudDeleted(),
          );
          LoaderService.setContextSafeLoader(
            startLoader: false,
            loaderKeyForBloc: 'categoryCudDeleting',
          );
          ResponsePopUpService.showVerificationSuccessfullPopUp(
            heading: 'Category Deleted',
            message: 'Successfully deleted category.',
          );
        } else {
          throw Exception();
        }
      } catch (e) {
        emit(
          CategoryCudInitial(),
        );
        LoaderService.setContextSafeLoader(
          startLoader: false,
          loaderKeyForBloc: 'categoryCudDeleting',
        );
        ResponsePopUpService.showVerificationFailedPopUp(
          heading: 'Error',
          message: 'Cannot delete category, please try again.',
        );
      }
    });

    on<UpdateCategory>((event, emit) async {
      try {
        emit(
          CategoryCudUpdating(),
        );
        LoaderService.setContextSafeLoader(
          startLoader: true,
          loaderKeyForBloc: 'categoryCudUpdating',
        );
        final bool categoryUpdated = await categoryRepository.updateCategory(
          categoryId: event.categoryId,
        );
        if (categoryUpdated) {
          emit(
            CategoryCudUpdated(),
          );
          LoaderService.setContextSafeLoader(
            startLoader: false,
            loaderKeyForBloc: 'categoryCudUpdating',
          );
          ResponsePopUpService.showVerificationSuccessfullPopUp(
            heading: 'Category Updated',
            message: 'Successfully updated category.',
          );
        } else {
          throw Exception();
        }
      } catch (e) {
        emit(
          CategoryCudInitial(),
        );
        LoaderService.setContextSafeLoader(
          startLoader: false,
          loaderKeyForBloc: 'categoryCudUpdating',
        );
        ResponsePopUpService.showVerificationFailedPopUp(
          heading: 'Error',
          message: 'Cannot update category, please try again.',
        );
      }
    });
  }
}
