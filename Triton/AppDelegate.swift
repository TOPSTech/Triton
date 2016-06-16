import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main().bounds)
        window.makeKeyAndVisible()
        window.backgroundColor = UIColor.white()

        window.rootViewController = ViewController()
        self.window = window
        return true
    }
}

