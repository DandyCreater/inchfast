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
  static const String searchHighRack = "$_handleIdRoot/search_high_rack";
  static const String ncpNumber = "$_handleIdRoot/get_ncp_number";

  static const String _locationBuildingRoot = "api/v1/LocationBuilding";
  static const String locationBuildingList = "$_locationBuildingRoot/list";

  static const String _locationAreaRoot = "api/v1/LocationArea";
  static const String locationAreaList = "$_locationAreaRoot/list/IIMI.MB";

  static const String _locationSectionRoot = "api/v1/LocationSection";
  static const String locationSectionList =
      "$_locationSectionRoot/list/IIMI.MB";

  static const String _locationRackRoot = "api/v1/LocationRack";
  static const String locationRack = '$_locationRackRoot/get_by_code';
  static const String movePart = '$_locationRackRoot/move_part';

  static const String _containerContentRoot = "api/v1/ContainerContent";
  static const String packingMonth =
      "$_containerContentRoot/list_packing_month/IIMI.MB";

  static const String _packingContentRoot = "api/v1/PackingContent";
  static const String vehicle = "$_packingContentRoot/list_vehicle/IIMI.MB";
  static const String searchNcpData = "$_packingContentRoot/list_page";

  static const String _ncpRoot = "api/v1/Ncp";
  static const String submitNcp = "$_ncpRoot/add";

  static const String _ncpPartTypeRoot = "api/v1/NcpPartType";
  static const String ncpPartTypeList = "$_ncpPartTypeRoot/list/IIMI.MB";

  static const String _ncpFeedBackLocation = "api/v1/NcpFeedbackLocation";
  static const String ncpFeedBackLocationList =
      "$_ncpFeedBackLocation/list/IIMI.MB";

  static const String _shortageProblemRoot = "api/v1/ShortageProblem";
  static const String shortageProblemList =
      "$_shortageProblemRoot/list/IIMI.MB";
}
