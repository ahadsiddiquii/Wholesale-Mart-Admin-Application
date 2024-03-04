import '../apis/loader_status.dart';
import '../context/app_context.dart';

class LoaderService {
  LoaderService._();
  static void setContextSafeLoader({
    required bool startLoader,
    required String loaderKeyForBloc,
  }) {
    appContext.runContextSafeFunction(() {
      if (startLoader) {
        LoaderStatus.setLoaderToLoading(
          appContext.getContext()!,
          keyForBloc: loaderKeyForBloc,
        );
      } else {
        LoaderStatus.dismissLoader(
          appContext.getContext()!,
          keyForBloc: loaderKeyForBloc,
        );
      }
    });
  }
}
