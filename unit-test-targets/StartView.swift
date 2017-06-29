import UIKit

class StartView: UIView {
    
    @IBOutlet var logoYcenterConstraint: NSLayoutConstraint!
    @IBOutlet var showArray: [UIView]!
    @IBOutlet var selectThemeLabel: UILabel!
    
    func showOptions() {
        UIView.animate(withDuration: 0.3, delay: 0.2, options: .curveEaseInOut, animations: {
            self.logoYcenterConstraint.constant = -200
            self.layoutIfNeeded()
        }) { (finished) in
            if finished {
                self.selectThemeLabel.isHidden = false
                UIView.animate(withDuration: 0.4) {
                    self.showArray.forEach {
                        $0.isHidden = false
                    }
                }
            }
        }
    }
}
