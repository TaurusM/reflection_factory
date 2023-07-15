//
// GENERATED CODE - DO NOT MODIFY BY HAND!
// BUILDER: reflection_factory/2.1.6
// BUILD COMMAND: dart run build_runner build
//

// coverage:ignore-file
// ignore_for_file: unused_element
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_cast
// ignore_for_file: unnecessary_type_check

part of 'reflection_factory_bridge_example.dart';

typedef __TR<T> = TypeReflection<T>;
typedef __TI<T> = TypeInfo<T>;
typedef __PR = ParameterReflection;

mixin __ReflectionMixin {
  static final Version _version = Version.parse('2.1.6');

  Version get reflectionFactoryVersion => _version;

  List<Reflection> siblingsReflection() => _siblingsReflection();
}

// ignore: non_constant_identifier_names
GetMaterialApp GetMaterialApp$fromJson(Map<String, Object?> map) =>
    GetMaterialApp$reflection.staticInstance.fromJson(map);
// ignore: non_constant_identifier_names
GetMaterialApp GetMaterialApp$fromJsonEncoded(String jsonEncoded) =>
    GetMaterialApp$reflection.staticInstance.fromJsonEncoded(jsonEncoded);

class GetMaterialApp$reflection extends ClassReflection<GetMaterialApp>
    with __ReflectionMixin {
  static final Expando<GetMaterialApp$reflection> _objectReflections =
      Expando();

  factory GetMaterialApp$reflection([GetMaterialApp? object]) {
    if (object == null) return staticInstance;
    return _objectReflections[object] ??= GetMaterialApp$reflection._(object);
  }

  GetMaterialApp$reflection._([GetMaterialApp? object])
      : super(GetMaterialApp, 'GetMaterialApp', object);

  static bool _registered = false;
  @override
  void register() {
    if (!_registered) {
      _registered = true;
      super.register();
      _registerSiblingsReflection();
    }
  }

  @override
  Version get languageVersion => Version.parse('2.15.0');

  @override
  GetMaterialApp$reflection withObject([GetMaterialApp? obj]) =>
      GetMaterialApp$reflection(obj)..setupInternalsWith(this);

  static GetMaterialApp$reflection? _withoutObjectInstance;
  @override
  GetMaterialApp$reflection withoutObjectInstance() => staticInstance;

  static GetMaterialApp$reflection get staticInstance =>
      _withoutObjectInstance ??= GetMaterialApp$reflection._();

  @override
  GetMaterialApp$reflection getStaticInstance() => staticInstance;

  static bool _boot = false;
  static void boot() {
    if (_boot) return;
    _boot = true;
    GetMaterialApp$reflection.staticInstance;
  }

  @override
  bool get hasDefaultConstructor => true;
  @override
  GetMaterialApp? createInstanceWithDefaultConstructor() => GetMaterialApp();

  @override
  bool get hasEmptyConstructor => false;
  @override
  GetMaterialApp? createInstanceWithEmptyConstructor() => null;
  @override
  bool get hasNoRequiredArgsConstructor => true;
  @override
  GetMaterialApp? createInstanceWithNoRequiredArgsConstructor() =>
      GetMaterialApp.router();

  static const List<String> _constructorsNames = const <String>['', 'router'];

  @override
  List<String> get constructorsNames => _constructorsNames;

  static final Map<String, ConstructorReflection<GetMaterialApp>>
      _constructors = <String, ConstructorReflection<GetMaterialApp>>{};

  @override
  ConstructorReflection<GetMaterialApp>? constructor(String constructorName) {
    var c = _constructors[constructorName];
    if (c != null) return c;
    c = _constructorImpl(constructorName);
    if (c == null) return null;
    _constructors[constructorName] = c;
    return c;
  }

  ConstructorReflection<GetMaterialApp>? _constructorImpl(
      String constructorName) {
    var lc = constructorName.trim().toLowerCase();

    switch (lc) {
      case '':
        return ConstructorReflection<GetMaterialApp>(
            this,
            GetMaterialApp,
            '',
            () => (
                    {Key? key,
                    GlobalKey<NavigatorState>? navigatorKey,
                    GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,
                    Widget? home,
                    Map<String, Widget Function(BuildContext)> routes =
                        const <String, WidgetBuilder>{},
                    String? initialRoute,
                    Route<dynamic>? Function(RouteSettings settings)?
                        onGenerateRoute,
                    List<Route<dynamic>> Function(String initialRoute)?
                        onGenerateInitialRoutes,
                    Route<dynamic>? Function(RouteSettings settings)?
                        onUnknownRoute,
                    bool useInheritedMediaQuery = false,
                    List<NavigatorObserver> navigatorObservers =
                        const <NavigatorObserver>[],
                    Widget Function(BuildContext context, Widget? child)?
                        builder,
                    TextDirection? textDirection,
                    String title = '',
                    String Function(BuildContext context)? onGenerateTitle,
                    Color? color,
                    ThemeData? theme,
                    ThemeData? darkTheme,
                    ThemeMode themeMode = ThemeMode.system,
                    Locale? locale,
                    Locale? fallbackLocale,
                    Iterable<LocalizationsDelegate<dynamic>>?
                        localizationsDelegates,
                    Locale? Function(List<Locale>? locales,
                            Iterable<Locale> supportedLocales)?
                        localeListResolutionCallback,
                    Locale? Function(
                            Locale? locale, Iterable<Locale> supportedLocales)?
                        localeResolutionCallback,
                    Iterable<Locale> supportedLocales = const <Locale>[
                      Locale('en', 'US')
                    ],
                    bool debugShowMaterialGrid = false,
                    bool showPerformanceOverlay = false,
                    bool checkerboardRasterCacheImages = false,
                    bool checkerboardOffscreenLayers = false,
                    bool showSemanticsDebugger = false,
                    bool debugShowCheckedModeBanner = true,
                    Map<LogicalKeySet, Intent>? shortcuts,
                    ScrollBehavior? scrollBehavior,
                    CustomTransition? customTransition,
                    Map<String, Map<String, String>>? translationsKeys,
                    Translations? translations,
                    void Function()? onInit,
                    void Function()? onReady,
                    void Function()? onDispose,
                    void Function(Routing?)? routingCallback,
                    Transition? defaultTransition,
                    List<GetPage<dynamic>>? getPages,
                    bool? opaqueRoute,
                    bool? enableLog = kDebugMode,
                    void Function(String text, {bool isError})?
                        logWriterCallback,
                    bool? popGesture,
                    Duration? transitionDuration,
                    bool? defaultGlobalState,
                    SmartManagement smartManagement = SmartManagement.full,
                    Bindings? initialBinding,
                    GetPage<dynamic>? unknownRoute,
                    ThemeData? highContrastTheme,
                    ThemeData? highContrastDarkTheme,
                    Map<Type, Action<Intent>>? actions}) =>
                GetMaterialApp(
                    key: key,
                    navigatorKey: navigatorKey,
                    scaffoldMessengerKey: scaffoldMessengerKey,
                    home: home,
                    routes: routes,
                    initialRoute: initialRoute,
                    onGenerateRoute: onGenerateRoute,
                    onGenerateInitialRoutes: onGenerateInitialRoutes,
                    onUnknownRoute: onUnknownRoute,
                    useInheritedMediaQuery: useInheritedMediaQuery,
                    navigatorObservers: navigatorObservers,
                    builder: builder,
                    textDirection: textDirection,
                    title: title,
                    onGenerateTitle: onGenerateTitle,
                    color: color,
                    theme: theme,
                    darkTheme: darkTheme,
                    themeMode: themeMode,
                    locale: locale,
                    fallbackLocale: fallbackLocale,
                    localizationsDelegates: localizationsDelegates,
                    localeListResolutionCallback: localeListResolutionCallback,
                    localeResolutionCallback: localeResolutionCallback,
                    supportedLocales: supportedLocales,
                    debugShowMaterialGrid: debugShowMaterialGrid,
                    showPerformanceOverlay: showPerformanceOverlay,
                    checkerboardRasterCacheImages:
                        checkerboardRasterCacheImages,
                    checkerboardOffscreenLayers: checkerboardOffscreenLayers,
                    showSemanticsDebugger: showSemanticsDebugger,
                    debugShowCheckedModeBanner: debugShowCheckedModeBanner,
                    shortcuts: shortcuts,
                    scrollBehavior: scrollBehavior,
                    customTransition: customTransition,
                    translationsKeys: translationsKeys,
                    translations: translations,
                    onInit: onInit,
                    onReady: onReady,
                    onDispose: onDispose,
                    routingCallback: routingCallback,
                    defaultTransition: defaultTransition,
                    getPages: getPages,
                    opaqueRoute: opaqueRoute,
                    enableLog: enableLog,
                    logWriterCallback: logWriterCallback,
                    popGesture: popGesture,
                    transitionDuration: transitionDuration,
                    defaultGlobalState: defaultGlobalState,
                    smartManagement: smartManagement,
                    initialBinding: initialBinding,
                    unknownRoute: unknownRoute,
                    highContrastTheme: highContrastTheme,
                    highContrastDarkTheme: highContrastDarkTheme,
                    actions: actions),
            null,
            null,
            const <String, __PR>{
              'key': __PR(__TR<Key>(Key), 'key', true, false, 'Key?'),
              'navigatorKey': __PR(
                  __TR<GlobalKey<NavigatorState>>(
                      GlobalKey, <__TR>[__TR<NavigatorState>(NavigatorState)]),
                  'navigatorKey',
                  true,
                  false,
                  'GlobalKey<NavigatorState>?'),
              'scaffoldMessengerKey': __PR(
                  __TR<GlobalKey<ScaffoldMessengerState>>(GlobalKey, <__TR>[
                    __TR<ScaffoldMessengerState>(ScaffoldMessengerState)
                  ]),
                  'scaffoldMessengerKey',
                  true,
                  false,
                  'GlobalKey<ScaffoldMessengerState>?'),
              'home':
                  __PR(__TR<Widget>(Widget), 'home', true, false, 'Widget?'),
              'routes': __PR(
                  __TR<Map<String, Function>>(
                      Map, <__TR>[__TR.tString, __TR.tFunction]),
                  'routes',
                  false,
                  false,
                  'Map<String, Widget Function(BuildContext)>',
                  const <String, WidgetBuilder>{}),
              'initialRoute':
                  __PR(__TR.tString, 'initialRoute', true, false, 'String?'),
              'onGenerateRoute': __PR(
                  __TR<RouteFactory>(RouteFactory),
                  'onGenerateRoute',
                  true,
                  false,
                  'Route<dynamic>? Function(RouteSettings settings)?'),
              'onGenerateInitialRoutes': __PR(
                  __TR<InitialRouteListFactory>(InitialRouteListFactory),
                  'onGenerateInitialRoutes',
                  true,
                  false,
                  'List<Route<dynamic>> Function(String initialRoute)?'),
              'onUnknownRoute': __PR(
                  __TR<RouteFactory>(RouteFactory),
                  'onUnknownRoute',
                  true,
                  false,
                  'Route<dynamic>? Function(RouteSettings settings)?'),
              'useInheritedMediaQuery': __PR(__TR.tBool,
                  'useInheritedMediaQuery', false, false, 'bool', false),
              'navigatorObservers': __PR(
                  __TR<List<NavigatorObserver>>(
                      List, <__TR>[__TR<NavigatorObserver>(NavigatorObserver)]),
                  'navigatorObservers',
                  false,
                  false,
                  'List<NavigatorObserver>',
                  const <NavigatorObserver>[]),
              'builder': __PR(
                  __TR<TransitionBuilder>(TransitionBuilder),
                  'builder',
                  true,
                  false,
                  'Widget Function(BuildContext context, Widget? child)?'),
              'textDirection': __PR(__TR<TextDirection>(TextDirection),
                  'textDirection', true, false, 'TextDirection?'),
              'title': __PR(__TR.tString, 'title', false, false, 'String', ''),
              'onGenerateTitle': __PR(
                  __TR<GenerateAppTitle>(GenerateAppTitle),
                  'onGenerateTitle',
                  true,
                  false,
                  'String Function(BuildContext context)?'),
              'color': __PR(__TR<Color>(Color), 'color', true, false, 'Color?'),
              'theme': __PR(__TR<ThemeData>(ThemeData), 'theme', true, false,
                  'ThemeData?'),
              'darkTheme': __PR(__TR<ThemeData>(ThemeData), 'darkTheme', true,
                  false, 'ThemeData?'),
              'themeMode': __PR(__TR<ThemeMode>(ThemeMode), 'themeMode', false,
                  false, 'ThemeMode', ThemeMode.system),
              'locale':
                  __PR(__TR<Locale>(Locale), 'locale', true, false, 'Locale?'),
              'fallbackLocale': __PR(__TR<Locale>(Locale), 'fallbackLocale',
                  true, false, 'Locale?'),
              'localizationsDelegates': __PR(
                  __TR<Iterable<LocalizationsDelegate<dynamic>>>(
                      Iterable, <__TR>[
                    __TR<LocalizationsDelegate<dynamic>>(
                        LocalizationsDelegate, <__TR>[__TR.tDynamic])
                  ]),
                  'localizationsDelegates',
                  true,
                  false,
                  'Iterable<LocalizationsDelegate<dynamic>>?'),
              'localeListResolutionCallback': __PR(
                  __TR<LocaleListResolutionCallback>(
                      LocaleListResolutionCallback),
                  'localeListResolutionCallback',
                  true,
                  false,
                  'Locale? Function(List<Locale>? locales, Iterable<Locale> supportedLocales)?'),
              'localeResolutionCallback': __PR(
                  __TR<LocaleResolutionCallback>(LocaleResolutionCallback),
                  'localeResolutionCallback',
                  true,
                  false,
                  'Locale? Function(Locale? locale, Iterable<Locale> supportedLocales)?'),
              'supportedLocales': __PR(
                  __TR<Iterable<Locale>>(
                      Iterable, <__TR>[__TR<Locale>(Locale)]),
                  'supportedLocales',
                  false,
                  false,
                  'Iterable<Locale>',
                  const <Locale>[Locale('en', 'US')]),
              'debugShowMaterialGrid': __PR(__TR.tBool, 'debugShowMaterialGrid',
                  false, false, 'bool', false),
              'showPerformanceOverlay': __PR(__TR.tBool,
                  'showPerformanceOverlay', false, false, 'bool', false),
              'checkerboardRasterCacheImages': __PR(__TR.tBool,
                  'checkerboardRasterCacheImages', false, false, 'bool', false),
              'checkerboardOffscreenLayers': __PR(__TR.tBool,
                  'checkerboardOffscreenLayers', false, false, 'bool', false),
              'showSemanticsDebugger': __PR(__TR.tBool, 'showSemanticsDebugger',
                  false, false, 'bool', false),
              'debugShowCheckedModeBanner': __PR(__TR.tBool,
                  'debugShowCheckedModeBanner', false, false, 'bool', true),
              'shortcuts': __PR(
                  __TR<Map<LogicalKeySet, Intent>>(Map, <__TR>[
                    __TR<LogicalKeySet>(LogicalKeySet),
                    __TR<Intent>(Intent)
                  ]),
                  'shortcuts',
                  true,
                  false,
                  'Map<LogicalKeySet, Intent>?'),
              'scrollBehavior': __PR(__TR<ScrollBehavior>(ScrollBehavior),
                  'scrollBehavior', true, false, 'ScrollBehavior?'),
              'customTransition': __PR(__TR<CustomTransition>(CustomTransition),
                  'customTransition', true, false, 'CustomTransition?'),
              'translationsKeys': __PR(
                  __TR<Map<String, Map<String, String>>>(
                      Map, <__TR>[__TR.tString, __TR.tMapStringString]),
                  'translationsKeys',
                  true,
                  false,
                  'Map<String, Map<String, String>>?'),
              'translations': __PR(__TR<Translations>(Translations),
                  'translations', true, false, 'Translations?'),
              'onInit': __PR(__TR<VoidCallback>(VoidCallback), 'onInit', true,
                  false, 'void Function()?'),
              'onReady': __PR(__TR<VoidCallback>(VoidCallback), 'onReady', true,
                  false, 'void Function()?'),
              'onDispose': __PR(__TR<VoidCallback>(VoidCallback), 'onDispose',
                  true, false, 'void Function()?'),
              'routingCallback': __PR(
                  __TR<ValueChanged<Routing?>>(
                      ValueChanged, <__TR>[__TR<Routing>(Routing)]),
                  'routingCallback',
                  true,
                  false,
                  'void Function(T value)?'),
              'defaultTransition': __PR(__TR<Transition>(Transition),
                  'defaultTransition', true, false, 'Transition?'),
              'getPages': __PR(
                  __TR<List<GetPage<dynamic>>>(List, <__TR>[
                    __TR<GetPage<dynamic>>(GetPage, <__TR>[__TR.tDynamic])
                  ]),
                  'getPages',
                  true,
                  false,
                  'List<GetPage<dynamic>>?'),
              'opaqueRoute':
                  __PR(__TR.tBool, 'opaqueRoute', true, false, 'bool?'),
              'enableLog': __PR(
                  __TR.tBool, 'enableLog', true, false, 'bool?', kDebugMode),
              'logWriterCallback': __PR(
                  __TR<LogWriterCallback>(LogWriterCallback),
                  'logWriterCallback',
                  true,
                  false,
                  'void Function(String text, {bool isError})?'),
              'popGesture':
                  __PR(__TR.tBool, 'popGesture', true, false, 'bool?'),
              'transitionDuration': __PR(__TR<Duration>(Duration),
                  'transitionDuration', true, false, 'Duration?'),
              'defaultGlobalState':
                  __PR(__TR.tBool, 'defaultGlobalState', true, false, 'bool?'),
              'smartManagement': __PR(
                  __TR<SmartManagement>(SmartManagement),
                  'smartManagement',
                  false,
                  false,
                  'SmartManagement',
                  SmartManagement.full),
              'initialBinding': __PR(__TR<Bindings>(Bindings), 'initialBinding',
                  true, false, 'Bindings?'),
              'unknownRoute': __PR(
                  __TR<GetPage<dynamic>>(GetPage, <__TR>[__TR.tDynamic]),
                  'unknownRoute',
                  true,
                  false,
                  'GetPage<dynamic>?'),
              'highContrastTheme': __PR(__TR<ThemeData>(ThemeData),
                  'highContrastTheme', true, false, 'ThemeData?'),
              'highContrastDarkTheme': __PR(__TR<ThemeData>(ThemeData),
                  'highContrastDarkTheme', true, false, 'ThemeData?'),
              'actions': __PR(
                  __TR<Map<Type, Action<Intent>>>(Map, <__TR>[
                    __TR<Type>(Type),
                    __TR<Action<Intent>>(Action, <__TR>[__TR<Intent>(Intent)])
                  ]),
                  'actions',
                  true,
                  false,
                  'Map<Type, Action<Intent>>?')
            },
            null);
      case 'router':
        return ConstructorReflection<GetMaterialApp>(
            this,
            GetMaterialApp,
            'router',
            () => (
                    {Key? key,
                    RouteInformationProvider? routeInformationProvider,
                    GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,
                    RouteInformationParser<Object>? routeInformationParser,
                    RouterDelegate<Object>? routerDelegate,
                    BackButtonDispatcher? backButtonDispatcher,
                    Widget Function(BuildContext context, Widget? child)?
                        builder,
                    String title = '',
                    String Function(BuildContext context)? onGenerateTitle,
                    Color? color,
                    ThemeData? theme,
                    ThemeData? darkTheme,
                    bool useInheritedMediaQuery = false,
                    ThemeData? highContrastTheme,
                    ThemeData? highContrastDarkTheme,
                    ThemeMode themeMode = ThemeMode.system,
                    Locale? locale,
                    Iterable<LocalizationsDelegate<dynamic>>?
                        localizationsDelegates,
                    Locale? Function(List<Locale>? locales,
                            Iterable<Locale> supportedLocales)?
                        localeListResolutionCallback,
                    Locale? Function(
                            Locale? locale, Iterable<Locale> supportedLocales)?
                        localeResolutionCallback,
                    Iterable<Locale> supportedLocales = const <Locale>[
                      Locale('en', 'US')
                    ],
                    bool debugShowMaterialGrid = false,
                    bool showPerformanceOverlay = false,
                    bool checkerboardRasterCacheImages = false,
                    bool checkerboardOffscreenLayers = false,
                    bool showSemanticsDebugger = false,
                    bool debugShowCheckedModeBanner = true,
                    Map<LogicalKeySet, Intent>? shortcuts,
                    ScrollBehavior? scrollBehavior,
                    Map<Type, Action<Intent>>? actions,
                    CustomTransition? customTransition,
                    Map<String, Map<String, String>>? translationsKeys,
                    Translations? translations,
                    TextDirection? textDirection,
                    Locale? fallbackLocale,
                    void Function(Routing?)? routingCallback,
                    Transition? defaultTransition,
                    bool? opaqueRoute,
                    void Function()? onInit,
                    void Function()? onReady,
                    void Function()? onDispose,
                    bool? enableLog = kDebugMode,
                    void Function(String text, {bool isError})?
                        logWriterCallback,
                    bool? popGesture,
                    SmartManagement smartManagement = SmartManagement.full,
                    Bindings? initialBinding,
                    Duration? transitionDuration,
                    bool? defaultGlobalState,
                    List<GetPage<dynamic>>? getPages,
                    List<NavigatorObserver>? navigatorObservers,
                    GetPage<dynamic>? unknownRoute}) =>
                GetMaterialApp.router(
                    key: key,
                    routeInformationProvider: routeInformationProvider,
                    scaffoldMessengerKey: scaffoldMessengerKey,
                    routeInformationParser: routeInformationParser,
                    routerDelegate: routerDelegate,
                    backButtonDispatcher: backButtonDispatcher,
                    builder: builder,
                    title: title,
                    onGenerateTitle: onGenerateTitle,
                    color: color,
                    theme: theme,
                    darkTheme: darkTheme,
                    useInheritedMediaQuery: useInheritedMediaQuery,
                    highContrastTheme: highContrastTheme,
                    highContrastDarkTheme: highContrastDarkTheme,
                    themeMode: themeMode,
                    locale: locale,
                    localizationsDelegates: localizationsDelegates,
                    localeListResolutionCallback: localeListResolutionCallback,
                    localeResolutionCallback: localeResolutionCallback,
                    supportedLocales: supportedLocales,
                    debugShowMaterialGrid: debugShowMaterialGrid,
                    showPerformanceOverlay: showPerformanceOverlay,
                    checkerboardRasterCacheImages:
                        checkerboardRasterCacheImages,
                    checkerboardOffscreenLayers: checkerboardOffscreenLayers,
                    showSemanticsDebugger: showSemanticsDebugger,
                    debugShowCheckedModeBanner: debugShowCheckedModeBanner,
                    shortcuts: shortcuts,
                    scrollBehavior: scrollBehavior,
                    actions: actions,
                    customTransition: customTransition,
                    translationsKeys: translationsKeys,
                    translations: translations,
                    textDirection: textDirection,
                    fallbackLocale: fallbackLocale,
                    routingCallback: routingCallback,
                    defaultTransition: defaultTransition,
                    opaqueRoute: opaqueRoute,
                    onInit: onInit,
                    onReady: onReady,
                    onDispose: onDispose,
                    enableLog: enableLog,
                    logWriterCallback: logWriterCallback,
                    popGesture: popGesture,
                    smartManagement: smartManagement,
                    initialBinding: initialBinding,
                    transitionDuration: transitionDuration,
                    defaultGlobalState: defaultGlobalState,
                    getPages: getPages,
                    navigatorObservers: navigatorObservers,
                    unknownRoute: unknownRoute),
            null,
            null,
            const <String, __PR>{
              'key': __PR(__TR<Key>(Key), 'key', true, false, 'Key?'),
              'routeInformationProvider': __PR(
                  __TR<RouteInformationProvider>(RouteInformationProvider),
                  'routeInformationProvider',
                  true,
                  false,
                  'RouteInformationProvider?'),
              'scaffoldMessengerKey': __PR(
                  __TR<GlobalKey<ScaffoldMessengerState>>(GlobalKey, <__TR>[
                    __TR<ScaffoldMessengerState>(ScaffoldMessengerState)
                  ]),
                  'scaffoldMessengerKey',
                  true,
                  false,
                  'GlobalKey<ScaffoldMessengerState>?'),
              'routeInformationParser': __PR(
                  __TR<RouteInformationParser<Object>>(
                      RouteInformationParser, <__TR>[__TR.tObject]),
                  'routeInformationParser',
                  true,
                  false,
                  'RouteInformationParser<Object>?'),
              'routerDelegate': __PR(
                  __TR<RouterDelegate<Object>>(
                      RouterDelegate, <__TR>[__TR.tObject]),
                  'routerDelegate',
                  true,
                  false,
                  'RouterDelegate<Object>?'),
              'backButtonDispatcher': __PR(
                  __TR<BackButtonDispatcher>(BackButtonDispatcher),
                  'backButtonDispatcher',
                  true,
                  false,
                  'BackButtonDispatcher?'),
              'builder': __PR(
                  __TR<TransitionBuilder>(TransitionBuilder),
                  'builder',
                  true,
                  false,
                  'Widget Function(BuildContext context, Widget? child)?'),
              'title': __PR(__TR.tString, 'title', false, false, 'String', ''),
              'onGenerateTitle': __PR(
                  __TR<GenerateAppTitle>(GenerateAppTitle),
                  'onGenerateTitle',
                  true,
                  false,
                  'String Function(BuildContext context)?'),
              'color': __PR(__TR<Color>(Color), 'color', true, false, 'Color?'),
              'theme': __PR(__TR<ThemeData>(ThemeData), 'theme', true, false,
                  'ThemeData?'),
              'darkTheme': __PR(__TR<ThemeData>(ThemeData), 'darkTheme', true,
                  false, 'ThemeData?'),
              'useInheritedMediaQuery': __PR(__TR.tBool,
                  'useInheritedMediaQuery', false, false, 'bool', false),
              'highContrastTheme': __PR(__TR<ThemeData>(ThemeData),
                  'highContrastTheme', true, false, 'ThemeData?'),
              'highContrastDarkTheme': __PR(__TR<ThemeData>(ThemeData),
                  'highContrastDarkTheme', true, false, 'ThemeData?'),
              'themeMode': __PR(__TR<ThemeMode>(ThemeMode), 'themeMode', false,
                  false, 'ThemeMode', ThemeMode.system),
              'locale':
                  __PR(__TR<Locale>(Locale), 'locale', true, false, 'Locale?'),
              'localizationsDelegates': __PR(
                  __TR<Iterable<LocalizationsDelegate<dynamic>>>(
                      Iterable, <__TR>[
                    __TR<LocalizationsDelegate<dynamic>>(
                        LocalizationsDelegate, <__TR>[__TR.tDynamic])
                  ]),
                  'localizationsDelegates',
                  true,
                  false,
                  'Iterable<LocalizationsDelegate<dynamic>>?'),
              'localeListResolutionCallback': __PR(
                  __TR<LocaleListResolutionCallback>(
                      LocaleListResolutionCallback),
                  'localeListResolutionCallback',
                  true,
                  false,
                  'Locale? Function(List<Locale>? locales, Iterable<Locale> supportedLocales)?'),
              'localeResolutionCallback': __PR(
                  __TR<LocaleResolutionCallback>(LocaleResolutionCallback),
                  'localeResolutionCallback',
                  true,
                  false,
                  'Locale? Function(Locale? locale, Iterable<Locale> supportedLocales)?'),
              'supportedLocales': __PR(
                  __TR<Iterable<Locale>>(
                      Iterable, <__TR>[__TR<Locale>(Locale)]),
                  'supportedLocales',
                  false,
                  false,
                  'Iterable<Locale>',
                  const <Locale>[Locale('en', 'US')]),
              'debugShowMaterialGrid': __PR(__TR.tBool, 'debugShowMaterialGrid',
                  false, false, 'bool', false),
              'showPerformanceOverlay': __PR(__TR.tBool,
                  'showPerformanceOverlay', false, false, 'bool', false),
              'checkerboardRasterCacheImages': __PR(__TR.tBool,
                  'checkerboardRasterCacheImages', false, false, 'bool', false),
              'checkerboardOffscreenLayers': __PR(__TR.tBool,
                  'checkerboardOffscreenLayers', false, false, 'bool', false),
              'showSemanticsDebugger': __PR(__TR.tBool, 'showSemanticsDebugger',
                  false, false, 'bool', false),
              'debugShowCheckedModeBanner': __PR(__TR.tBool,
                  'debugShowCheckedModeBanner', false, false, 'bool', true),
              'shortcuts': __PR(
                  __TR<Map<LogicalKeySet, Intent>>(Map, <__TR>[
                    __TR<LogicalKeySet>(LogicalKeySet),
                    __TR<Intent>(Intent)
                  ]),
                  'shortcuts',
                  true,
                  false,
                  'Map<LogicalKeySet, Intent>?'),
              'scrollBehavior': __PR(__TR<ScrollBehavior>(ScrollBehavior),
                  'scrollBehavior', true, false, 'ScrollBehavior?'),
              'actions': __PR(
                  __TR<Map<Type, Action<Intent>>>(Map, <__TR>[
                    __TR<Type>(Type),
                    __TR<Action<Intent>>(Action, <__TR>[__TR<Intent>(Intent)])
                  ]),
                  'actions',
                  true,
                  false,
                  'Map<Type, Action<Intent>>?'),
              'customTransition': __PR(__TR<CustomTransition>(CustomTransition),
                  'customTransition', true, false, 'CustomTransition?'),
              'translationsKeys': __PR(
                  __TR<Map<String, Map<String, String>>>(
                      Map, <__TR>[__TR.tString, __TR.tMapStringString]),
                  'translationsKeys',
                  true,
                  false,
                  'Map<String, Map<String, String>>?'),
              'translations': __PR(__TR<Translations>(Translations),
                  'translations', true, false, 'Translations?'),
              'textDirection': __PR(__TR<TextDirection>(TextDirection),
                  'textDirection', true, false, 'TextDirection?'),
              'fallbackLocale': __PR(__TR<Locale>(Locale), 'fallbackLocale',
                  true, false, 'Locale?'),
              'routingCallback': __PR(
                  __TR<ValueChanged<Routing?>>(
                      ValueChanged, <__TR>[__TR<Routing>(Routing)]),
                  'routingCallback',
                  true,
                  false,
                  'void Function(T value)?'),
              'defaultTransition': __PR(__TR<Transition>(Transition),
                  'defaultTransition', true, false, 'Transition?'),
              'opaqueRoute':
                  __PR(__TR.tBool, 'opaqueRoute', true, false, 'bool?'),
              'onInit': __PR(__TR<VoidCallback>(VoidCallback), 'onInit', true,
                  false, 'void Function()?'),
              'onReady': __PR(__TR<VoidCallback>(VoidCallback), 'onReady', true,
                  false, 'void Function()?'),
              'onDispose': __PR(__TR<VoidCallback>(VoidCallback), 'onDispose',
                  true, false, 'void Function()?'),
              'enableLog': __PR(
                  __TR.tBool, 'enableLog', true, false, 'bool?', kDebugMode),
              'logWriterCallback': __PR(
                  __TR<LogWriterCallback>(LogWriterCallback),
                  'logWriterCallback',
                  true,
                  false,
                  'void Function(String text, {bool isError})?'),
              'popGesture':
                  __PR(__TR.tBool, 'popGesture', true, false, 'bool?'),
              'smartManagement': __PR(
                  __TR<SmartManagement>(SmartManagement),
                  'smartManagement',
                  false,
                  false,
                  'SmartManagement',
                  SmartManagement.full),
              'initialBinding': __PR(__TR<Bindings>(Bindings), 'initialBinding',
                  true, false, 'Bindings?'),
              'transitionDuration': __PR(__TR<Duration>(Duration),
                  'transitionDuration', true, false, 'Duration?'),
              'defaultGlobalState':
                  __PR(__TR.tBool, 'defaultGlobalState', true, false, 'bool?'),
              'getPages': __PR(
                  __TR<List<GetPage<dynamic>>>(List, <__TR>[
                    __TR<GetPage<dynamic>>(GetPage, <__TR>[__TR.tDynamic])
                  ]),
                  'getPages',
                  true,
                  false,
                  'List<GetPage<dynamic>>?'),
              'navigatorObservers': __PR(
                  __TR<List<NavigatorObserver>>(
                      List, <__TR>[__TR<NavigatorObserver>(NavigatorObserver)]),
                  'navigatorObservers',
                  true,
                  false,
                  'List<NavigatorObserver>?'),
              'unknownRoute': __PR(
                  __TR<GetPage<dynamic>>(GetPage, <__TR>[__TR.tDynamic]),
                  'unknownRoute',
                  true,
                  false,
                  'GetPage<dynamic>?')
            },
            null);
      default:
        return null;
    }
  }

  static const List<Object> _classAnnotations = <Object>[];

  @override
  List<Object> get classAnnotations => _classAnnotations;

  static const List<Type> _supperTypes = const <Type>[
    StatelessWidget,
    Widget,
    DiagnosticableTree,
    Diagnosticable
  ];

  @override
  List<Type> get supperTypes => _supperTypes;

  @override
  bool get hasMethodToJson => false;

  @override
  Object? callMethodToJson([GetMaterialApp? obj]) => null;

  static const List<String> _fieldsNames = const <String>[
    'navigatorKey',
    'scaffoldMessengerKey',
    'home',
    'routes',
    'initialRoute',
    'onGenerateRoute',
    'onGenerateInitialRoutes',
    'onUnknownRoute',
    'navigatorObservers',
    'builder',
    'title',
    'onGenerateTitle',
    'theme',
    'darkTheme',
    'themeMode',
    'customTransition',
    'color',
    'translationsKeys',
    'translations',
    'textDirection',
    'locale',
    'fallbackLocale',
    'localizationsDelegates',
    'localeListResolutionCallback',
    'localeResolutionCallback',
    'supportedLocales',
    'showPerformanceOverlay',
    'checkerboardRasterCacheImages',
    'checkerboardOffscreenLayers',
    'showSemanticsDebugger',
    'debugShowCheckedModeBanner',
    'shortcuts',
    'scrollBehavior',
    'highContrastTheme',
    'highContrastDarkTheme',
    'actions',
    'debugShowMaterialGrid',
    'routingCallback',
    'defaultTransition',
    'opaqueRoute',
    'onInit',
    'onReady',
    'onDispose',
    'enableLog',
    'logWriterCallback',
    'popGesture',
    'smartManagement',
    'initialBinding',
    'transitionDuration',
    'defaultGlobalState',
    'getPages',
    'unknownRoute',
    'routeInformationProvider',
    'routeInformationParser',
    'routerDelegate',
    'backButtonDispatcher',
    'useInheritedMediaQuery',
    'key',
    'hashCode'
  ];

  @override
  List<String> get fieldsNames => _fieldsNames;

  static final Map<String, FieldReflection<GetMaterialApp, dynamic>>
      _fieldsNoObject = <String, FieldReflection<GetMaterialApp, dynamic>>{};

  final Map<String, FieldReflection<GetMaterialApp, dynamic>> _fieldsObject =
      <String, FieldReflection<GetMaterialApp, dynamic>>{};

  @override
  FieldReflection<GetMaterialApp, T>? field<T>(String fieldName,
      [GetMaterialApp? obj]) {
    if (obj == null) {
      if (object != null) {
        return _fieldObjectImpl<T>(fieldName);
      } else {
        return _fieldNoObjectImpl<T>(fieldName);
      }
    } else if (identical(obj, object)) {
      return _fieldObjectImpl<T>(fieldName);
    }
    return _fieldNoObjectImpl<T>(fieldName)?.withObject(obj);
  }

  FieldReflection<GetMaterialApp, T>? _fieldNoObjectImpl<T>(String fieldName) {
    final f = _fieldsNoObject[fieldName];
    if (f != null) {
      return f as FieldReflection<GetMaterialApp, T>;
    }
    final f2 = _fieldImpl(fieldName, null);
    if (f2 == null) return null;
    _fieldsNoObject[fieldName] = f2;
    return f2 as FieldReflection<GetMaterialApp, T>;
  }

  FieldReflection<GetMaterialApp, T>? _fieldObjectImpl<T>(String fieldName) {
    final f = _fieldsObject[fieldName];
    if (f != null) {
      return f as FieldReflection<GetMaterialApp, T>;
    }
    var f2 = _fieldNoObjectImpl<T>(fieldName);
    if (f2 == null) return null;
    f2 = f2.withObject(object!);
    _fieldsObject[fieldName] = f2;
    return f2;
  }

  FieldReflection<GetMaterialApp, dynamic>? _fieldImpl(
      String fieldName, GetMaterialApp? obj) {
    obj ??= object;

    var lc = fieldName.trim().toLowerCase();

    switch (lc) {
      case 'navigatorkey':
        return FieldReflection<GetMaterialApp, GlobalKey<NavigatorState>?>(
            this,
            GetMaterialApp,
            __TR<GlobalKey<NavigatorState>>(
                GlobalKey, <__TR>[__TR<NavigatorState>(NavigatorState)]),
            'navigatorKey',
            true,
            (o) => () => o!.navigatorKey,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'scaffoldmessengerkey':
        return FieldReflection<GetMaterialApp,
                GlobalKey<ScaffoldMessengerState>?>(
            this,
            GetMaterialApp,
            __TR<GlobalKey<ScaffoldMessengerState>>(GlobalKey,
                <__TR>[__TR<ScaffoldMessengerState>(ScaffoldMessengerState)]),
            'scaffoldMessengerKey',
            true,
            (o) => () => o!.scaffoldMessengerKey,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'home':
        return FieldReflection<GetMaterialApp, Widget?>(
            this,
            GetMaterialApp,
            __TR<Widget>(Widget),
            'home',
            true,
            (o) => () => o!.home,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'routes':
        return FieldReflection<GetMaterialApp,
                Map<String, Widget Function(BuildContext context)>?>(
            this,
            GetMaterialApp,
            __TR<Map<String, Function>>(
                Map, <__TI>[__TI.tString, __TI.tFunction]),
            'routes',
            true,
            (o) => () => o!.routes,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'initialroute':
        return FieldReflection<GetMaterialApp, String?>(
            this,
            GetMaterialApp,
            __TR.tString,
            'initialRoute',
            true,
            (o) => () => o!.initialRoute,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'ongenerateroute':
        return FieldReflection<GetMaterialApp,
                Route<dynamic>? Function(RouteSettings settings)?>(
            this,
            GetMaterialApp,
            __TR<RouteFactory>(RouteFactory),
            'onGenerateRoute',
            true,
            (o) => () => o!.onGenerateRoute,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'ongenerateinitialroutes':
        return FieldReflection<GetMaterialApp,
                List<Route<dynamic>> Function(String initialRoute)?>(
            this,
            GetMaterialApp,
            __TR<InitialRouteListFactory>(InitialRouteListFactory),
            'onGenerateInitialRoutes',
            true,
            (o) => () => o!.onGenerateInitialRoutes,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'onunknownroute':
        return FieldReflection<GetMaterialApp,
                Route<dynamic>? Function(RouteSettings settings)?>(
            this,
            GetMaterialApp,
            __TR<RouteFactory>(RouteFactory),
            'onUnknownRoute',
            true,
            (o) => () => o!.onUnknownRoute,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'navigatorobservers':
        return FieldReflection<GetMaterialApp, List<NavigatorObserver>?>(
            this,
            GetMaterialApp,
            __TR<List<NavigatorObserver>>(
                List, <__TR>[__TR<NavigatorObserver>(NavigatorObserver)]),
            'navigatorObservers',
            true,
            (o) => () => o!.navigatorObservers,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'builder':
        return FieldReflection<GetMaterialApp,
                Widget Function(BuildContext context, Widget? child)?>(
            this,
            GetMaterialApp,
            __TR<TransitionBuilder>(TransitionBuilder),
            'builder',
            true,
            (o) => () => o!.builder,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'title':
        return FieldReflection<GetMaterialApp, String>(
            this,
            GetMaterialApp,
            __TR.tString,
            'title',
            false,
            (o) => () => o!.title,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'ongeneratetitle':
        return FieldReflection<GetMaterialApp,
                String Function(BuildContext context)?>(
            this,
            GetMaterialApp,
            __TR<GenerateAppTitle>(GenerateAppTitle),
            'onGenerateTitle',
            true,
            (o) => () => o!.onGenerateTitle,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'theme':
        return FieldReflection<GetMaterialApp, ThemeData?>(
            this,
            GetMaterialApp,
            __TR<ThemeData>(ThemeData),
            'theme',
            true,
            (o) => () => o!.theme,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'darktheme':
        return FieldReflection<GetMaterialApp, ThemeData?>(
            this,
            GetMaterialApp,
            __TR<ThemeData>(ThemeData),
            'darkTheme',
            true,
            (o) => () => o!.darkTheme,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'thememode':
        return FieldReflection<GetMaterialApp, ThemeMode>(
            this,
            GetMaterialApp,
            __TR<ThemeMode>(ThemeMode),
            'themeMode',
            false,
            (o) => () => o!.themeMode,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'customtransition':
        return FieldReflection<GetMaterialApp, CustomTransition?>(
            this,
            GetMaterialApp,
            __TR<CustomTransition>(CustomTransition),
            'customTransition',
            true,
            (o) => () => o!.customTransition,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'color':
        return FieldReflection<GetMaterialApp, Color?>(
            this,
            GetMaterialApp,
            __TR<Color>(Color),
            'color',
            true,
            (o) => () => o!.color,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'translationskeys':
        return FieldReflection<GetMaterialApp,
                Map<String, Map<String, String>>?>(
            this,
            GetMaterialApp,
            __TR<Map<String, Map<String, String>>>(
                Map, <__TR>[__TR.tString, __TR.tMapStringString]),
            'translationsKeys',
            true,
            (o) => () => o!.translationsKeys,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'translations':
        return FieldReflection<GetMaterialApp, Translations?>(
            this,
            GetMaterialApp,
            __TR<Translations>(Translations),
            'translations',
            true,
            (o) => () => o!.translations,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'textdirection':
        return FieldReflection<GetMaterialApp, TextDirection?>(
            this,
            GetMaterialApp,
            __TR<TextDirection>(TextDirection),
            'textDirection',
            true,
            (o) => () => o!.textDirection,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'locale':
        return FieldReflection<GetMaterialApp, Locale?>(
            this,
            GetMaterialApp,
            __TR<Locale>(Locale),
            'locale',
            true,
            (o) => () => o!.locale,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'fallbacklocale':
        return FieldReflection<GetMaterialApp, Locale?>(
            this,
            GetMaterialApp,
            __TR<Locale>(Locale),
            'fallbackLocale',
            true,
            (o) => () => o!.fallbackLocale,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'localizationsdelegates':
        return FieldReflection<GetMaterialApp,
                Iterable<LocalizationsDelegate<dynamic>>?>(
            this,
            GetMaterialApp,
            __TR<Iterable<LocalizationsDelegate<dynamic>>>(Iterable, <__TR>[
              __TR<LocalizationsDelegate<dynamic>>(
                  LocalizationsDelegate, <__TR>[__TR.tDynamic])
            ]),
            'localizationsDelegates',
            true,
            (o) => () => o!.localizationsDelegates,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'localelistresolutioncallback':
        return FieldReflection<
                GetMaterialApp,
                Locale? Function(
                    List<Locale>? locales, Iterable<Locale> supportedLocales)?>(
            this,
            GetMaterialApp,
            __TR<LocaleListResolutionCallback>(LocaleListResolutionCallback),
            'localeListResolutionCallback',
            true,
            (o) => () => o!.localeListResolutionCallback,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'localeresolutioncallback':
        return FieldReflection<
                GetMaterialApp,
                Locale? Function(
                    Locale? locale, Iterable<Locale> supportedLocales)?>(
            this,
            GetMaterialApp,
            __TR<LocaleResolutionCallback>(LocaleResolutionCallback),
            'localeResolutionCallback',
            true,
            (o) => () => o!.localeResolutionCallback,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'supportedlocales':
        return FieldReflection<GetMaterialApp, Iterable<Locale>>(
            this,
            GetMaterialApp,
            __TR<Iterable<Locale>>(Iterable, <__TR>[__TR<Locale>(Locale)]),
            'supportedLocales',
            false,
            (o) => () => o!.supportedLocales,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'showperformanceoverlay':
        return FieldReflection<GetMaterialApp, bool>(
            this,
            GetMaterialApp,
            __TR.tBool,
            'showPerformanceOverlay',
            false,
            (o) => () => o!.showPerformanceOverlay,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'checkerboardrastercacheimages':
        return FieldReflection<GetMaterialApp, bool>(
            this,
            GetMaterialApp,
            __TR.tBool,
            'checkerboardRasterCacheImages',
            false,
            (o) => () => o!.checkerboardRasterCacheImages,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'checkerboardoffscreenlayers':
        return FieldReflection<GetMaterialApp, bool>(
            this,
            GetMaterialApp,
            __TR.tBool,
            'checkerboardOffscreenLayers',
            false,
            (o) => () => o!.checkerboardOffscreenLayers,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'showsemanticsdebugger':
        return FieldReflection<GetMaterialApp, bool>(
            this,
            GetMaterialApp,
            __TR.tBool,
            'showSemanticsDebugger',
            false,
            (o) => () => o!.showSemanticsDebugger,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'debugshowcheckedmodebanner':
        return FieldReflection<GetMaterialApp, bool>(
            this,
            GetMaterialApp,
            __TR.tBool,
            'debugShowCheckedModeBanner',
            false,
            (o) => () => o!.debugShowCheckedModeBanner,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'shortcuts':
        return FieldReflection<GetMaterialApp, Map<LogicalKeySet, Intent>?>(
            this,
            GetMaterialApp,
            __TR<Map<LogicalKeySet, Intent>>(Map, <__TR>[
              __TR<LogicalKeySet>(LogicalKeySet),
              __TR<Intent>(Intent)
            ]),
            'shortcuts',
            true,
            (o) => () => o!.shortcuts,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'scrollbehavior':
        return FieldReflection<GetMaterialApp, ScrollBehavior?>(
            this,
            GetMaterialApp,
            __TR<ScrollBehavior>(ScrollBehavior),
            'scrollBehavior',
            true,
            (o) => () => o!.scrollBehavior,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'highcontrasttheme':
        return FieldReflection<GetMaterialApp, ThemeData?>(
            this,
            GetMaterialApp,
            __TR<ThemeData>(ThemeData),
            'highContrastTheme',
            true,
            (o) => () => o!.highContrastTheme,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'highcontrastdarktheme':
        return FieldReflection<GetMaterialApp, ThemeData?>(
            this,
            GetMaterialApp,
            __TR<ThemeData>(ThemeData),
            'highContrastDarkTheme',
            true,
            (o) => () => o!.highContrastDarkTheme,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'actions':
        return FieldReflection<GetMaterialApp, Map<Type, Action<Intent>>?>(
            this,
            GetMaterialApp,
            __TR<Map<Type, Action<Intent>>>(Map, <__TR>[
              __TR<Type>(Type),
              __TR<Action<Intent>>(Action, <__TR>[__TR<Intent>(Intent)])
            ]),
            'actions',
            true,
            (o) => () => o!.actions,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'debugshowmaterialgrid':
        return FieldReflection<GetMaterialApp, bool>(
            this,
            GetMaterialApp,
            __TR.tBool,
            'debugShowMaterialGrid',
            false,
            (o) => () => o!.debugShowMaterialGrid,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'routingcallback':
        return FieldReflection<GetMaterialApp, void Function(Routing?)?>(
            this,
            GetMaterialApp,
            __TR<ValueChanged<Routing?>>(
                ValueChanged, <__TR>[__TR<Routing>(Routing)]),
            'routingCallback',
            true,
            (o) => () => o!.routingCallback,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'defaulttransition':
        return FieldReflection<GetMaterialApp, Transition?>(
            this,
            GetMaterialApp,
            __TR<Transition>(Transition),
            'defaultTransition',
            true,
            (o) => () => o!.defaultTransition,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'opaqueroute':
        return FieldReflection<GetMaterialApp, bool?>(
            this,
            GetMaterialApp,
            __TR.tBool,
            'opaqueRoute',
            true,
            (o) => () => o!.opaqueRoute,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'oninit':
        return FieldReflection<GetMaterialApp, void Function()?>(
            this,
            GetMaterialApp,
            __TR<VoidCallback>(VoidCallback),
            'onInit',
            true,
            (o) => () => o!.onInit,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'onready':
        return FieldReflection<GetMaterialApp, void Function()?>(
            this,
            GetMaterialApp,
            __TR<VoidCallback>(VoidCallback),
            'onReady',
            true,
            (o) => () => o!.onReady,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'ondispose':
        return FieldReflection<GetMaterialApp, void Function()?>(
            this,
            GetMaterialApp,
            __TR<VoidCallback>(VoidCallback),
            'onDispose',
            true,
            (o) => () => o!.onDispose,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'enablelog':
        return FieldReflection<GetMaterialApp, bool?>(
            this,
            GetMaterialApp,
            __TR.tBool,
            'enableLog',
            true,
            (o) => () => o!.enableLog,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'logwritercallback':
        return FieldReflection<GetMaterialApp,
                void Function(String text, {bool isError})?>(
            this,
            GetMaterialApp,
            __TR<LogWriterCallback>(LogWriterCallback),
            'logWriterCallback',
            true,
            (o) => () => o!.logWriterCallback,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'popgesture':
        return FieldReflection<GetMaterialApp, bool?>(
            this,
            GetMaterialApp,
            __TR.tBool,
            'popGesture',
            true,
            (o) => () => o!.popGesture,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'smartmanagement':
        return FieldReflection<GetMaterialApp, SmartManagement>(
            this,
            GetMaterialApp,
            __TR<SmartManagement>(SmartManagement),
            'smartManagement',
            false,
            (o) => () => o!.smartManagement,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'initialbinding':
        return FieldReflection<GetMaterialApp, Bindings?>(
            this,
            GetMaterialApp,
            __TR<Bindings>(Bindings),
            'initialBinding',
            true,
            (o) => () => o!.initialBinding,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'transitionduration':
        return FieldReflection<GetMaterialApp, Duration?>(
            this,
            GetMaterialApp,
            __TR<Duration>(Duration),
            'transitionDuration',
            true,
            (o) => () => o!.transitionDuration,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'defaultglobalstate':
        return FieldReflection<GetMaterialApp, bool?>(
            this,
            GetMaterialApp,
            __TR.tBool,
            'defaultGlobalState',
            true,
            (o) => () => o!.defaultGlobalState,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'getpages':
        return FieldReflection<GetMaterialApp, List<GetPage<dynamic>>?>(
            this,
            GetMaterialApp,
            __TR<List<GetPage<dynamic>>>(List, <__TR>[
              __TR<GetPage<dynamic>>(GetPage, <__TR>[__TR.tDynamic])
            ]),
            'getPages',
            true,
            (o) => () => o!.getPages,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'unknownroute':
        return FieldReflection<GetMaterialApp, GetPage<dynamic>?>(
            this,
            GetMaterialApp,
            __TR<GetPage<dynamic>>(GetPage, <__TR>[__TR.tDynamic]),
            'unknownRoute',
            true,
            (o) => () => o!.unknownRoute,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'routeinformationprovider':
        return FieldReflection<GetMaterialApp, RouteInformationProvider?>(
            this,
            GetMaterialApp,
            __TR<RouteInformationProvider>(RouteInformationProvider),
            'routeInformationProvider',
            true,
            (o) => () => o!.routeInformationProvider,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'routeinformationparser':
        return FieldReflection<GetMaterialApp, RouteInformationParser<Object>?>(
            this,
            GetMaterialApp,
            __TR<RouteInformationParser<Object>>(
                RouteInformationParser, <__TR>[__TR.tObject]),
            'routeInformationParser',
            true,
            (o) => () => o!.routeInformationParser,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'routerdelegate':
        return FieldReflection<GetMaterialApp, RouterDelegate<Object>?>(
            this,
            GetMaterialApp,
            __TR<RouterDelegate<Object>>(RouterDelegate, <__TR>[__TR.tObject]),
            'routerDelegate',
            true,
            (o) => () => o!.routerDelegate,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'backbuttondispatcher':
        return FieldReflection<GetMaterialApp, BackButtonDispatcher?>(
            this,
            GetMaterialApp,
            __TR<BackButtonDispatcher>(BackButtonDispatcher),
            'backButtonDispatcher',
            true,
            (o) => () => o!.backButtonDispatcher,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'useinheritedmediaquery':
        return FieldReflection<GetMaterialApp, bool>(
            this,
            GetMaterialApp,
            __TR.tBool,
            'useInheritedMediaQuery',
            false,
            (o) => () => o!.useInheritedMediaQuery,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'key':
        return FieldReflection<GetMaterialApp, Key?>(
            this,
            Widget,
            __TR<Key>(Key),
            'key',
            true,
            (o) => () => o!.key,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// Controls how one widget replaces another widget in the tree.
///
/// If the [runtimeType] and [key] properties of the two widgets are
/// [operator==], respectively, then the new widget replaces the old widget by
/// updating the underlying element (i.e., by calling [Element.update] with the
/// new widget). Otherwise, the old element is removed from the tree, the new
/// widget is inflated into an element, and the new element is inserted into the
/// tree.
///
/// In addition, using a [GlobalKey] as the widget's [key] allows the element
/// to be moved around the tree (changing parent) without losing state. When a
/// new widget is found (its key and type do not match a previous widget in
/// the same location), but there was a widget with that same global key
/// elsewhere in the tree in the previous frame, then that widget's element is
/// moved to the new location.
///
/// Generally, a widget that is the only child of another widget does not need
/// an explicit key.
///
/// See also:
///
///  * The discussions at [Key] and [GlobalKey].''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'hashcode':
        return FieldReflection<GetMaterialApp, int>(
            this,
            Widget,
            __TR.tInt,
            'hashCode',
            false,
            (o) => () => o!.hashCode,
            null,
            obj,
            false,
            false,
            const [override, nonVirtual],
            documentCommentOfEn: '''null''',
            documentCommentOfCn: null,
            isGenerated: null);
      default:
        return null;
    }
  }

  static const List<String> _staticFieldsNames = const <String>[];

  @override
  List<String> get staticFieldsNames => _staticFieldsNames;

  @override
  FieldReflection<GetMaterialApp, T>? staticField<T>(String fieldName) => null;

  static const List<String> _methodsNames = const <String>[
    'build',
    'defaultBuilder',
    'generator',
    'initialRoutesGenerate',
    'createElement',
    'toStringShort',
    'debugFillProperties',
    'toStringShallow',
    'toStringDeep',
    'toDiagnosticsNode',
    'debugDescribeChildren',
    'toString'
  ];

  @override
  List<String> get methodsNames => _methodsNames;

  static final Map<String, MethodReflection<GetMaterialApp, dynamic>>
      _methodsNoObject = <String, MethodReflection<GetMaterialApp, dynamic>>{};

  final Map<String, MethodReflection<GetMaterialApp, dynamic>> _methodsObject =
      <String, MethodReflection<GetMaterialApp, dynamic>>{};

  @override
  MethodReflection<GetMaterialApp, R>? method<R>(String methodName,
      [GetMaterialApp? obj]) {
    if (obj == null) {
      if (object != null) {
        return _methodObjectImpl<R>(methodName);
      } else {
        return _methodNoObjectImpl<R>(methodName);
      }
    } else if (identical(obj, object)) {
      return _methodObjectImpl<R>(methodName);
    }
    return _methodNoObjectImpl<R>(methodName)?.withObject(obj);
  }

  MethodReflection<GetMaterialApp, R>? _methodNoObjectImpl<R>(
      String methodName) {
    final m = _methodsNoObject[methodName];
    if (m != null) {
      return m as MethodReflection<GetMaterialApp, R>;
    }
    final m2 = _methodImpl(methodName, null);
    if (m2 == null) return null;
    _methodsNoObject[methodName] = m2;
    return m2 as MethodReflection<GetMaterialApp, R>;
  }

  MethodReflection<GetMaterialApp, R>? _methodObjectImpl<R>(String methodName) {
    final m = _methodsObject[methodName];
    if (m != null) {
      return m as MethodReflection<GetMaterialApp, R>;
    }
    var m2 = _methodNoObjectImpl<R>(methodName);
    if (m2 == null) return null;
    m2 = m2.withObject(object!);
    _methodsObject[methodName] = m2;
    return m2;
  }

  MethodReflection<GetMaterialApp, dynamic>? _methodImpl(
      String methodName, GetMaterialApp? obj) {
    obj ??= object;

    var lc = methodName.trim().toLowerCase();

    switch (lc) {
      case 'build':
        return MethodReflection<GetMaterialApp, Widget>(
            this,
            GetMaterialApp,
            'build',
            __TR<Widget>(Widget),
            false,
            (o) => o!.build,
            obj,
            false,
            const <__PR>[
              __PR(__TR<BuildContext>(BuildContext), 'context', false, true, '')
            ],
            null,
            null,
            const [override]);
      case 'defaultbuilder':
        return MethodReflection<GetMaterialApp, Widget>(
            this,
            GetMaterialApp,
            'defaultBuilder',
            __TR<Widget>(Widget),
            false,
            (o) => o!.defaultBuilder,
            obj,
            false,
            const <__PR>[
              __PR(
                  __TR<BuildContext>(BuildContext), 'context', false, true, ''),
              __PR(__TR<Widget>(Widget), 'child', true, true, '')
            ],
            null,
            null,
            null);
      case 'generator':
        return MethodReflection<GetMaterialApp, Route<dynamic>>(
            this,
            GetMaterialApp,
            'generator',
            __TR<Route<dynamic>>(Route, <__TR>[__TR.tDynamic]),
            false,
            (o) => o!.generator,
            obj,
            false,
            const <__PR>[
              __PR(__TR<RouteSettings>(RouteSettings), 'settings', false, true,
                  '')
            ],
            null,
            null,
            null);
      case 'initialroutesgenerate':
        return MethodReflection<GetMaterialApp, List<Route<dynamic>>>(
            this,
            GetMaterialApp,
            'initialRoutesGenerate',
            __TR<List<Route<dynamic>>>(List, <__TR>[
              __TR<Route<dynamic>>(Route, <__TR>[__TR.tDynamic])
            ]),
            false,
            (o) => o!.initialRoutesGenerate,
            obj,
            false,
            const <__PR>[__PR(__TR.tString, 'name', false, true, '')],
            null,
            null,
            null);
      case 'createelement':
        return MethodReflection<GetMaterialApp, StatelessElement>(
            this,
            StatelessWidget,
            'createElement',
            __TR<StatelessElement>(StatelessElement),
            false,
            (o) => o!.createElement,
            obj,
            false,
            null,
            null,
            null,
            const [override]);
      case 'tostringshort':
        return MethodReflection<GetMaterialApp, String>(
            this,
            Widget,
            'toStringShort',
            __TR.tString,
            false,
            (o) => o!.toStringShort,
            obj,
            false,
            null,
            null,
            null,
            const [override]);
      case 'debugfillproperties':
        return MethodReflection<GetMaterialApp, void>(
            this,
            Widget,
            'debugFillProperties',
            __TR.tVoid,
            false,
            (o) => o!.debugFillProperties,
            obj,
            false,
            const <__PR>[
              __PR(
                  __TR<DiagnosticPropertiesBuilder>(
                      DiagnosticPropertiesBuilder),
                  'properties',
                  false,
                  true,
                  '')
            ],
            null,
            null,
            const [override]);
      case 'tostringshallow':
        return MethodReflection<GetMaterialApp, String>(
            this,
            DiagnosticableTree,
            'toStringShallow',
            __TR.tString,
            false,
            (o) => o!.toStringShallow,
            obj,
            false,
            null,
            null,
            const <String, __PR>{
              'joiner':
                  __PR(__TR.tString, 'joiner', false, false, 'String', ', '),
              'minLevel': __PR(
                  __TR<DiagnosticLevel>(DiagnosticLevel),
                  'minLevel',
                  false,
                  false,
                  'DiagnosticLevel',
                  DiagnosticLevel.debug)
            },
            null);
      case 'tostringdeep':
        return MethodReflection<GetMaterialApp, String>(
            this,
            DiagnosticableTree,
            'toStringDeep',
            __TR.tString,
            false,
            (o) => o!.toStringDeep,
            obj,
            false,
            null,
            null,
            const <String, __PR>{
              'minLevel': __PR(
                  __TR<DiagnosticLevel>(DiagnosticLevel),
                  'minLevel',
                  false,
                  false,
                  'DiagnosticLevel',
                  DiagnosticLevel.debug),
              'prefixLineOne': __PR(
                  __TR.tString, 'prefixLineOne', false, false, 'String', ''),
              'prefixOtherLines':
                  __PR(__TR.tString, 'prefixOtherLines', true, false, 'String?')
            },
            null);
      case 'todiagnosticsnode':
        return MethodReflection<GetMaterialApp, DiagnosticsNode>(
            this,
            DiagnosticableTree,
            'toDiagnosticsNode',
            __TR<DiagnosticsNode>(DiagnosticsNode),
            false,
            (o) => o!.toDiagnosticsNode,
            obj,
            false,
            null,
            null, const <String, __PR>{
          'name': __PR(__TR.tString, 'name', true, false, 'String?'),
          'style': __PR(__TR<DiagnosticsTreeStyle>(DiagnosticsTreeStyle),
              'style', true, false, 'DiagnosticsTreeStyle?')
        }, const [
          override
        ]);
      case 'debugdescribechildren':
        return MethodReflection<GetMaterialApp, List<DiagnosticsNode>>(
            this,
            DiagnosticableTree,
            'debugDescribeChildren',
            __TR<List<DiagnosticsNode>>(
                List, <__TR>[__TR<DiagnosticsNode>(DiagnosticsNode)]),
            false,
            (o) => o!.debugDescribeChildren,
            obj,
            false,
            null,
            null,
            null,
            const [protected]);
      case 'tostring':
        return MethodReflection<GetMaterialApp, String>(
            this,
            Diagnosticable,
            'toString',
            __TR.tString,
            false,
            (o) => o!.toString,
            obj,
            false,
            null,
            null, const <String, __PR>{
          'minLevel': __PR(__TR<DiagnosticLevel>(DiagnosticLevel), 'minLevel',
              false, false, 'DiagnosticLevel', DiagnosticLevel.info)
        }, const [
          override
        ]);
      default:
        return null;
    }
  }

  static const List<String> _staticMethodsNames = const <String>[];

  @override
  List<String> get staticMethodsNames => _staticMethodsNames;

  @override
  MethodReflection<GetMaterialApp, R>? staticMethod<R>(String methodName) =>
      null;
}

extension GetMaterialApp$reflectionExtension on GetMaterialApp {
  /// Returns a [ClassReflection] for type [GetMaterialApp]. (Generated by [ReflectionFactory])
  ClassReflection<GetMaterialApp> get reflection =>
      GetMaterialApp$reflection(this);

  /// Returns a JSON for type [GetMaterialApp]. (Generated by [ReflectionFactory])
  Object? toJson({bool duplicatedEntitiesAsID = false}) =>
      reflection.toJson(null, null, duplicatedEntitiesAsID);

  /// Returns a JSON [Map] for type [GetMaterialApp]. (Generated by [ReflectionFactory])
  Map<String, dynamic>? toJsonMap({bool duplicatedEntitiesAsID = false}) =>
      reflection.toJsonMap(duplicatedEntitiesAsID: duplicatedEntitiesAsID);

  /// Returns an encoded JSON [String] for type [GetMaterialApp]. (Generated by [ReflectionFactory])
  String toJsonEncoded(
          {bool pretty = false, bool duplicatedEntitiesAsID = false}) =>
      reflection.toJsonEncoded(
          pretty: pretty, duplicatedEntitiesAsID: duplicatedEntitiesAsID);

  /// Returns a JSON for type [GetMaterialApp] using the class fields. (Generated by [ReflectionFactory])
  Object? toJsonFromFields({bool duplicatedEntitiesAsID = false}) => reflection
      .toJsonFromFields(duplicatedEntitiesAsID: duplicatedEntitiesAsID);
}

extension ReflectionBridge1$reflectionExtension on ReflectionBridge1 {
  /// Returns a [ClassReflection] for type [T] or [obj]. (Generated by [ReflectionFactory])
  ClassReflection<T> reflection<T>([T? obj]) {
    switch (T) {
      case GetMaterialApp:
        return GetMaterialApp$reflection(obj as GetMaterialApp?)
            as ClassReflection<T>;
      default:
        throw UnsupportedError('<$runtimeType> No reflection for Type: $T');
    }
  }
}

List<Reflection> _listSiblingsReflection() => <Reflection>[
      GetMaterialApp$reflection(),
    ];

List<Reflection>? _siblingsReflectionList;
List<Reflection> _siblingsReflection() => _siblingsReflectionList ??=
    List<Reflection>.unmodifiable(_listSiblingsReflection());

bool _registerSiblingsReflectionCalled = false;
void _registerSiblingsReflection() {
  if (_registerSiblingsReflectionCalled) return;
  _registerSiblingsReflectionCalled = true;
  var length = _listSiblingsReflection().length;
  assert(length > 0);
}
