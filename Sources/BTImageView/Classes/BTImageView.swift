
#if canImport(UIKit)
import UIKit
#endif
import Foundation

public class BTImageView: UIView {
    // MARK: - Properties
    public fileprivate(set) var imageViews: [UIImageView] = []
    public var images: [UIImage] = []
    public var aligns: [Int] = [1]
    public var axis: NSLayoutConstraint.Axis = .horizontal
    public var spacing: CGFloat = 5
    fileprivate var limitCount: Int {
        get { return aligns.reduce(0, +) }
    }
    fileprivate var lastIndex: Int {
        get { return limitCount - 1 }
    }
    
    // MARK: - Init
    public init(
        aligns: [Int] = [1],
        spacing: CGFloat = 5,
        axis: NSLayoutConstraint.Axis = .horizontal
    ) {
        self.aligns = aligns
        self.spacing = spacing
        self.axis = axis
        super.init(frame: .zero)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public Method
public extension BTImageView {
    func addImage(image: UIImage) {
        self.images.append(image)
        update()
    }
    func addImage(url: String) {
        guard let url = URL(string: url) else {
            return
        }
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            guard let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.addImage(image: image)
            }
        }
    }
    func setImages(images: [UIImage]) {
        self.images = images
        update()
    }
    func setImages(urls: [String]) {
        let urls = urls.map { URL(string: $0) }.compactMap{ $0 }
        DispatchQueue.global().async {
            var images: [UIImage] = []
            urls.forEach{ url in
                guard let data = try? Data(contentsOf: url) else { return }
                guard let image = UIImage(data: data) else { return }
                images.append(image)
            }
            DispatchQueue.main.async {
                self.setImages(images: images)
            }
        }
    }
    func removeFirstImage() {
        self.images.removeFirst()
        update()
    }
    func removeLastImage() {
        self.images.removeLast()
        update()
    }
    func removeImage(at index: Int) {
        self.images.remove(at: index)
        update()
    }
    func removeAllImage() {
        self.images.removeAll()
        update()
    }
}

// MARK: - Method
fileprivate extension BTImageView {
    func reset() {
        self.imageViews.removeAll()
    }
    
    func update() {
        subviews.forEach{ $0.removeFromSuperview() }
        reset()
        guard !images.isEmpty,
              !aligns.isEmpty,
              !aligns.contains(0)
        else {
            return
        }
        var subStacks: [UIStackView] = []
        
        var currentHead = 0
        var currentSub = 0
        let subAxis: NSLayoutConstraint.Axis = self.axis == .horizontal ? .vertical : .horizontal
        
        var lineImageViews: [UIImageView] = []
        images.forEach { image in
            if self.imageViews.count == limitCount {
                let over = self.imageViews.count - limitCount
                self.imageViews[lastIndex].configureMoreOverlay(text: "+ \(over)")
            }
            else {
                if currentSub == self.aligns[currentHead] {
                    currentHead += 1
                    currentSub = 1
                    subStacks.append(CustomStackView(views: lineImageViews, axis: subAxis))
                    lineImageViews.removeAll()
                }
                else {
                    currentSub += 1
                }
                let iv = UIImageView(image: image)
                iv.contentMode = .scaleAspectFill
                iv.clipsToBounds = true
                lineImageViews.append(iv)
                self.imageViews.append(iv)
            }
        }
        if !lineImageViews.isEmpty {
            subStacks.append(CustomStackView(views: lineImageViews, axis: subAxis))
        }
        let stack = CustomStackView(views: subStacks, axis: self.axis)
        addSubview(stack)
    }
    
    func CustomStackView(views: [UIView], axis: NSLayoutConstraint.Axis) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: views)
        stack.axis = axis
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = self.spacing
        stack.frame = CGRect(origin: .zero, size: frame.size)
        return stack
    }
}
