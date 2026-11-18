import UIKit
import Flutter
import GoogleMaps // 1. Adicione este import

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    // 2. Adicione a sua chave aqui
    GMSServices.provideAPIKey("AIzaSyBV6InGQzmQPvGi77NNBmddSPGaGGksvgI") 
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}