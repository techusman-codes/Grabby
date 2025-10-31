import Flutter
import UIKit
import GoogleMaps



@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyCsfXMvyNgM42pg_6dztjohmiQgKd6tN3c")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
