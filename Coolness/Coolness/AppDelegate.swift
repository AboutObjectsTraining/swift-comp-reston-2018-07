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
        window?.rootViewController = CoolViewController()
    }
}


// MARK: - UIResponder methods
extension AppDelegate
{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIApplication.shared.sendAction(#selector(resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
