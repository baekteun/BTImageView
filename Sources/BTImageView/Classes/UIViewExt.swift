#if canImport(UIKit)
import UIKit
#endif
extension UIView {
    func equalToSuperView() {
        guard let superview = superview else {
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superview.topAnchor),
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
        ])
    }
    
    func configureMoreOverlay(text: String) {
        subviews.forEach{ $0.removeFromSuperview() }
        
        guard !text.isEmpty else {
            return
        }
        
        let frame = CGRect(origin: .zero, size: self.frame.size)
        let overlay = UILabel(frame: frame)
        overlay.backgroundColor = .init(red: 0, green: 0, blue: 0, alpha: 0.5)
        overlay.text = text
        overlay.font = .preferredFont(forTextStyle: .headline)
        overlay.textAlignment = .center
        overlay.textColor = .white
        self.addSubview(overlay)
        overlay.equalToSuperView()
    }
}
