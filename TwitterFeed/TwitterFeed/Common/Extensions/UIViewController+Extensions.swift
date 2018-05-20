import Foundation
import UIKit

extension UIViewController {
    
    class func instantiate<T: UIViewController>(storyboardName: String? = nil) -> T {
        let identifier = String(describing: self)
        let name = storyboardName ?? identifier
        let storyboard = UIStoryboard(name: name, bundle: nil)
        
        guard let vc = storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("Cannot instantiate view controller for " + identifier)
        }
        return vc
    }
    
}
