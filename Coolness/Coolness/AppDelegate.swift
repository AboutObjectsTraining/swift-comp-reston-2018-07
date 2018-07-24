import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        let frameRect = UIScreen.main.bounds
        window = UIWindow(frame: frameRect)
        window?.backgroundColor = UIColor.yellow
        window?.makeKeyAndVisible()
        
//        let controller = CoolViewController()
//        guard let view = controller.view else { return }
//        window?.addSubview(view)
        
        window?.rootViewController = CoolViewController()
    }
}

