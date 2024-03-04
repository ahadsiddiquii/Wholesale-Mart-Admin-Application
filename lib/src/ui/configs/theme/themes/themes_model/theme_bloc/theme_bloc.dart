import '../../../../../generic/enums/theme_enum.dart';
import '../../../../../generic/exports/bloc_exports.dart';
import '../../../../local_storage_sqflite/local_storage_sqflite.dart';
import '../../../../local_storage_sqflite/sqflite_model.dart';
import '../../../theme_config.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<CheckedSavedTheme>((event, emit) async {
      final Data? currentThemeFlavorName =
          await LocalStorageSqfLite.getDataByKey(
        AppThemeConfig().themeStorageKey,
      );
      if (currentThemeFlavorName != null) {
        final ThemeFlavor? themeFlavorByName =
            getThemeFlavorByName(currentThemeFlavorName.value);
        if (themeFlavorByName != null) {
          emit(
            ThemeFetched(theme: themeFlavorByName),
          );
        } else {
          LocalStorageSqfLite.insertData(Data(
            key: AppThemeConfig().themeStorageKey,
            value: ThemeFlavor.Default.name,
          ));

          emit(ThemeFetched(
            theme: ThemeFlavor.Default,
          ));
        }
      } else {
        LocalStorageSqfLite.insertData(Data(
          key: AppThemeConfig().themeStorageKey,
          value: ThemeFlavor.Default.name,
        ));

        emit(ThemeFetched(
          theme: ThemeFlavor.Default,
        ));
      }
    });
    on<SwitchAppTheme>((event, emit) async {
      LocalStorageSqfLite.insertData(Data(
        key: AppThemeConfig().themeStorageKey,
        value: event.updatedFlavor.name,
      ));

      emit(
        ThemeFetched(
          theme: event.updatedFlavor,
        ),
      );
    });
  }
}
