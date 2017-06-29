import UIKit
import logic

protocol Theme {
    
    //Button - Generic
    var buttonCornerRadius : CGFloat { get }
    var buttonBorderWidth : CGFloat { get }
    var buttonBorderColor : UIColor { get }
    var buttonBackgroundColor : UIColor { get }
    var buttonFont : UIFont { get }
    
    //Button - CTA
    var buttonCTACornerRadius : CGFloat { get }
    var buttonCTABorderWidth : CGFloat { get }
    var buttonCTABorderColor : UIColor { get }
    
    //Button - Danger
    var buttonDangerCornerRadius : CGFloat { get }
    var buttonDangerBorderWidth : CGFloat { get }
    var buttonDangerBorderColor : UIColor { get }
    
    //Card
    var cardColorDictionary : Dictionary<Card.Suite,UIColor> { get }
    var cardImageBundle: Bundle { get }
    var cardCornerRadius : CGFloat { get }
    var cardBackgroundColor : UIColor { get }
}
