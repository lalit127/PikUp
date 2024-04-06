import 'dart:io';
import 'package:pikup_app/common/common_import.dart';
import 'package:pikup_app/common/notification.dart';
import 'package:pikup_app/common/status_bar_color_controller.dart';
import 'package:pikup_app/config/theme/theme.dart';
import 'package:pikup_app/routes/app_pages.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

/// Setup Flutter Local Notifications Plugin
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

/// Setup Firebase
@pragma('vm:entry-point')
Future<void> _messageHandler(RemoteMessage message) async {
  //appPrint('background message ${message.data}');
  await Firebase.initializeApp();
  AppNotification.initialize(flutterLocalNotificationsPlugin);
  AppNotification.showBigTextNotification(
      title: message.notification!.title!,
      body: message.notification!.body!,
      fln: flutterLocalNotificationsPlugin);
  FirebaseMessaging.instance.getInitialMessage().then((message) {
    if (message != null) {
      // appPrint(message);
    }
  });
}

void main() async {
  // //for status  bar color
  // if (Platform.isAndroid) {
  //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //     statusBarColor: Colors.white, // status bar color
  //   ));
  // }
  /// Setup Firebase
  // FirebaseMessaging.onBackgroundMessage(_messageHandler);
  // await Firebase.initializeApp();
  // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // FlutterError.onError = (errorDetails) {
  //   // If you wish to record a "non-fatal" exception, please use `FirebaseCrashlytics.instance.recordFlutterError` instead
  //   FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  // };
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   // If you wish to record a "non-fatal" exception, please remove the "fatal" parameter
  //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //   return true;
  // };

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Get.put(StatusBarColorController());
    super.initState();
  }

  /// Setup Firebase
  _getFirebaseFCMToken() {
    FirebaseMessaging _firebaseMessaging =
        FirebaseMessaging.instance; // Change here
    _firebaseMessaging.getToken().then((token) {
      //appPrint("message token $token");
    });
  }

  /// Setup Firebase
  void _initMessaging() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    if (Platform.isAndroid) {
      flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()!
          .requestPermission();
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    } else if (Platform.isIOS) {
      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        // appPrint('User granted permission');
        // TODO: handle the received notifications
      } else {
        //appPrint('User declined or has not accepted permission');
      }
    }
    await Permission.notification.request();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        StatusBarColorController statusBarColorController =
            Get.put(StatusBarColorController());
        ThemeMode themeMode = statusBarColorController.themeMode;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          home: GetMaterialApp(
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.lightTheme,
            themeMode: themeMode,
            title: "FoodEase",
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            locale: const Locale("en"),
            supportedLocales: const [
              Locale('en', ''),
              Locale('ko', ''),
            ],
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
