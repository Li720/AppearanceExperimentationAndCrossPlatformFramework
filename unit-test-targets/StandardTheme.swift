import UIKit
import logic

class StandardTheme: Theme {
    
    static var standardBundle : Bundle = {
        let standardPath = Bundle.main.path(forResource:"standardtheme", ofType:"bundle")!
        let bundle = Bundle.init(path: standardPath)
        return bundle!
    }()
    
    //Button - Generic
    var buttonCornerRadius : CGFloat = 10
    var buttonBorderWidth : CGFloat = 2
    var buttonBorderColor : UIColor = UIColor.black
    var buttonBackgroundColor : UIColor = UIColor.clear
    var buttonFont : UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)
    
    //Button - CTA
    var buttonCTACornerRadius : CGFloat = 0
    var buttonCTABorderWidth : CGFloat = 0
    var buttonCTABorderColor : UIColor = UIColor.black
    
    //Button - Danger
    var buttonDangerCornerRadius : CGFloat = 0
    var buttonDangerBorderWidth : CGFloat = 0
    var buttonDangerBorderColor : UIColor = UIColor.black
    
    //Card
    var cardColorDictionary : Dictionary<Card.Suite,UIColor> = [
        Card.Suite.diamond : UIColor.red,
        Card.Suite.club : UIColor.black,
        Card.Suite.heart : UIColor.red,
        Card.Suite.spade : UIColor.black
    ]
    
    var cardImageBundle: Bundle = StandardTheme.standardBundle
    var cardCornerRadius : CGFloat = 5.0
    var cardBackgroundColor : UIColor = UIColor.clear
}

class StandardThemeContainer: UIView {
    
}
