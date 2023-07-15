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
MaterialApp MaterialApp$fromJson(Map<String, Object?> map) =>
    MaterialApp$reflection.staticInstance.fromJson(map);
// ignore: non_constant_identifier_names
MaterialApp MaterialApp$fromJsonEncoded(String jsonEncoded) =>
    MaterialApp$reflection.staticInstance.fromJsonEncoded(jsonEncoded);

class MaterialApp$reflection extends ClassReflection<MaterialApp>
    with __ReflectionMixin {
  static final Expando<MaterialApp$reflection> _objectReflections = Expando();

  factory MaterialApp$reflection([MaterialApp? object]) {
    if (object == null) return staticInstance;
    return _objectReflections[object] ??= MaterialApp$reflection._(object);
  }

  MaterialApp$reflection._([MaterialApp? object])
      : super(MaterialApp, 'MaterialApp', object);

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
  Version get languageVersion => Version.parse('2.17.0');

  @override
  MaterialApp$reflection withObject([MaterialApp? obj]) =>
      MaterialApp$reflection(obj)..setupInternalsWith(this);

  static MaterialApp$reflection? _withoutObjectInstance;
  @override
  MaterialApp$reflection withoutObjectInstance() => staticInstance;

  static MaterialApp$reflection get staticInstance =>
      _withoutObjectInstance ??= MaterialApp$reflection._();

  @override
  MaterialApp$reflection getStaticInstance() => staticInstance;

  static bool _boot = false;
  static void boot() {
    if (_boot) return;
    _boot = true;
    MaterialApp$reflection.staticInstance;
  }

  @override
  bool get hasDefaultConstructor => true;
  @override
  MaterialApp? createInstanceWithDefaultConstructor() => MaterialApp();

  @override
  bool get hasEmptyConstructor => false;
  @override
  MaterialApp? createInstanceWithEmptyConstructor() => null;
  @override
  bool get hasNoRequiredArgsConstructor => true;
  @override
  MaterialApp? createInstanceWithNoRequiredArgsConstructor() =>
      MaterialApp.router();

  static const List<String> _constructorsNames = const <String>['', 'router'];

  @override
  List<String> get constructorsNames => _constructorsNames;

  static final Map<String, ConstructorReflection<MaterialApp>> _constructors =
      <String, ConstructorReflection<MaterialApp>>{};

  @override
  ConstructorReflection<MaterialApp>? constructor(String constructorName) {
    var c = _constructors[constructorName];
    if (c != null) return c;
    c = _constructorImpl(constructorName);
    if (c == null) return null;
    _constructors[constructorName] = c;
    return c;
  }

  ConstructorReflection<MaterialApp>? _constructorImpl(String constructorName) {
    var lc = constructorName.trim().toLowerCase();

    switch (lc) {
      case '':
        return ConstructorReflection<MaterialApp>(
            this,
            MaterialApp,
            '',
            () => (
                    {Key? key,
                    GlobalKey<NavigatorState>? navigatorKey,
                    GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,
                    Widget? home,
                    Map<String, Widget Function(BuildContext context)> routes =
                        const <String, WidgetBuilder>{},
                    String? initialRoute,
                    Route<dynamic>? Function(RouteSettings settings)?
                        onGenerateRoute,
                    List<Route<dynamic>> Function(String initialRoute)?
                        onGenerateInitialRoutes,
                    Route<dynamic>? Function(RouteSettings settings)?
                        onUnknownRoute,
                    List<NavigatorObserver> navigatorObservers =
                        const <NavigatorObserver>[],
                    Widget Function(BuildContext context, Widget? child)?
                        builder,
                    String title = '',
                    String Function(BuildContext context)? onGenerateTitle,
                    Color? color,
                    ThemeData? theme,
                    ThemeData? darkTheme,
                    ThemeData? highContrastTheme,
                    ThemeData? highContrastDarkTheme,
                    ThemeMode? themeMode = ThemeMode.system,
                    Duration themeAnimationDuration = kThemeAnimationDuration,
                    Curve themeAnimationCurve = Curves.linear,
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
                    Map<ShortcutActivator, Intent>? shortcuts,
                    Map<Type, Action<Intent>>? actions,
                    String? restorationScopeId,
                    ScrollBehavior? scrollBehavior,
                    bool useInheritedMediaQuery = false}) =>
                MaterialApp(
                    key: key,
                    navigatorKey: navigatorKey,
                    scaffoldMessengerKey: scaffoldMessengerKey,
                    home: home,
                    routes: routes,
                    initialRoute: initialRoute,
                    onGenerateRoute: onGenerateRoute,
                    onGenerateInitialRoutes: onGenerateInitialRoutes,
                    onUnknownRoute: onUnknownRoute,
                    navigatorObservers: navigatorObservers,
                    builder: builder,
                    title: title,
                    onGenerateTitle: onGenerateTitle,
                    color: color,
                    theme: theme,
                    darkTheme: darkTheme,
                    highContrastTheme: highContrastTheme,
                    highContrastDarkTheme: highContrastDarkTheme,
                    themeMode: themeMode,
                    themeAnimationDuration: themeAnimationDuration,
                    themeAnimationCurve: themeAnimationCurve,
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
                    actions: actions,
                    restorationScopeId: restorationScopeId,
                    scrollBehavior: scrollBehavior,
                    useInheritedMediaQuery: useInheritedMediaQuery),
            null,
            null,
            const <String, __PR>{
              'actions': __PR(
                  __TR<Map<Type, Action<Intent>>>(Map, <__TR>[
                    __TR<Type>(Type),
                    __TR<Action<Intent>>(Action, <__TR>[__TR<Intent>(Intent)])
                  ]),
                  'actions',
                  true,
                  false),
              'builder': __PR(__TR<TransitionBuilder>(TransitionBuilder),
                  'builder', true, false),
              'checkerboardOffscreenLayers': __PR(__TR.tBool,
                  'checkerboardOffscreenLayers', false, false, false),
              'checkerboardRasterCacheImages': __PR(__TR.tBool,
                  'checkerboardRasterCacheImages', false, false, false),
              'color': __PR(__TR<Color>(Color), 'color', true, false),
              'darkTheme':
                  __PR(__TR<ThemeData>(ThemeData), 'darkTheme', true, false),
              'debugShowCheckedModeBanner': __PR(
                  __TR.tBool, 'debugShowCheckedModeBanner', false, false, true),
              'debugShowMaterialGrid': __PR(
                  __TR.tBool, 'debugShowMaterialGrid', false, false, false),
              'highContrastDarkTheme': __PR(__TR<ThemeData>(ThemeData),
                  'highContrastDarkTheme', true, false),
              'highContrastTheme': __PR(
                  __TR<ThemeData>(ThemeData), 'highContrastTheme', true, false),
              'home': __PR(__TR<Widget>(Widget), 'home', true, false),
              'initialRoute': __PR(__TR.tString, 'initialRoute', true, false),
              'key': __PR(__TR<Key>(Key), 'key', true, false),
              'locale': __PR(__TR<Locale>(Locale), 'locale', true, false),
              'localeListResolutionCallback': __PR(
                  __TR<LocaleListResolutionCallback>(
                      LocaleListResolutionCallback),
                  'localeListResolutionCallback',
                  true,
                  false),
              'localeResolutionCallback': __PR(
                  __TR<LocaleResolutionCallback>(LocaleResolutionCallback),
                  'localeResolutionCallback',
                  true,
                  false),
              'localizationsDelegates': __PR(
                  __TR<Iterable<LocalizationsDelegate<dynamic>>>(
                      Iterable, <__TR>[
                    __TR<LocalizationsDelegate<dynamic>>(
                        LocalizationsDelegate, <__TR>[__TR.tDynamic])
                  ]),
                  'localizationsDelegates',
                  true,
                  false),
              'navigatorKey': __PR(
                  __TR<GlobalKey<NavigatorState>>(
                      GlobalKey, <__TR>[__TR<NavigatorState>(NavigatorState)]),
                  'navigatorKey',
                  true,
                  false),
              'navigatorObservers': __PR(
                  __TR<List<NavigatorObserver>>(
                      List, <__TR>[__TR<NavigatorObserver>(NavigatorObserver)]),
                  'navigatorObservers',
                  false,
                  false,
                  const <NavigatorObserver>[]),
              'onGenerateInitialRoutes': __PR(
                  __TR<InitialRouteListFactory>(InitialRouteListFactory),
                  'onGenerateInitialRoutes',
                  true,
                  false),
              'onGenerateRoute': __PR(__TR<RouteFactory>(RouteFactory),
                  'onGenerateRoute', true, false),
              'onGenerateTitle': __PR(__TR<GenerateAppTitle>(GenerateAppTitle),
                  'onGenerateTitle', true, false),
              'onUnknownRoute': __PR(__TR<RouteFactory>(RouteFactory),
                  'onUnknownRoute', true, false),
              'restorationScopeId':
                  __PR(__TR.tString, 'restorationScopeId', true, false),
              'routes': __PR(
                  __TR<Map<String, Function>>(
                      Map, <__TI>[__TI.tString, __TI.tFunction]),
                  'routes',
                  false,
                  false,
                  const <String, WidgetBuilder>{}),
              'scaffoldMessengerKey': __PR(
                  __TR<GlobalKey<ScaffoldMessengerState>>(GlobalKey, <__TR>[
                    __TR<ScaffoldMessengerState>(ScaffoldMessengerState)
                  ]),
                  'scaffoldMessengerKey',
                  true,
                  false),
              'scrollBehavior': __PR(__TR<ScrollBehavior>(ScrollBehavior),
                  'scrollBehavior', true, false),
              'shortcuts': __PR(
                  __TR<Map<ShortcutActivator, Intent>>(Map, <__TR>[
                    __TR<ShortcutActivator>(ShortcutActivator),
                    __TR<Intent>(Intent)
                  ]),
                  'shortcuts',
                  true,
                  false),
              'showPerformanceOverlay': __PR(
                  __TR.tBool, 'showPerformanceOverlay', false, false, false),
              'showSemanticsDebugger': __PR(
                  __TR.tBool, 'showSemanticsDebugger', false, false, false),
              'supportedLocales': __PR(
                  __TR<Iterable<Locale>>(
                      Iterable, <__TR>[__TR<Locale>(Locale)]),
                  'supportedLocales',
                  false,
                  false,
                  const <Locale>[Locale('en', 'US')]),
              'theme': __PR(__TR<ThemeData>(ThemeData), 'theme', true, false),
              'themeAnimationCurve': __PR(__TR<Curve>(Curve),
                  'themeAnimationCurve', false, false, Curves.linear),
              'themeAnimationDuration': __PR(
                  __TR<Duration>(Duration),
                  'themeAnimationDuration',
                  false,
                  false,
                  kThemeAnimationDuration),
              'themeMode': __PR(__TR<ThemeMode>(ThemeMode), 'themeMode', true,
                  false, ThemeMode.system),
              'title': __PR(__TR.tString, 'title', false, false, ''),
              'useInheritedMediaQuery': __PR(
                  __TR.tBool, 'useInheritedMediaQuery', false, false, false)
            },
            null);
      case 'router':
        return ConstructorReflection<MaterialApp>(
            this,
            MaterialApp,
            'router',
            () => (
                    {Key? key,
                    GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,
                    RouteInformationProvider? routeInformationProvider,
                    RouteInformationParser<Object>? routeInformationParser,
                    RouterDelegate<Object>? routerDelegate,
                    RouterConfig<Object>? routerConfig,
                    BackButtonDispatcher? backButtonDispatcher,
                    Widget Function(BuildContext context, Widget? child)?
                        builder,
                    String title = '',
                    String Function(BuildContext context)? onGenerateTitle,
                    Color? color,
                    ThemeData? theme,
                    ThemeData? darkTheme,
                    ThemeData? highContrastTheme,
                    ThemeData? highContrastDarkTheme,
                    ThemeMode? themeMode = ThemeMode.system,
                    Duration themeAnimationDuration = kThemeAnimationDuration,
                    Curve themeAnimationCurve = Curves.linear,
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
                    Map<ShortcutActivator, Intent>? shortcuts,
                    Map<Type, Action<Intent>>? actions,
                    String? restorationScopeId,
                    ScrollBehavior? scrollBehavior,
                    bool useInheritedMediaQuery = false}) =>
                MaterialApp.router(
                    key: key,
                    scaffoldMessengerKey: scaffoldMessengerKey,
                    routeInformationProvider: routeInformationProvider,
                    routeInformationParser: routeInformationParser,
                    routerDelegate: routerDelegate,
                    routerConfig: routerConfig,
                    backButtonDispatcher: backButtonDispatcher,
                    builder: builder,
                    title: title,
                    onGenerateTitle: onGenerateTitle,
                    color: color,
                    theme: theme,
                    darkTheme: darkTheme,
                    highContrastTheme: highContrastTheme,
                    highContrastDarkTheme: highContrastDarkTheme,
                    themeMode: themeMode,
                    themeAnimationDuration: themeAnimationDuration,
                    themeAnimationCurve: themeAnimationCurve,
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
                    actions: actions,
                    restorationScopeId: restorationScopeId,
                    scrollBehavior: scrollBehavior,
                    useInheritedMediaQuery: useInheritedMediaQuery),
            null,
            null,
            const <String, __PR>{
              'actions': __PR(
                  __TR<Map<Type, Action<Intent>>>(Map, <__TR>[
                    __TR<Type>(Type),
                    __TR<Action<Intent>>(Action, <__TR>[__TR<Intent>(Intent)])
                  ]),
                  'actions',
                  true,
                  false),
              'backButtonDispatcher': __PR(
                  __TR<BackButtonDispatcher>(BackButtonDispatcher),
                  'backButtonDispatcher',
                  true,
                  false),
              'builder': __PR(__TR<TransitionBuilder>(TransitionBuilder),
                  'builder', true, false),
              'checkerboardOffscreenLayers': __PR(__TR.tBool,
                  'checkerboardOffscreenLayers', false, false, false),
              'checkerboardRasterCacheImages': __PR(__TR.tBool,
                  'checkerboardRasterCacheImages', false, false, false),
              'color': __PR(__TR<Color>(Color), 'color', true, false),
              'darkTheme':
                  __PR(__TR<ThemeData>(ThemeData), 'darkTheme', true, false),
              'debugShowCheckedModeBanner': __PR(
                  __TR.tBool, 'debugShowCheckedModeBanner', false, false, true),
              'debugShowMaterialGrid': __PR(
                  __TR.tBool, 'debugShowMaterialGrid', false, false, false),
              'highContrastDarkTheme': __PR(__TR<ThemeData>(ThemeData),
                  'highContrastDarkTheme', true, false),
              'highContrastTheme': __PR(
                  __TR<ThemeData>(ThemeData), 'highContrastTheme', true, false),
              'key': __PR(__TR<Key>(Key), 'key', true, false),
              'locale': __PR(__TR<Locale>(Locale), 'locale', true, false),
              'localeListResolutionCallback': __PR(
                  __TR<LocaleListResolutionCallback>(
                      LocaleListResolutionCallback),
                  'localeListResolutionCallback',
                  true,
                  false),
              'localeResolutionCallback': __PR(
                  __TR<LocaleResolutionCallback>(LocaleResolutionCallback),
                  'localeResolutionCallback',
                  true,
                  false),
              'localizationsDelegates': __PR(
                  __TR<Iterable<LocalizationsDelegate<dynamic>>>(
                      Iterable, <__TR>[
                    __TR<LocalizationsDelegate<dynamic>>(
                        LocalizationsDelegate, <__TR>[__TR.tDynamic])
                  ]),
                  'localizationsDelegates',
                  true,
                  false),
              'onGenerateTitle': __PR(__TR<GenerateAppTitle>(GenerateAppTitle),
                  'onGenerateTitle', true, false),
              'restorationScopeId':
                  __PR(__TR.tString, 'restorationScopeId', true, false),
              'routeInformationParser': __PR(
                  __TR<RouteInformationParser<Object>>(
                      RouteInformationParser, <__TR>[__TR.tObject]),
                  'routeInformationParser',
                  true,
                  false),
              'routeInformationProvider': __PR(
                  __TR<RouteInformationProvider>(RouteInformationProvider),
                  'routeInformationProvider',
                  true,
                  false),
              'routerConfig': __PR(
                  __TR<RouterConfig<Object>>(
                      RouterConfig, <__TR>[__TR.tObject]),
                  'routerConfig',
                  true,
                  false),
              'routerDelegate': __PR(
                  __TR<RouterDelegate<Object>>(
                      RouterDelegate, <__TR>[__TR.tObject]),
                  'routerDelegate',
                  true,
                  false),
              'scaffoldMessengerKey': __PR(
                  __TR<GlobalKey<ScaffoldMessengerState>>(GlobalKey, <__TR>[
                    __TR<ScaffoldMessengerState>(ScaffoldMessengerState)
                  ]),
                  'scaffoldMessengerKey',
                  true,
                  false),
              'scrollBehavior': __PR(__TR<ScrollBehavior>(ScrollBehavior),
                  'scrollBehavior', true, false),
              'shortcuts': __PR(
                  __TR<Map<ShortcutActivator, Intent>>(Map, <__TR>[
                    __TR<ShortcutActivator>(ShortcutActivator),
                    __TR<Intent>(Intent)
                  ]),
                  'shortcuts',
                  true,
                  false),
              'showPerformanceOverlay': __PR(
                  __TR.tBool, 'showPerformanceOverlay', false, false, false),
              'showSemanticsDebugger': __PR(
                  __TR.tBool, 'showSemanticsDebugger', false, false, false),
              'supportedLocales': __PR(
                  __TR<Iterable<Locale>>(
                      Iterable, <__TR>[__TR<Locale>(Locale)]),
                  'supportedLocales',
                  false,
                  false,
                  const <Locale>[Locale('en', 'US')]),
              'theme': __PR(__TR<ThemeData>(ThemeData), 'theme', true, false),
              'themeAnimationCurve': __PR(__TR<Curve>(Curve),
                  'themeAnimationCurve', false, false, Curves.linear),
              'themeAnimationDuration': __PR(
                  __TR<Duration>(Duration),
                  'themeAnimationDuration',
                  false,
                  false,
                  kThemeAnimationDuration),
              'themeMode': __PR(__TR<ThemeMode>(ThemeMode), 'themeMode', true,
                  false, ThemeMode.system),
              'title': __PR(__TR.tString, 'title', false, false, ''),
              'useInheritedMediaQuery': __PR(
                  __TR.tBool, 'useInheritedMediaQuery', false, false, false)
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
    StatefulWidget,
    Widget,
    DiagnosticableTree,
    Diagnosticable
  ];

  @override
  List<Type> get supperTypes => _supperTypes;

  @override
  bool get hasMethodToJson => false;

  @override
  Object? callMethodToJson([MaterialApp? obj]) => null;

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
    'routeInformationProvider',
    'routeInformationParser',
    'routerDelegate',
    'backButtonDispatcher',
    'routerConfig',
    'builder',
    'title',
    'onGenerateTitle',
    'theme',
    'darkTheme',
    'highContrastTheme',
    'highContrastDarkTheme',
    'themeMode',
    'themeAnimationDuration',
    'themeAnimationCurve',
    'color',
    'locale',
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
    'actions',
    'restorationScopeId',
    'scrollBehavior',
    'debugShowMaterialGrid',
    'useInheritedMediaQuery',
    'key',
    'hashCode'
  ];

  @override
  List<String> get fieldsNames => _fieldsNames;

  static final Map<String, FieldReflection<MaterialApp, dynamic>>
      _fieldsNoObject = <String, FieldReflection<MaterialApp, dynamic>>{};

  final Map<String, FieldReflection<MaterialApp, dynamic>> _fieldsObject =
      <String, FieldReflection<MaterialApp, dynamic>>{};

  @override
  FieldReflection<MaterialApp, T>? field<T>(String fieldName,
      [MaterialApp? obj]) {
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

  FieldReflection<MaterialApp, T>? _fieldNoObjectImpl<T>(String fieldName) {
    final f = _fieldsNoObject[fieldName];
    if (f != null) {
      return f as FieldReflection<MaterialApp, T>;
    }
    final f2 = _fieldImpl(fieldName, null);
    if (f2 == null) return null;
    _fieldsNoObject[fieldName] = f2;
    return f2 as FieldReflection<MaterialApp, T>;
  }

  FieldReflection<MaterialApp, T>? _fieldObjectImpl<T>(String fieldName) {
    final f = _fieldsObject[fieldName];
    if (f != null) {
      return f as FieldReflection<MaterialApp, T>;
    }
    var f2 = _fieldNoObjectImpl<T>(fieldName);
    if (f2 == null) return null;
    f2 = f2.withObject(object!);
    _fieldsObject[fieldName] = f2;
    return f2;
  }

  FieldReflection<MaterialApp, dynamic>? _fieldImpl(
      String fieldName, MaterialApp? obj) {
    obj ??= object;

    var lc = fieldName.trim().toLowerCase();

    switch (lc) {
      case 'navigatorkey':
        return FieldReflection<MaterialApp, GlobalKey<NavigatorState>?>(
            this,
            MaterialApp,
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
            documentCommentOfEn:
                '''/// {@macro flutter.widgets.widgetsApp.navigatorKey}''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'scaffoldmessengerkey':
        return FieldReflection<MaterialApp, GlobalKey<ScaffoldMessengerState>?>(
            this,
            MaterialApp,
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
            documentCommentOfEn:
                '''/// A key to use when building the [ScaffoldMessenger].
///
/// If a [scaffoldMessengerKey] is specified, the [ScaffoldMessenger] can be
/// directly manipulated without first obtaining it from a [BuildContext] via
/// [ScaffoldMessenger.of]: from the [scaffoldMessengerKey], use the
/// [GlobalKey.currentState] getter.''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'home':
        return FieldReflection<MaterialApp, Widget?>(
            this,
            MaterialApp,
            __TR<Widget>(Widget),
            'home',
            true,
            (o) => () => o!.home,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// {@macro flutter.widgets.widgetsApp.home}''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'routes':
        return FieldReflection<MaterialApp,
                Map<String, Widget Function(BuildContext context)>?>(
            this,
            MaterialApp,
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
            documentCommentOfEn:
                '''/// The application's top-level routing table.
///
/// When a named route is pushed with [Navigator.pushNamed], the route name is
/// looked up in this map. If the name is present, the associated
/// [widgets.WidgetBuilder] is used to construct a [MaterialPageRoute] that
/// performs an appropriate transition, including [Hero] animations, to the
/// new route.
///
/// {@macro flutter.widgets.widgetsApp.routes}''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'initialroute':
        return FieldReflection<MaterialApp, String?>(
            this,
            MaterialApp,
            __TR.tString,
            'initialRoute',
            true,
            (o) => () => o!.initialRoute,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// {@macro flutter.widgets.widgetsApp.initialRoute}''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'ongenerateroute':
        return FieldReflection<MaterialApp,
                Route<dynamic>? Function(RouteSettings settings)?>(
            this,
            MaterialApp,
            __TR<RouteFactory>(RouteFactory),
            'onGenerateRoute',
            true,
            (o) => () => o!.onGenerateRoute,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// {@macro flutter.widgets.widgetsApp.onGenerateRoute}''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'ongenerateinitialroutes':
        return FieldReflection<MaterialApp,
                List<Route<dynamic>> Function(String initialRoute)?>(
            this,
            MaterialApp,
            __TR<InitialRouteListFactory>(InitialRouteListFactory),
            'onGenerateInitialRoutes',
            true,
            (o) => () => o!.onGenerateInitialRoutes,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// {@macro flutter.widgets.widgetsApp.onGenerateInitialRoutes}''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'onunknownroute':
        return FieldReflection<MaterialApp,
                Route<dynamic>? Function(RouteSettings settings)?>(
            this,
            MaterialApp,
            __TR<RouteFactory>(RouteFactory),
            'onUnknownRoute',
            true,
            (o) => () => o!.onUnknownRoute,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// {@macro flutter.widgets.widgetsApp.onUnknownRoute}''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'navigatorobservers':
        return FieldReflection<MaterialApp, List<NavigatorObserver>?>(
            this,
            MaterialApp,
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
            documentCommentOfEn:
                '''/// {@macro flutter.widgets.widgetsApp.navigatorObservers}''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'routeinformationprovider':
        return FieldReflection<MaterialApp, RouteInformationProvider?>(
            this,
            MaterialApp,
            __TR<RouteInformationProvider>(RouteInformationProvider),
            'routeInformationProvider',
            true,
            (o) => () => o!.routeInformationProvider,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// {@macro flutter.widgets.widgetsApp.routeInformationProvider}''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'routeinformationparser':
        return FieldReflection<MaterialApp, RouteInformationParser<Object>?>(
            this,
            MaterialApp,
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
            documentCommentOfEn:
                '''/// {@macro flutter.widgets.widgetsApp.routeInformationParser}''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'routerdelegate':
        return FieldReflection<MaterialApp, RouterDelegate<Object>?>(
            this,
            MaterialApp,
            __TR<RouterDelegate<Object>>(RouterDelegate, <__TR>[__TR.tObject]),
            'routerDelegate',
            true,
            (o) => () => o!.routerDelegate,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// {@macro flutter.widgets.widgetsApp.routerDelegate}''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'backbuttondispatcher':
        return FieldReflection<MaterialApp, BackButtonDispatcher?>(
            this,
            MaterialApp,
            __TR<BackButtonDispatcher>(BackButtonDispatcher),
            'backButtonDispatcher',
            true,
            (o) => () => o!.backButtonDispatcher,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// {@macro flutter.widgets.widgetsApp.backButtonDispatcher}''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'routerconfig':
        return FieldReflection<MaterialApp, RouterConfig<Object>?>(
            this,
            MaterialApp,
            __TR<RouterConfig<Object>>(RouterConfig, <__TR>[__TR.tObject]),
            'routerConfig',
            true,
            (o) => () => o!.routerConfig,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// {@macro flutter.widgets.widgetsApp.routerConfig}''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'builder':
        return FieldReflection<MaterialApp,
                Widget Function(BuildContext context, Widget? child)?>(
            this,
            MaterialApp,
            __TR<TransitionBuilder>(TransitionBuilder),
            'builder',
            true,
            (o) => () => o!.builder,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// {@macro flutter.widgets.widgetsApp.builder}
///
/// Material specific features such as [showDialog] and [showMenu], and widgets
/// such as [Tooltip], [PopupMenuButton], also require a [Navigator] to properly
/// function.''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'title':
        return FieldReflection<MaterialApp, String>(
            this,
            MaterialApp,
            __TR.tString,
            'title',
            false,
            (o) => () => o!.title,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// {@macro flutter.widgets.widgetsApp.title}
///
/// This value is passed unmodified to [WidgetsApp.title].''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'ongeneratetitle':
        return FieldReflection<MaterialApp,
                String Function(BuildContext context)?>(
            this,
            MaterialApp,
            __TR<GenerateAppTitle>(GenerateAppTitle),
            'onGenerateTitle',
            true,
            (o) => () => o!.onGenerateTitle,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// {@macro flutter.widgets.widgetsApp.onGenerateTitle}
///
/// This value is passed unmodified to [WidgetsApp.onGenerateTitle].''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'theme':
        return FieldReflection<MaterialApp, ThemeData?>(
            this,
            MaterialApp,
            __TR<ThemeData>(ThemeData),
            'theme',
            true,
            (o) => () => o!.theme,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// Default visual properties, like colors fonts and shapes, for this app's
/// material widgets.
///
/// A second [darkTheme] [ThemeData] value, which is used to provide a dark
/// version of the user interface can also be specified. [themeMode] will
/// control which theme will be used if a [darkTheme] is provided.
///
/// The default value of this property is the value of [ThemeData.light()].
///
/// See also:
///
///  * [themeMode], which controls which theme to use.
///  * [MediaQueryData.platformBrightness], which indicates the platform's
///    desired brightness and is used to automatically toggle between [theme]
///    and [darkTheme] in [MaterialApp].
///  * [ThemeData.brightness], which indicates the [Brightness] of a theme's
///    colors.''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'darktheme':
        return FieldReflection<MaterialApp, ThemeData?>(
            this,
            MaterialApp,
            __TR<ThemeData>(ThemeData),
            'darkTheme',
            true,
            (o) => () => o!.darkTheme,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// The [ThemeData] to use when a 'dark mode' is requested by the system.
///
/// Some host platforms allow the users to select a system-wide 'dark mode',
/// or the application may want to offer the user the ability to choose a
/// dark theme just for this application. This is theme that will be used for
/// such cases. [themeMode] will control which theme will be used.
///
/// This theme should have a [ThemeData.brightness] set to [Brightness.dark].
///
/// Uses [theme] instead when null. Defaults to the value of
/// [ThemeData.light()] when both [darkTheme] and [theme] are null.
///
/// See also:
///
///  * [themeMode], which controls which theme to use.
///  * [MediaQueryData.platformBrightness], which indicates the platform's
///    desired brightness and is used to automatically toggle between [theme]
///    and [darkTheme] in [MaterialApp].
///  * [ThemeData.brightness], which is typically set to the value of
///    [MediaQueryData.platformBrightness].''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'highcontrasttheme':
        return FieldReflection<MaterialApp, ThemeData?>(
            this,
            MaterialApp,
            __TR<ThemeData>(ThemeData),
            'highContrastTheme',
            true,
            (o) => () => o!.highContrastTheme,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// The [ThemeData] to use when 'high contrast' is requested by the system.
///
/// Some host platforms (for example, iOS) allow the users to increase
/// contrast through an accessibility setting.
///
/// Uses [theme] instead when null.
///
/// See also:
///
///  * [MediaQueryData.highContrast], which indicates the platform's
///    desire to increase contrast.''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'highcontrastdarktheme':
        return FieldReflection<MaterialApp, ThemeData?>(
            this,
            MaterialApp,
            __TR<ThemeData>(ThemeData),
            'highContrastDarkTheme',
            true,
            (o) => () => o!.highContrastDarkTheme,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// The [ThemeData] to use when a 'dark mode' and 'high contrast' is requested
/// by the system.
///
/// Some host platforms (for example, iOS) allow the users to increase
/// contrast through an accessibility setting.
///
/// This theme should have a [ThemeData.brightness] set to [Brightness.dark].
///
/// Uses [darkTheme] instead when null.
///
/// See also:
///
///  * [MediaQueryData.highContrast], which indicates the platform's
///    desire to increase contrast.''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'thememode':
        return FieldReflection<MaterialApp, ThemeMode?>(
            this,
            MaterialApp,
            __TR<ThemeMode>(ThemeMode),
            'themeMode',
            true,
            (o) => () => o!.themeMode,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// Determines which theme will be used by the application if both [theme]
/// and [darkTheme] are provided.
///
/// If set to [ThemeMode.system], the choice of which theme to use will
/// be based on the user's system preferences. If the [MediaQuery.platformBrightnessOf]
/// is [Brightness.light], [theme] will be used. If it is [Brightness.dark],
/// [darkTheme] will be used (unless it is null, in which case [theme]
/// will be used.
///
/// If set to [ThemeMode.light] the [theme] will always be used,
/// regardless of the user's system preference.
///
/// If set to [ThemeMode.dark] the [darkTheme] will be used
/// regardless of the user's system preference. If [darkTheme] is null
/// then it will fallback to using [theme].
///
/// The default value is [ThemeMode.system].
///
/// See also:
///
///  * [theme], which is used when a light mode is selected.
///  * [darkTheme], which is used when a dark mode is selected.
///  * [ThemeData.brightness], which indicates to various parts of the
///    system what kind of theme is being used.''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'themeanimationduration':
        return FieldReflection<MaterialApp, Duration>(
            this,
            MaterialApp,
            __TR<Duration>(Duration),
            'themeAnimationDuration',
            false,
            (o) => () => o!.themeAnimationDuration,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''/// The duration of animated theme changes.
///
/// When the theme changes (either by the [theme], [darkTheme] or [themeMode]
/// parameters changing) it is animated to the new theme over time.
/// The [themeAnimationDuration] determines how long this animation takes.
///
/// To have the theme change immediately, you can set this to [Duration.zero].
///
/// The default is [kThemeAnimationDuration].
///
/// See also:
///   [themeAnimationCurve], which defines the curve used for the animation.''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'themeanimationcurve':
        return FieldReflection<MaterialApp, Curve>(
            this,
            MaterialApp,
            __TR<Curve>(Curve),
            'themeAnimationCurve',
            false,
            (o) => () => o!.themeAnimationCurve,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// The curve to apply when animating theme changes.
///
/// The default is [Curves.linear].
///
/// This is ignored if [themeAnimationDuration] is [Duration.zero].
///
/// See also:
///   [themeAnimationDuration], which defines how long the animation is.''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'color':
        return FieldReflection<MaterialApp, Color?>(
            this,
            MaterialApp,
            __TR<Color>(Color),
            'color',
            true,
            (o) => () => o!.color,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// {@macro flutter.widgets.widgetsApp.color}''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'locale':
        return FieldReflection<MaterialApp, Locale?>(
            this,
            MaterialApp,
            __TR<Locale>(Locale),
            'locale',
            true,
            (o) => () => o!.locale,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// {@macro flutter.widgets.widgetsApp.locale}''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'localizationsdelegates':
        return FieldReflection<MaterialApp,
                Iterable<LocalizationsDelegate<dynamic>>?>(
            this,
            MaterialApp,
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
            documentCommentOfEn:
                '''/// {@macro flutter.widgets.widgetsApp.localizationsDelegates}
///
/// Internationalized apps that require translations for one of the locales
/// listed in [GlobalMaterialLocalizations] should specify this parameter
/// and list the [supportedLocales] that the application can handle.
///
/// ```dart
/// // The GlobalMaterialLocalizations and GlobalWidgetsLocalizations
/// // classes require the following import:
/// // import 'package:flutter_localizations/flutter_localizations.dart';
///
/// const MaterialApp(
///   localizationsDelegates: <LocalizationsDelegate<Object>>[
///     // ... app-specific localization delegate(s) here
///     GlobalMaterialLocalizations.delegate,
///     GlobalWidgetsLocalizations.delegate,
///   ],
///   supportedLocales: <Locale>[
///     Locale('en', 'US'), // English
///     Locale('he', 'IL'), // Hebrew
///     // ... other locales the app supports
///   ],
///   // ...
/// )
/// ```
///
/// ## Adding localizations for a new locale
///
/// The information that follows applies to the unusual case of an app
/// adding translations for a language not already supported by
/// [GlobalMaterialLocalizations].
///
/// Delegates that produce [WidgetsLocalizations] and [MaterialLocalizations]
/// are included automatically. Apps can provide their own versions of these
/// localizations by creating implementations of
/// [LocalizationsDelegate<WidgetsLocalizations>] or
/// [LocalizationsDelegate<MaterialLocalizations>] whose load methods return
/// custom versions of [WidgetsLocalizations] or [MaterialLocalizations].
///
/// For example: to add support to [MaterialLocalizations] for a locale it
/// doesn't already support, say `const Locale('foo', 'BR')`, one first
/// creates a subclass of [MaterialLocalizations] that provides the
/// translations:
///
/// ```dart
/// class FooLocalizations extends MaterialLocalizations {
///   FooLocalizations();
///   @override
///   String get okButtonLabel => 'foo';
///   // ...
///   // lots of other getters and methods to override!
/// }
/// ```
///
/// One must then create a [LocalizationsDelegate] subclass that can provide
/// an instance of the [MaterialLocalizations] subclass. In this case, this is
/// essentially just a method that constructs a `FooLocalizations` object. A
/// [SynchronousFuture] is used here because no asynchronous work takes place
/// upon "loading" the localizations object.
///
/// ```dart
/// // continuing from previous example...
/// class FooLocalizationsDelegate extends LocalizationsDelegate<MaterialLocalizations> {
///   const FooLocalizationsDelegate();
///   @override
///   bool isSupported(Locale locale) {
///     return locale == const Locale('foo', 'BR');
///   }
///   @override
///   Future<FooLocalizations> load(Locale locale) {
///     assert(locale == const Locale('foo', 'BR'));
///     return SynchronousFuture<FooLocalizations>(FooLocalizations());
///   }
///   @override
///   bool shouldReload(FooLocalizationsDelegate old) => false;
/// }
/// ```
///
/// Constructing a [MaterialApp] with a `FooLocalizationsDelegate` overrides
/// the automatically included delegate for [MaterialLocalizations] because
/// only the first delegate of each [LocalizationsDelegate.type] is used and
/// the automatically included delegates are added to the end of the app's
/// [localizationsDelegates] list.
///
/// ```dart
/// // continuing from previous example...
/// const MaterialApp(
///   localizationsDelegates: <LocalizationsDelegate<Object>>[
///     FooLocalizationsDelegate(),
///   ],
///   // ...
/// )
/// ```
/// See also:
///
///  * [supportedLocales], which must be specified along with
///    [localizationsDelegates].
///  * [GlobalMaterialLocalizations], a [localizationsDelegates] value
///    which provides material localizations for many languages.
///  * The Flutter Internationalization Tutorial,
///    <https://flutter.dev/tutorials/internationalization/>.''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'localelistresolutioncallback':
        return FieldReflection<
                MaterialApp,
                Locale? Function(
                    List<Locale>? locales, Iterable<Locale> supportedLocales)?>(
            this,
            MaterialApp,
            __TR<LocaleListResolutionCallback>(LocaleListResolutionCallback),
            'localeListResolutionCallback',
            true,
            (o) => () => o!.localeListResolutionCallback,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// {@macro flutter.widgets.widgetsApp.localeListResolutionCallback}
///
/// This callback is passed along to the [WidgetsApp] built by this widget.''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'localeresolutioncallback':
        return FieldReflection<
                MaterialApp,
                Locale? Function(
                    Locale? locale, Iterable<Locale> supportedLocales)?>(
            this,
            MaterialApp,
            __TR<LocaleResolutionCallback>(LocaleResolutionCallback),
            'localeResolutionCallback',
            true,
            (o) => () => o!.localeResolutionCallback,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// {@macro flutter.widgets.LocaleResolutionCallback}
///
/// This callback is passed along to the [WidgetsApp] built by this widget.''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'supportedlocales':
        return FieldReflection<MaterialApp, Iterable<Locale>>(
            this,
            MaterialApp,
            __TR<Iterable<Locale>>(Iterable, <__TR>[__TR<Locale>(Locale)]),
            'supportedLocales',
            false,
            (o) => () => o!.supportedLocales,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// {@macro flutter.widgets.widgetsApp.supportedLocales}
///
/// It is passed along unmodified to the [WidgetsApp] built by this widget.
///
/// See also:
///
///  * [localizationsDelegates], which must be specified for localized
///    applications.
///  * [GlobalMaterialLocalizations], a [localizationsDelegates] value
///    which provides material localizations for many languages.
///  * The Flutter Internationalization Tutorial,
///    <https://flutter.dev/tutorials/internationalization/>.''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'showperformanceoverlay':
        return FieldReflection<MaterialApp, bool>(
            this,
            MaterialApp,
            __TR.tBool,
            'showPerformanceOverlay',
            false,
            (o) => () => o!.showPerformanceOverlay,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn: '''/// Turns on a performance overlay.
///
/// See also:
///
///  * <https://flutter.dev/debugging/#performance-overlay>''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'checkerboardrastercacheimages':
        return FieldReflection<MaterialApp, bool>(
            this,
            MaterialApp,
            __TR.tBool,
            'checkerboardRasterCacheImages',
            false,
            (o) => () => o!.checkerboardRasterCacheImages,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// Turns on checkerboarding of raster cache images.''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'checkerboardoffscreenlayers':
        return FieldReflection<MaterialApp, bool>(
            this,
            MaterialApp,
            __TR.tBool,
            'checkerboardOffscreenLayers',
            false,
            (o) => () => o!.checkerboardOffscreenLayers,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// Turns on checkerboarding of layers rendered to offscreen bitmaps.''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'showsemanticsdebugger':
        return FieldReflection<MaterialApp, bool>(
            this,
            MaterialApp,
            __TR.tBool,
            'showSemanticsDebugger',
            false,
            (o) => () => o!.showSemanticsDebugger,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// Turns on an overlay that shows the accessibility information
/// reported by the framework.''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'debugshowcheckedmodebanner':
        return FieldReflection<MaterialApp, bool>(
            this,
            MaterialApp,
            __TR.tBool,
            'debugShowCheckedModeBanner',
            false,
            (o) => () => o!.debugShowCheckedModeBanner,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// {@macro flutter.widgets.widgetsApp.debugShowCheckedModeBanner}''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'shortcuts':
        return FieldReflection<MaterialApp, Map<ShortcutActivator, Intent>?>(
            this,
            MaterialApp,
            __TR<Map<ShortcutActivator, Intent>>(Map, <__TR>[
              __TR<ShortcutActivator>(ShortcutActivator),
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
            documentCommentOfEn:
                '''/// {@macro flutter.widgets.widgetsApp.shortcuts}
/// {@tool snippet}
/// This example shows how to add a single shortcut for
/// [LogicalKeyboardKey.select] to the default shortcuts without needing to
/// add your own [Shortcuts] widget.
///
/// Alternatively, you could insert a [Shortcuts] widget with just the mapping
/// you want to add between the [WidgetsApp] and its child and get the same
/// effect.
///
/// ```dart
/// Widget build(BuildContext context) {
///   return WidgetsApp(
///     shortcuts: <ShortcutActivator, Intent>{
///       ... WidgetsApp.defaultShortcuts,
///       const SingleActivator(LogicalKeyboardKey.select): const ActivateIntent(),
///     },
///     color: const Color(0xFFFF0000),
///     builder: (BuildContext context, Widget? child) {
///       return const Placeholder();
///     },
///   );
/// }
/// ```
/// {@end-tool}
/// {@macro flutter.widgets.widgetsApp.shortcuts.seeAlso}''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'actions':
        return FieldReflection<MaterialApp, Map<Type, Action<Intent>>?>(
            this,
            MaterialApp,
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
            documentCommentOfEn:
                '''/// {@macro flutter.widgets.widgetsApp.actions}
/// {@tool snippet}
/// This example shows how to add a single action handling an
/// [ActivateAction] to the default actions without needing to
/// add your own [Actions] widget.
///
/// Alternatively, you could insert a [Actions] widget with just the mapping
/// you want to add between the [WidgetsApp] and its child and get the same
/// effect.
///
/// ```dart
/// Widget build(BuildContext context) {
///   return WidgetsApp(
///     actions: <Type, Action<Intent>>{
///       ... WidgetsApp.defaultActions,
///       ActivateAction: CallbackAction<Intent>(
///         onInvoke: (Intent intent) {
///           // Do something here...
///           return null;
///         },
///       ),
///     },
///     color: const Color(0xFFFF0000),
///     builder: (BuildContext context, Widget? child) {
///       return const Placeholder();
///     },
///   );
/// }
/// ```
/// {@end-tool}
/// {@macro flutter.widgets.widgetsApp.actions.seeAlso}''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'restorationscopeid':
        return FieldReflection<MaterialApp, String?>(
            this,
            MaterialApp,
            __TR.tString,
            'restorationScopeId',
            true,
            (o) => () => o!.restorationScopeId,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// {@macro flutter.widgets.widgetsApp.restorationScopeId}''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'scrollbehavior':
        return FieldReflection<MaterialApp, ScrollBehavior?>(
            this,
            MaterialApp,
            __TR<ScrollBehavior>(ScrollBehavior),
            'scrollBehavior',
            true,
            (o) => () => o!.scrollBehavior,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// {@template flutter.material.materialApp.scrollBehavior}
/// The default [ScrollBehavior] for the application.
///
/// [ScrollBehavior]s describe how [Scrollable] widgets behave. Providing
/// a [ScrollBehavior] can set the default [ScrollPhysics] across
/// an application, and manage [Scrollable] decorations like [Scrollbar]s and
/// [GlowingOverscrollIndicator]s.
/// {@endtemplate}
///
/// When null, defaults to [MaterialScrollBehavior].
///
/// See also:
///
///  * [ScrollConfiguration], which controls how [Scrollable] widgets behave
///    in a subtree.''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'debugshowmaterialgrid':
        return FieldReflection<MaterialApp, bool>(
            this,
            MaterialApp,
            __TR.tBool,
            'debugShowMaterialGrid',
            false,
            (o) => () => o!.debugShowMaterialGrid,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// Turns on a [GridPaper] overlay that paints a baseline grid
/// Material apps.
///
/// Only available in debug mode.
///
/// See also:
///
///  * <https://material.io/design/layout/spacing-methods.html>''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'useinheritedmediaquery':
        return FieldReflection<MaterialApp, bool>(
            this,
            MaterialApp,
            __TR.tBool,
            'useInheritedMediaQuery',
            false,
            (o) => () => o!.useInheritedMediaQuery,
            null,
            obj,
            false,
            true,
            null,
            documentCommentOfEn:
                '''/// {@macro flutter.widgets.widgetsApp.useInheritedMediaQuery}''',
            documentCommentOfCn: null,
            isGenerated: null);
      case 'key':
        return FieldReflection<MaterialApp, Key?>(this, Widget, __TR<Key>(Key),
            'key', true, (o) => () => o!.key, null, obj, false, true, null,
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
        return FieldReflection<MaterialApp, int>(
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
  FieldReflection<MaterialApp, T>? staticField<T>(String fieldName) => null;

  static const List<String> _methodsNames = const <String>[
    'createState',
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

  static final Map<String, MethodReflection<MaterialApp, dynamic>>
      _methodsNoObject = <String, MethodReflection<MaterialApp, dynamic>>{};

  final Map<String, MethodReflection<MaterialApp, dynamic>> _methodsObject =
      <String, MethodReflection<MaterialApp, dynamic>>{};

  @override
  MethodReflection<MaterialApp, R>? method<R>(String methodName,
      [MaterialApp? obj]) {
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

  MethodReflection<MaterialApp, R>? _methodNoObjectImpl<R>(String methodName) {
    final m = _methodsNoObject[methodName];
    if (m != null) {
      return m as MethodReflection<MaterialApp, R>;
    }
    final m2 = _methodImpl(methodName, null);
    if (m2 == null) return null;
    _methodsNoObject[methodName] = m2;
    return m2 as MethodReflection<MaterialApp, R>;
  }

  MethodReflection<MaterialApp, R>? _methodObjectImpl<R>(String methodName) {
    final m = _methodsObject[methodName];
    if (m != null) {
      return m as MethodReflection<MaterialApp, R>;
    }
    var m2 = _methodNoObjectImpl<R>(methodName);
    if (m2 == null) return null;
    m2 = m2.withObject(object!);
    _methodsObject[methodName] = m2;
    return m2;
  }

  MethodReflection<MaterialApp, dynamic>? _methodImpl(
      String methodName, MaterialApp? obj) {
    obj ??= object;

    var lc = methodName.trim().toLowerCase();

    switch (lc) {
      case 'createstate':
        return MethodReflection<MaterialApp, State<MaterialApp>>(
            this,
            MaterialApp,
            'createState',
            __TR<State<MaterialApp>>(
                State, <__TR>[__TR<MaterialApp>(MaterialApp)]),
            false,
            (o) => o!.createState,
            obj,
            false,
            null,
            null,
            null,
            const [override]);
      case 'createelement':
        return MethodReflection<MaterialApp, StatefulElement>(
            this,
            StatefulWidget,
            'createElement',
            __TR<StatefulElement>(StatefulElement),
            false,
            (o) => o!.createElement,
            obj,
            false,
            null,
            null,
            null,
            const [override]);
      case 'tostringshort':
        return MethodReflection<MaterialApp, String>(
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
        return MethodReflection<MaterialApp, void>(
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
                  true)
            ],
            null,
            null,
            const [override]);
      case 'tostringshallow':
        return MethodReflection<MaterialApp, String>(
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
              'joiner': __PR(__TR.tString, 'joiner', false, false, ', '),
              'minLevel': __PR(__TR<DiagnosticLevel>(DiagnosticLevel),
                  'minLevel', false, false, DiagnosticLevel.debug)
            },
            null);
      case 'tostringdeep':
        return MethodReflection<MaterialApp, String>(
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
              'minLevel': __PR(__TR<DiagnosticLevel>(DiagnosticLevel),
                  'minLevel', false, false, DiagnosticLevel.debug),
              'prefixLineOne':
                  __PR(__TR.tString, 'prefixLineOne', false, false, ''),
              'prefixOtherLines':
                  __PR(__TR.tString, 'prefixOtherLines', true, false)
            },
            null);
      case 'todiagnosticsnode':
        return MethodReflection<MaterialApp, DiagnosticsNode>(
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
          'name': __PR(__TR.tString, 'name', true, false),
          'style': __PR(__TR<DiagnosticsTreeStyle>(DiagnosticsTreeStyle),
              'style', true, false)
        }, const [
          override
        ]);
      case 'debugdescribechildren':
        return MethodReflection<MaterialApp, List<DiagnosticsNode>>(
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
        return MethodReflection<MaterialApp, String>(
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
              false, false, DiagnosticLevel.info)
        }, const [
          override
        ]);
      default:
        return null;
    }
  }

  static const List<String> _staticMethodsNames = const <String>[
    'createMaterialHeroController'
  ];

  @override
  List<String> get staticMethodsNames => _staticMethodsNames;

  static final Map<String, MethodReflection<MaterialApp, dynamic>>
      _staticMethods = <String, MethodReflection<MaterialApp, dynamic>>{};

  @override
  MethodReflection<MaterialApp, R>? staticMethod<R>(String methodName) {
    var m = _staticMethods[methodName];
    if (m != null) {
      return m as MethodReflection<MaterialApp, R>;
    }
    m = _staticMethodImpl(methodName);
    if (m == null) return null;
    _staticMethods[methodName] = m;
    return m as MethodReflection<MaterialApp, R>;
  }

  MethodReflection<MaterialApp, dynamic>? _staticMethodImpl(String methodName) {
    var lc = methodName.trim().toLowerCase();

    switch (lc) {
      case 'creatematerialherocontroller':
        return MethodReflection<MaterialApp, HeroController>(
            this,
            MaterialApp,
            'createMaterialHeroController',
            __TR<HeroController>(HeroController),
            false,
            (o) => MaterialApp.createMaterialHeroController,
            null,
            true,
            null,
            null,
            null,
            null);
      default:
        return null;
    }
  }
}

extension MaterialApp$reflectionExtension on MaterialApp {
  /// Returns a [ClassReflection] for type [MaterialApp]. (Generated by [ReflectionFactory])
  ClassReflection<MaterialApp> get reflection => MaterialApp$reflection(this);

  /// Returns a JSON for type [MaterialApp]. (Generated by [ReflectionFactory])
  Object? toJson({bool duplicatedEntitiesAsID = false}) =>
      reflection.toJson(null, null, duplicatedEntitiesAsID);

  /// Returns a JSON [Map] for type [MaterialApp]. (Generated by [ReflectionFactory])
  Map<String, dynamic>? toJsonMap({bool duplicatedEntitiesAsID = false}) =>
      reflection.toJsonMap(duplicatedEntitiesAsID: duplicatedEntitiesAsID);

  /// Returns an encoded JSON [String] for type [MaterialApp]. (Generated by [ReflectionFactory])
  String toJsonEncoded(
          {bool pretty = false, bool duplicatedEntitiesAsID = false}) =>
      reflection.toJsonEncoded(
          pretty: pretty, duplicatedEntitiesAsID: duplicatedEntitiesAsID);

  /// Returns a JSON for type [MaterialApp] using the class fields. (Generated by [ReflectionFactory])
  Object? toJsonFromFields({bool duplicatedEntitiesAsID = false}) => reflection
      .toJsonFromFields(duplicatedEntitiesAsID: duplicatedEntitiesAsID);
}

extension ReflectionBridge1$reflectionExtension on ReflectionBridge1 {
  /// Returns a [ClassReflection] for type [T] or [obj]. (Generated by [ReflectionFactory])
  ClassReflection<T> reflection<T>([T? obj]) {
    switch (T) {
      case MaterialApp:
        return MaterialApp$reflection(obj as MaterialApp?)
            as ClassReflection<T>;
      default:
        throw UnsupportedError('<$runtimeType> No reflection for Type: $T');
    }
  }
}

List<Reflection> _listSiblingsReflection() => <Reflection>[
      MaterialApp$reflection(),
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
