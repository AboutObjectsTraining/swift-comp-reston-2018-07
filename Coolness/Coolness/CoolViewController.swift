import UIKit

class CoolViewController: UIViewController
{
    var coolView: CoolView! {
        return view as! CoolView
    }
    
    override func loadView() {
        view = CoolView(frame: UIScreen.main.bounds)
//        
//        let subview1 = CoolViewCell(frame: CGRect(x: 12, y: 40, width: 80, height: 30))
//        let subview2 = CoolViewCell(frame: CGRect(x: 35, y: 100, width: 80, height: 30))
//        
//        view.addSubview(subview1)
//        view.addSubview(subview2)
//        
//        subview1.backgroundColor = UIColor.purple
//        subview2.backgroundColor = UIColor.orange
    }
}
