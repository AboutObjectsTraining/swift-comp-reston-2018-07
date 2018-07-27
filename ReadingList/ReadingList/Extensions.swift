import UIKit

extension UIStoryboardSegue
{
    var realDestination: UIViewController? {
        guard let navController = destination as? UINavigationController else { return destination }
        return navController.childViewControllers.first
    }
}

extension IndexPath
{
    static var zero: IndexPath {
        return IndexPath(row: 0, section: 0)
    }
}
