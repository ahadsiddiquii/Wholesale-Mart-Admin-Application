import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ui/configs/bloc_providers.dart';
import 'ui/configs/router/responsive_framework_helper.dart';
import 'ui/configs/router/route_animation.dart';
import 'ui/configs/router/routes.dart';
import 'ui/configs/screen_config.dart';
import 'ui/configs/theme/theme_config.dart';
import 'ui/configs/theme/themes/themes_view_model/theme_bloc_builder_wrapper.dart';
import 'ui/configs/theme/themes/themes_view_model/theme_bloc_helper.dart';
import 'ui/configs/translation/translations/translations_model/global_translation.dart';
import 'ui/configs/translation/translations/translations_model/translation_bloc/translation_bloc.dart';
import 'ui/generic/exports/widget_exports.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    final AppThemeConfig appThemeConfig = AppThemeConfig();
    final ResponsiveFrameworkHelper responsiveFrameworkHelper =
        ResponsiveFrameworkHelper();
    return BlocInitializer(
      child: FocusHandler(
        child: ScreenUtilInit(
          designSize:
              Size(ScreenConfig.screenSizeWidth, ScreenConfig.screenSizeHeight),
          builder: (context, _) =>
              BlocBuilder<TranslationBloc, TranslationState>(
            builder: (context, state) {
              return ThemeBuilderWrapper(
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: appThemeConfig.getThemeData(
                    ThemeBlocHelper.getCurrentThemeFlavor(
                      context,
                    ),
                  ),
                  locale: state.locale,
                  supportedLocales: translations.supportedLocales(),
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  builder: (context, child) => responsiveFrameworkHelper
                      .responsiveBreakpointsBuilder(child!),
                  initialRoute: CustomRouter.splashScreenRouteName,
                  onGenerateRoute: (RouteSettings settings) {
                    return Routes.fadeThrough(
                      settings,
                      (context) {
                        return ConditionalRouteWidget(
                          builder: (context, child) => responsiveFrameworkHelper
                              .responsiveFrameworkMaxWidthBox(
                            context,
                            child!,
                          ),
                          routes: CustomRouter.routes.keys.toList(),
                          child: responsiveFrameworkHelper
                              .bouncingScrollWrapperBuilder(
                            context,
                            settings,
                          ),
                        );
                      },
                    );
                    
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
