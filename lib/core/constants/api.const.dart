class APIConst {
  static const String _userRoot = "api/v1/User";
  static const String login = "$_userRoot/login";

  static const String _handleIdRoot = "api/v1/Handheld";
  static const String searchUnloading = "$_handleIdRoot/search_unloading";
  static const String unloadingStatus = '$_handleIdRoot/list_unloading_status';
  static const String unloadingLocation =
      '$_handleIdRoot/list_unloading_location';
  static const String submitUnloading = "$_handleIdRoot/submit_unloading";
}
