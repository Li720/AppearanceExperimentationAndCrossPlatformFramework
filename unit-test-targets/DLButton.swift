import UIKit

class DLButton: UIButton {

    dynamic var buttonBackgroundColor : UIColor? {
        get {
            return backgroundColor
        }
        set {
            backgroundColor = newValue
        }
    }
    
    dynamic var buttonCornerRadius : CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    dynamic var buttonBorderWidth : CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    dynamic var buttonBorderColor : UIColor? {
        get {
            if layer.borderColor != nil {
                return UIColor(cgColor: layer.borderColor!)
            }
            return nil
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    dynamic var buttonFont : UIFont? {
        get {
            return titleLabel?.font
        }
        set {
            titleLabel?.font = newValue
        }
    }

}
