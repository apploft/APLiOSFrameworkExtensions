//
// UITableView
//
import UIKit

public extension UITableView {
    
    /// Given a view determine the index path of the corresponding
    /// table view cell.
    /// - Parameter view: the view contained in any of the cells
    /// - Returns: the corresponding index path or nil
    func indexPathForView(_ view: UIView) -> IndexPath? {
        let point = view.convert(CGPoint.zero, to: self)
        return indexPathForRow(at: point)
    }
}
