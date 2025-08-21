class APIConst {
  //Base URL

  static const String apiBaseUrl = 'https://pds.api.ilyasin.com/';
  static const String authBaseUrl = 'https://pds.identity.ilyasin.com/';

  //API Path

  static const String _userRoot = "api/v1/User";
  static const String login = "$_userRoot/login";

  static const String _handleIdRoot = "api/v1/Handheld";
  static const String searchUnloading = "$_handleIdRoot/search_unloading";
  static const String unloadingStatus = '$_handleIdRoot/list_unloading_status';
  static const String unloadingLocation =
      '$_handleIdRoot/list_unloading_location';
  static const String submitUnloading = "$_handleIdRoot/submit_unloading";
  static const String submitMovingBox = "$_handleIdRoot/submit_moving_box";
  static const String searchMovingBox = "$_handleIdRoot/search_moving_box";

  static const String _locationBuildingRoot = "api/v1/LocationBuilding";
  static const String locationBuildingList = "$_locationBuildingRoot/list";

  static const String _locationAreaRoot = "api/v1/LocationArea";
  static const String locationAreaList = "$_locationAreaRoot/list/IIMI.MB";

  static const String _locationSectionRoot = "api/v1/LocationSection";
  static const String locationSectionList =
      "$_locationSectionRoot/list/IIMI.MB";
}
