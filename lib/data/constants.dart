import 'dart:io';

abstract class Constants {

  static final String _sep = Platform.isWindows ? '\\' : '/';

  // Directories
  static final String appDirectoryPath = "${_sep}lib${_sep}App";
  static final String dataDirectoryPath = "${_sep}lib${_sep}App${_sep}data";
  static final String constantsDirectoryPath = "${_sep}lib${_sep}App${_sep}data${_sep}constants";
  static final String providerDirectoryPath = "${_sep}lib${_sep}App${_sep}data${_sep}provider";
  static final String screensDirectoryPath = "${_sep}lib${_sep}App${_sep}screens";
  static final String widgetsDirectoryPath = "${_sep}lib${_sep}App${_sep}widgets";
  static final String utilsDirectoryPath = "${_sep}lib${_sep}App${_sep}utils";

  // Files
  static final String mainFilePath = "${_sep}lib${_sep}main.dart";
  static final String appFilePath = "${_sep}lib${_sep}app.dart";
  static final String pubspecFilePath = "${_sep}pubspec.yaml";
  static final String appRoutesPath = "${_sep}lib${_sep}App${_sep}routes${_sep}app_routes.dart";
  static final String routeNavigatorPath = "${_sep}lib${_sep}App${_sep}routes${_sep}route_navigator.dart";

  // Constants
  static final String colorConstantsPath = "${_sep}lib${_sep}App${_sep}data${_sep}constants${_sep}color_constants.dart";
  static final String urlManagerPath = "${_sep}lib${_sep}App${_sep}data${_sep}constants${_sep}url_manager.dart";

  // Providers
  static final String preferenceProviderPath = "${_sep}lib${_sep}App${_sep}data${_sep}provider${_sep}preference_provider.dart";
  static final String apiProviderPath = "${_sep}lib${_sep}App${_sep}data${_sep}provider${_sep}api_provider.dart";

  // Screens
  static final String baseScreenPath = "${_sep}lib${_sep}App${_sep}screens${_sep}base_screen${_sep}view${_sep}base_screen.dart";
  static final String baseDialogPath = "${_sep}lib${_sep}App${_sep}screens${_sep}base_screen${_sep}view${_sep}base_dialog.dart";
  static final String customAppbarPath = "${_sep}lib${_sep}App${_sep}screens${_sep}base_screen${_sep}view${_sep}custom_appbar.dart";
  static final String splashScreenPath = "${_sep}lib${_sep}App${_sep}screens${_sep}splash_screen${_sep}view${_sep}splash_screen.dart";
  static final String homeScreenPath = "${_sep}lib${_sep}App${_sep}screens${_sep}home_screen${_sep}view${_sep}home_screen.dart";
  static final String homeScreenRepositoryPath = "${_sep}lib${_sep}App${_sep}screens${_sep}home_screen${_sep}repository${_sep}home_screen_repository.dart";
  static final String homeScreenBlocPath = "${_sep}lib${_sep}App${_sep}screens${_sep}home_screen${_sep}bloc${_sep}home_screen_bloc.dart";
  static final String homeScreenStatePathBloc = "${_sep}lib${_sep}App${_sep}screens${_sep}home_screen${_sep}bloc${_sep}home_screen_state.dart";
  static final String homeScreenEventPath = "${_sep}lib${_sep}App${_sep}screens${_sep}home_screen${_sep}bloc${_sep}home_screen_event.dart";
  static final String homeScreenCubitPath = "${_sep}lib${_sep}App${_sep}screens${_sep}home_screen${_sep}cubit${_sep}home_screen_cubit.dart";
  static final String homeScreenStatePathCubit = "${_sep}lib${_sep}App${_sep}screens${_sep}home_screen${_sep}cubit${_sep}home_screen_state.dart";

  // Utils
  static final String commonUtilsFilePath = "${_sep}lib${_sep}App${_sep}utils${_sep}common.dart";
  static final String assetImagesPath = "${_sep}lib${_sep}App${_sep}utils${_sep}asset_images.dart";
  static final String textStyleFilePath = "${_sep}lib${_sep}App${_sep}utils${_sep}app_text_style.dart";

  // Widgets
  static final String textFieldWidgetPath = "${_sep}lib${_sep}App${_sep}widgets${_sep}app_textfield.dart";
  static final String checkboxWidgetPath = "${_sep}lib${_sep}App${_sep}widgets${_sep}app_checkbox.dart";
  static final String radioButtonWidgetPath = "${_sep}lib${_sep}App${_sep}widgets${_sep}app_radio_button.dart";
  static final String networkImageWidgetPath = "${_sep}lib${_sep}App${_sep}widgets${_sep}app_network_image.dart";
}
