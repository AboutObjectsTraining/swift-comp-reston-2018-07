import UIKit

class AccessoryView: UIView
{
    let textField: UITextField
    weak var coolView: CoolView?
    
    override init(frame: CGRect) {
        textField = UITextField(frame: CGRect(x: 8, y: 28, width: 240, height: 30))
        super.init(frame: frame)
        configureControls()
        backgroundColor = UIColor(white: 1.0, alpha: 0.7)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureControls() {
        addSubview(textField)
        textField.placeholder = "Enter some text"
        textField.borderStyle = .roundedRect
        textField.delegate = self
        
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.sizeToFit()
        button.frame = button.frame.offsetBy(dx: 260, dy: 28)
        addSubview(button)
        
        button.addTarget(self, action: #selector(addCell), for: .touchUpInside)
    }
    
    @objc func addCell() {
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

