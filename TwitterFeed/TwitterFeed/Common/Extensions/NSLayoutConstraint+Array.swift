import Foundation
import UIKit

extension Array where Element == NSLayoutConstraint {
    
    func activate() {
        NSLayoutConstraint.activate(self)
    }
    
}
