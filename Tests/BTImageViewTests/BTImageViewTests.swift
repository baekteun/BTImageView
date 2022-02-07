import XCTest
@testable import BTImageView

final class BTImageViewTests: XCTestCase {
    
    func textInit_createBTImageViewClass() {
        XCTAssertNotNil(BTImageView())
    }
    
    func test_Init_propertyChange() {
        let align = [2,3]
        let spacing: CGFloat = 8
        let axis = NSLayoutConstraint.Axis.vertical
        
        let btv = BTImageView(aligns: align, spacing: spacing, axis: axis)
        XCTAssertEqual(btv.aligns, align)
        XCTAssertEqual(btv.spacing, spacing)
        XCTAssertEqual(btv.axis, axis)
    }
    
    func test_addImage() {
        let image = UIImage()
        
        let iv = BTImageView()
        iv.addImage(image: image)
        
        XCTAssertEqual(iv.images.count, 1)
    }
    
    func test_imageView_maximum() {
        let images: [UIImage] = [
            .init(),
            .init(),
            .init(),
            .init(),
            .init()
        ]
        let iv = BTImageView(aligns: [1,3])
        iv.setImages(images: images)
        XCTAssertEqual(iv.imageViews.count, 4)
    }
}
