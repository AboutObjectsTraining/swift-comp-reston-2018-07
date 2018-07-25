import UIKit

class AccessoryView: UIView
{
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var coolView: CoolView?
    
    @IBAction func addCell() {
        print("In \(#function), text is \(textField.text ?? "empty")")
        coolView?.addCell(text: textField.text ?? "")
    }
}

extension AccessoryView: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

