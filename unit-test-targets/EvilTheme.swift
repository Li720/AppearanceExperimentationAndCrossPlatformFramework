import UIKit
import logic

class EvilTheme: Theme {
    
    static var evilBundle : Bundle = {
        let evilPath = Bundle.main.path(forResource:"eviltheme", ofType:"bundle")!
        let bundle = Bundle.init(path: evilPath)
        let fontData = NSData(contentsOf: (bundle?.url(forResource: "youmurdererbb_reg", withExtension: "otf"))!)
        let provider = CGDataProvider.init(data: fontData!)
        let font = CGFont.init(provider!)
        let success = !CTFontManagerRegisterGraphicsFont(font, nil)
        print("success font registration : \(success)")
        for family: String in UIFont.familyNames
        {
            print("\(family)")
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
        return bundle!
    }()
    
    //Button - Generic
    var buttonCornerRadius : CGFloat = 0
    var buttonBorderWidth : CGFloat = 0
    var buttonBorderColor : UIColor = UIColor.black
    var buttonBackgroundColor : UIColor = UIColor.clear
    var buttonFont : UIFont {
        let _ = EvilTheme.evilBundle
        return UIFont.init(name: "YouMurdererBB", size: 26)!
    }
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
        Card.Suite.diamond : UIColor.orange,
        Card.Suite.club : UIColor.white,
        Card.Suite.heart : UIColor.orange,
        Card.Suite.spade : UIColor.white
    ]
    
    var cardImageBundle: Bundle = EvilTheme.evilBundle
    var cardCornerRadius : CGFloat = 5.0
    var cardBackgroundColor : UIColor = UIColor.black
}

class EvilThemeContainer: UIView {
    
}
