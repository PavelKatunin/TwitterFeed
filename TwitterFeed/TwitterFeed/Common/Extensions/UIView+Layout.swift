import Foundation
import UIKit

extension UIView {
    
    func activateConstraints(size: CGSize) {
        NSLayoutConstraint.constraints(withVisualFormat: "[view(==\(size.width))]",
            options: .alignAllCenterX,
            metrics: nil,
            views: ["view" : self]).activate()
        NSLayoutConstraint.constraints(withVisualFormat: "V:[view(==\(size.height))]",
            options: .alignAllCenterX,
            metrics: nil,
            views: ["view" : self]).activate()
    }
    
    
    func activateConstraintsToWrapSuperview() {
        NSLayoutConstraint.constraints(withVisualFormat: "|-0-[view]-0-|",
                                       options: .alignAllCenterX,
                                       metrics: nil,
                                       views: ["view" : self]).activate()
        
        NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|",
                                       options: .alignAllCenterX,
                                       metrics: nil,
                                       views: ["view" : self]).activate()
    }
}
