import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'category_cud_event.dart';
part 'category_cud_state.dart';

class CategoryCudBloc extends Bloc<CategoryCudEvent, CategoryCudState> {
  CategoryCudBloc() : super(CategoryCudInitial()) {
    on<CategoryCudEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
