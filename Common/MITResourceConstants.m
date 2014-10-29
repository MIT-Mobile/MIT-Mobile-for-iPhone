#import "MITResourceConstants.h"

#pragma mark Module Icons
NSString * const MITImageAboutModuleIcon = @"home-about";
NSString * const MITImageBuildingServicesModuleIcon = @"home-facilities";
NSString * const MITImageEventsModuleIcon = @"home-calendar";
NSString * const MITImageMapModuleIcon = @"home-map";
NSString * const MITImageDiningModuleIcon = @"home-dining";
NSString * const MITImageEmergencyModuleIcon = @"home-emergency";
NSString * const MITImageLibrariesModuleIcon = @"home-libraries";
NSString * const MITImageLinksModuleIcon = @"home-webmitedu";
NSString * const MITImageNewsModuleIcon = @"home-news";
NSString * const MITImagePeopleModuleIcon = @"home-people";
NSString * const MITImageScannerModuleIcon = @"home-qrreader";
NSString * const MITImageSettingsModuleIcon = @"home-settings";
NSString * const MITImageShuttlesModuleIcon = @"home-shuttle";
NSString * const MITImageToursModuleIcon = @"home-tours";

#pragma mark - Dining
NSString * const MITImageDiningBookmark = @"dining-bookmark";
NSString * const MITImageDiningBookmarkSelected = @"dining-bookmark-selected";
NSString * const MITImageDiningInfo = @"dining-info";
NSString * const MITImageDiningInfoHighlighted = @"dining-info-pressed";
NSString * const MITImageDiningRotateDevice = @"dining-rotate-device";

#pragma mark Meal Types
NSString * const MITImageDiningMealFarmToFork = @"dining-meal-farm_to_fork";
NSString * const MITImageDiningMealGlutenFree = @"dining-meal-gluten_free";
NSString * const MITImageDiningMealHalal = @"dining-meal-halal";
NSString * const MITImageDiningMealHumane = @"dining-meal-humane";
NSString * const MITImageDiningMealInBalance = @"dining-meal-in_balance";
NSString * const MITImageDiningMealKosher = @"dining-meal-kosher";
NSString * const MITImageDiningMealOrganic = @"dining-meal-organic";
NSString * const MITImageDiningMealSeafoodWatch = @"dining-meal-seafood_watch";
NSString * const MITImageDiningMealVegan = @"dining-meal-vegan";
NSString * const MITImageDiningMealVegetarian = @"dining-meal-vegetarian";
NSString * const MITImageDiningMealWellBeing = @"dining-meal-well_being";

// In use by UIImage+PDF. Will be removed and replaced by vector image assets
// the correct image sizes are generated (the app uses a mix of 20x20 and 24x24).
NSString * const MITResourceDiningMealFarmToFork = @"dining-meal-farm_to_fork.pdf";
NSString * const MITResourceDiningMealGlutenFree = @"dining-meal-gluten_free.pdf";
NSString * const MITResourceDiningMealHalal = @"dining-meal-halal.pdf";
NSString * const MITResourceDiningMealHumane = @"dining-meal-humane.pdf";
NSString * const MITResourceDiningMealInBalance = @"dining-meal-in_balance.pdf";
NSString * const MITResourceDiningMealKosher = @"dining-meal-kosher.pdf";
NSString * const MITResourceDiningMealOrganic = @"dining-meal-organic.pdf";
NSString * const MITResourceDiningMealSeafoodWatch = @"dining-meal-seafood_watch.pdf";
NSString * const MITResourceDiningMealVegan = @"dining-meal-vegan.pdf";
NSString * const MITResourceDiningMealVegetarian = @"dining-meal-vegetarian.pdf";
NSString * const MITResourceDiningMealWellBeing = @"dining-meal-well_being.pdf";

#pragma mark - Events (Calendar)
NSString * const MITImageEventsDayPickerButton = @"events-day_picker_button";
NSString * const MITImageEventsPadChevronUp = @"events-pad-chevron_up";
NSString * const MITImageEventsPadChevronDown = @"events-pad-chevron_down";

#pragma mark - Libraries
NSString * const MITImageLibrariesCheckmark = @"libraries-cell-unselected";
NSString * const MITImageLibrariesCheckmarkSelected = @"libraries-checkmark-selected";

#pragma mark Status Types
NSString * const MITImageLibrariesStatusAlert = @"libraries-status-alert";
NSString * const MITImageLibrariesStatusError = @"libraries-status-error";
NSString * const MITImageLibrariesStatusOK = @"libraries-status-ok";
NSString * const MITImageLibrariesStatusReady = @"libraries-status-ready";

#pragma mark - Map
NSString * const MITImageMapBrowseBuildings = @"map-browse-buildings";
NSString * const MITImageMapBrowseFoodServices = @"map-browse-food-services";
NSString * const MITImageMapBrowseResidences = @"map-browse-residences";
NSString * const MITImageMapLocation = @"map-location";
NSString * const MITImageMapLocationHighlighted = @"map-location-highlighted";
NSString * const MITImageMapAnnotationUserLocation = @"map-annotation-user-location";
NSString * const MITImageMapAnnotationPin = @"map-annotation-pin";
NSString * const MITImageMapAnnotationPlacePin = @"map-annotation-place-pin";


#pragma mark - News
NSString * const MITImageNewsImagePlaceholder = @"news-placeholder";

// Used by the News story HTML template. These may no longer be in
// active use (although they are referenced).
NSString * const MITImageNewsTemplateButtonBookmark = @"news-template-bookmark_button";
NSString * const MITImageNewsTemplateButtonShare = @"news-template-share";
NSString * const MITImageNewsTemplateButtonShareHighlighted = @"news-template-share_pressed";
NSString * const MITImageNewsTemplateButtonZoomIn = @"news-template-button-zoom_in";


#pragma mark - People Directory
NSString * const MITImagePeopleDirectoryDestructiveButton = @"people-button-delete";
NSString * const MITImagePeopleDirectoryDestructiveButtonHighlighted = @"people-button-delete-highlighted";


#pragma mark - Scanner
NSString * const MITImageScannerCameraUnsupported = @"scanner-camera-unsupported";
NSString * const MITImageScannerSampleBarcode = @"scanner-sample-barcode";
NSString * const MITImageScannerSampleQRCode = @"scanner-sample-qr";
NSString * const MITImageScannerMissingImage = @"scanner-missing-image";
NSString * const MITImageScannerScanBarButton = @"scanner-barbutton-scan";


#pragma mark - Shuttles
NSString * const MITImageShuttlesShuttleRouteActive = @"shuttles-shuttle";
NSString * const MITImageShuttlesShuttleRouteInactive = @"shuttles-shuttle-off";
NSString * const MITImageShuttlesShuttleRouteLocationUnavailable = @"shuttles-shuttle-location_unavailable";
NSString * const MITImageShuttlesBusBubble = @"shuttles-bus-bubble";
NSString * const MITImageShuttlesAlertOn = @"shuttles-alert_on";
NSString * const MITImageShuttlesAlertOff = @"shuttles-alert_off";
NSString * const MITImageShuttlesAnnotationBus = @"shuttles-bus-annotation";
NSString * const MITImageShuttlesAnnotationNextStop = @"shuttles-stop-dot-next";
NSString * const MITImageShuttlesAnnotationNextStopSelected = @"shuttles-stop-dot-next-selected";
NSString * const MITImageShuttlesAnnotationCurrentStop = @"shuttles-stop-dot";
NSString * const MITImageShuttlesAnnotationCurrentStopSelected = @"shuttles-stop-dot-selected";


#pragma mark - Tours
NSString * const MITImageToursWBRogers = @"tours-wb_rogers";
NSString * const MITImageToursKillian = @"tours-killian";
NSString * const MITImageToursMITSeal = @"tours-mit_seal";
NSString * const MITImageToursSideTripArrow = @"tours-side_trip_arrow";
NSString * const MITImageToursScrimNotSure = @"tours-scrim-not_sure";
NSString * const MITImageToursScrimNotSureTop = @"tours-scrim-not_sure-top";

NSString * const MITImageToursWallpaperKillian = @"tours-wallpaper-killian";
NSString * const MITImageToursWallpaperStata = @"tours-wallpaper-stata";
NSString * const MITImageToursWallpaperGreatSail = @"tours-wallpaper-great_sail";

#pragma mark Current Tour Progress Bar
NSString * const MITImageToursProgressBarBackground = @"tours-progress_bar-background";
NSString * const MITImageToursProgressBarCurrent = @"tours-progress_bar-current";
NSString * const MITImageToursProgressBarDivider = @"tours-progress_bar-divider";
NSString * const MITImageToursProgressBarPast = @"tours-progress_bar-past";
NSString * const MITImageToursProgressBarTrench = @"tours-progress_bar-trench";

#pragma mark Toolbar Icons
NSString * const MITImageToursToolbarArrowLeft = @"tours-toolbar-arrow_left";
NSString * const MITImageToursToolbarArrowRight = @"tours-tours-toolbar-arrow_right";
NSString * const MITImageToursToolbarBackground = @"tours-tours-toolbar-background";
NSString * const MITImageToursToolbarCamera = @"tours-tours-toolbar-camera";
NSString * const MITImageToursToolbarMap = @"tours-tours-toolbar-map";
NSString * const MITImageToursToolbarQR = @"tours-tours-toolbar-qr";

NSString * const MITImageToursButtonAudioPause = @"tours-button-pause";
NSString * const MITImageToursButtonAudio = @"tours-button-audio";
NSString * const MITImageToursButtonMap = @"tours-button-map";
NSString * const MITImageToursButtonMapHighlighted = @"tours-button-map-highlighted";
NSString * const MITImageToursButtonLocation = @"tours-button-location";
NSString * const MITImageToursButtonScanQR = @"tours-button-qr";
NSString * const MITImageToursButtonScanQRHighlighted = @"tours-button-qr-highlighted";
NSString * const MITImageToursButtonSidetrip = @"tours-button-sidetrip";
NSString * const MITImageToursButtonSelectStart = @"tours-button-select_start";
NSString * const MITImageToursButtonSelectStartMerged = @"tours-button-select_start-double";
NSString * const MITImageToursButtonReturn = @"tours-button-return";

NSString * const MITImageToursAnnotationStopInitial = @"tours-annotation-stop-initial";
NSString * const MITImageToursAnnotationStopCurrent = @"tours-annotation-stop-current";
NSString * const MITImageToursAnnotationStopUnvisited = @"tours-annotation-stop-unvisited";
NSString * const MITImageToursAnnotationStopVisited = @"tours-annotation-stop-visited";
NSString * const MITImageToursAnnotationArrowEnd = @"tours-annotation-arrow-end";
NSString * const MITImageToursAnnotationArrowStart = @"tours-annotation-arrow-start";
NSString * const MITImageToursMapLegendOverlay = @"tours-map-legend-overlay";

NSString * const MITImageToursTemplateButtonExternalLink = @"tours-template-extlink";


#pragma mark - Global Assets
NSString * const MITImageNameEmail = @"global-action-email";
NSString * const MITImageNameEmailHighlight = @"global-action-email-highlight";
NSString * const MITImageNameMap = @"global-action-map";
NSString * const MITImageNameMapHighlight = @"global-action-map-highlight";
NSString * const MITImageNamePeople = @"global-action-people";
NSString * const MITImageNamePeopleHighlight = @"global-action-people-highlight";
NSString * const MITImageNamePhone = @"global-action-phone";
NSString * const MITImageNamePhoneHighlight = @"global-action-phone-highlight";
NSString * const MITImageActionExternalWhite = @"global-action-external_white";
NSString * const MITImageActionExternal = @"global-action-external";
NSString * const MITImageActionExternalHighlight = @"global-action-external-highlight";
NSString * const MITImageNameEmergency = @"global-action-emergency";
NSString * const MITImageNameEmergencyHighlight = @"global-action-emergency-highlight";
NSString * const MITImageNameSecure = @"global-action-secure";
NSString * const MITImageNameSecureHighlight = @"global-action-secure-highlight";
NSString * const MITImageNameCalendar = @"global-action-calendar";
NSString * const MITImageNameCalendarHighlight = @"global-action-calendar-highlight";
NSString * const MITImageNameShare = @"global-action-share";

NSString * const MITImageNameLeftArrow = @"global-arrow-white-left";
NSString * const MITImageNameRightArrow = @"global-arrow-white-right";
NSString * const MITImageNameUpArrow = @"global-arrow-white-up";
NSString * const MITImageNameDownArrow = @"global-arrow-white-down";

NSString * const MITImageNameSearch = @"global-search";
NSString * const MITImageNameBookmark = @"global-bookmark";
NSString * const MITImageDisclosureRight = @"global-disclosure_right";
NSString * const MITImageTransparentPixel = @"global-transparent-pixel";

NSString * const MITImageLogoDarkContent = @"global-mit-logo-light";
NSString * const MITImageLogoLightContent = @"global-mit-logo-dark";

#pragma mark UIBarButtonItem icons
NSString * const MITImageBarButtonMenu = @"global-menu";
NSString * const MITImageBarButtonLocation = @"global-location";
NSString * const MITImageBarButtonList = @"global-barbutton-list";

// TODO: See if we really need both these icons
NSString * const MITImageBarButtonSearch = @"global-search";
NSString * const MITImageBarButtonSearchMagnifier = @"global-search-magnifier";

#pragma mark MITTabView Assets
NSString * const MITImageTabViewDivider = @"global-tab-divider";
NSString * const MITImageTabViewHeader  = @"global-tab-header";
NSString * const MITImageTabViewSummaryButton = @"global-tab-summary_button";
NSString * const MITImageTabViewActive = @"global-tab-active";
NSString * const MITImageTabViewInactive  = @"global-tab-inactive";
NSString * const MITImageTabViewInactiveHighlighted = @"global-tab-inactive_highlighted";