import UIKit

private let contentOffset = CGPoint(x: 12, y: 8)

class CoolViewCell: UIView
{
    var text: String?
    
    var highlighted = false {
        willSet {
            alpha = newValue ? 0.5 : 1.0
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayer()
        configureGestureRecognizer()
    }
    
    // TODO: implement me!
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureGestureRecognizer() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(bounce))
        recognizer.numberOfTapsRequired = 2
        addGestureRecognizer(recognizer)
    }
    
    private func configureLayer() {
        layer.cornerRadius = 10
        layer.masksToBounds = true
        layer.borderWidth = 3
        layer.borderColor = UIColor.white.cgColor
    }
}

private let bounceDuration: TimeInterval = 1.0
private let bounceSize = CGSize(width: 120, height: 240)

// MARK: - Action methods
extension CoolViewCell
{
    @objc func bounce() {
        print("In \(#function)")
        animateBounce(duration: bounceDuration, size: bounceSize)
    }
}

// MARK: - Animation
extension CoolViewCell
{
    func animateBounce(duration: TimeInterval, size: CGSize) {
        UIView.animate(withDuration: duration,
                       animations: { [weak self] in self?.configureBounce(duration: duration, size: size)  },
                       completion: { [weak self] _ in self?.animateFinalBounce(duration: duration, size: size) })
    }
    
    func animateFinalBounce(duration: TimeInterval, size: CGSize) {
        print("In \(#function)")
        UIView.animate(withDuration: duration) { [weak self] in
            self?.transform = .identity
        }
    }
    
    func configureBounce(duration: TimeInterval, size: CGSize) {
        UIView.setAnimationRepeatCount(3.5)
        UIView.setAnimationRepeatAutoreverses(true)
        let translation = CGAffineTransform(translationX: size.width, y: size.height)
        transform = translation.rotated(by: .pi/2)
    }
}

// MARK: - Custom drawing
extension CoolViewCell
{
    class var textAttributes: [NSAttributedStringKey: Any] {
        return [.font: UIFont.boldSystemFont(ofSize: 20),
                .foregroundColor: UIColor.white]
    }
    
    override func draw(_ rect: CGRect) {
        guard let text = text else { return }
        (text as NSString).draw(at: contentOffset, withAttributes: CoolViewCell.textAttributes)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        guard let text = text else { return size }
        let newSize = (text as NSString).size(withAttributes: CoolViewCell.textAttributes)
        return CGSize(width: newSize.width + contentOffset.x * 2,
                      height: newSize.height + contentOffset.y * 2)
    }
}

// MARK: - UIResponder touch handling methods
extension CoolViewCell
{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        highlighted = true
        superview?.bringSubview(toFront: self)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let currLocation = touch.location(in: nil)
        let prevLocation = touch.previousLocation(in: nil)

        let dx = currLocation.x - prevLocation.x
        let dy = currLocation.y - prevLocation.y

        frame = frame.offsetBy(dx: dx, dy: dy)
    }

    func endTouch(_ touch: UITouch?) {
        highlighted = false
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        endTouch(touches.first)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        endTouch(touches.first)
    }
}

//extension AppDelegate
//{
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let touchedView = touches.first?.view as? CoolViewCell else { return }
//        touchedView.superview?.bringSubview(toFront: touchedView)
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let touch = touches.first else { return }
//        let currLocation = touch.location(in: nil)
//        let prevLocation = touch.previousLocation(in: nil)
//
//        let dx = currLocation.x - prevLocation.x
//        let dy = currLocation.y - prevLocation.y
//
//        touch.view?.frame = touch.view?.frame.offsetBy(dx: dx, dy: dy) ?? .zero
//    }
//
//    func endTouch(_ touch: UITouch?) {
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        endTouch(touches.first)
//    }
//
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        endTouch(touches.first)
//    }
//}
