import UIKit

class CoolView: UIView
{
    let accessoryView: AccessoryView
    let contentView: UIView
    
    override init(frame: CGRect) {
        accessoryView = AccessoryView(frame: frame.divided(atDistance: 70, from: .minYEdge).slice)
        contentView = UIView(frame: frame.divided(atDistance: 70, from: .minYEdge).remainder)
        contentView.backgroundColor = UIColor(white: 1.0, alpha: 0.5)

        super.init(frame: frame)
        
        configureSubviews()
        backgroundColor = UIColor.brown
    }
    
    func configureSubviews() {
        accessoryView.coolView = self
        
        addSubview(accessoryView)
        addSubview(contentView)
        
        contentView.clipsToBounds = true
        
        let subview1 = CoolViewCell(frame: CGRect(x: 12, y: 40, width: 80, height: 30))
        let subview2 = CoolViewCell(frame: CGRect(x: 35, y: 100, width: 80, height: 30))
        
        subview1.text = "Mmmm beer! 🍺"
        subview2.text = "Swift + UIKit: winning! 🍾"
        
        subview1.sizeToFit()
        subview2.sizeToFit()
        
        contentView.addSubview(subview1)
        contentView.addSubview(subview2)
        
        subview1.backgroundColor = UIColor.purple
        subview2.backgroundColor = UIColor.orange
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCell(text: String) {
        let newCell = CoolViewCell()
        newCell.text = text
        newCell.sizeToFit()
        contentView.addSubview(newCell)
    }
}


extension CoolView
{
    //    lazy var accessoryView: UIView? = {
    //        let view = UIView(frame: frame.divided(atDistance: 70, from: .minYEdge).slice)
    //        view.backgroundColor = UIColor(white: 1.0, alpha: 0.7)
    //        addSubview(view)
    //        return view
    //    }()
    //    lazy var contentView: UIView? = {
    //        let view = UIView(frame: frame.divided(atDistance: 70, from: .minYEdge).remainder)
    //        view.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
    //        addSubview(view)
    //        return view
    //    }()
}
