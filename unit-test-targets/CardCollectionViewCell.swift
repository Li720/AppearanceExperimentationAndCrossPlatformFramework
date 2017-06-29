
import UIKit
import logic

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var indicatorLabels: [UILabel]!
    
    private var _cardColor : UIColor?
    dynamic var themeBundle : Bundle? = CardCollectionViewCell.appearance().themeBundle
    private var cardSuiteColorDictionary : Dictionary<Card.Suite,UIColor> = [:]
    private var cornerRadius : CGFloat = 10.0
    private var cardBGColor : UIColor?
    private var cardSuite : Card.Suite?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = cornerRadius
        self.contentView.backgroundColor = cardBGColor
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cardSuite = nil
    }
    
    func configure(with card:Card) {
        cardSuite = card.suite
        indicatorLabels.forEach {
            $0.text = card.value.rawValue
            $0.textColor = self.cardSuiteColorDictionary[card.suite]
        }
        cardImageView.image = UIImage(named: card.suite.rawValue, in: self.themeBundle, compatibleWith: nil)
    }
    
    func updateIndicatorColors() {
        indicatorLabels.forEach {
            $0.textColor = self.cardSuiteColorDictionary[cardSuite!]
        }
    }
    
    dynamic var cardColor : UIColor? {
        get {
            return self._cardColor
        }
        set {
            self._cardColor = newValue
            self.layer.borderColor = self._cardColor?.cgColor
        }
    }
    
    dynamic var cardBackgroundColor : UIColor? {
        get {
            return self.cardBGColor
        }
        set {
            self.cardBGColor = newValue
            self.contentView.backgroundColor = self.cardBGColor
        }
    }
    
    dynamic var diamondColor : UIColor? {
        get {
            return cardSuiteColorDictionary[Card.Suite.diamond]
        }
        set {
            cardSuiteColorDictionary[Card.Suite.diamond] = newValue
            updateIndicatorColors()
        }
    }
    
    dynamic var clubColor : UIColor? {
        get {
            return cardSuiteColorDictionary[Card.Suite.club]
        }
        set {
            cardSuiteColorDictionary[Card.Suite.club] = newValue
            updateIndicatorColors()
        }
    }
    
    dynamic var heartColor : UIColor? {
        get {
            return cardSuiteColorDictionary[Card.Suite.heart]
        }
        set {
            cardSuiteColorDictionary[Card.Suite.heart] = newValue
            updateIndicatorColors()
        }
    }
    
    dynamic var spadeColor : UIColor? {
        get {
            return cardSuiteColorDictionary[Card.Suite.spade]
        }
        set {
            cardSuiteColorDictionary[Card.Suite.spade] = newValue
            updateIndicatorColors()
        }
    }
    
}
