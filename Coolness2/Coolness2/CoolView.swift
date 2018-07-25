import UIKit

class CoolView: UIView
{
    @IBOutlet var contentView: UIView!
    
    let cellNib = UINib(nibName: "CoolCell", bundle: nil)
    
    func addCell(text: String) {
        guard let newCell = loadCell() else { return }
        newCell.text = text
        newCell.sizeToFit()
        contentView.addSubview(newCell)
    }
    
    func loadCell() -> CoolViewCell? {
        let topLevelObjs = cellNib.instantiate(withOwner: nil, options: nil)
        return topLevelObjs.first as? CoolViewCell
    }
}


//extension CoolView
//{
//    func loadCellXXX() -> CoolViewCell? {
//        let topLevelObjs = Bundle.main.loadNibNamed("CoolCell", owner: nil, options: nil)
//        return topLevelObjs?.first as? CoolViewCell
//    }
//}
