import UIKit
import logic

class ThemeManager {
    
    static func apply(cardTheme theme:Theme, whenIn containers:[UIAppearanceContainer.Type]? = nil) {
        var cardCollectionCellAppearance = CardCollectionViewCell.appearance()
        if let unwrappedContainers = containers {
            cardCollectionCellAppearance = CardCollectionViewCell.appearance(whenContainedInInstancesOf: unwrappedContainers)
        }
        cardCollectionCellAppearance.themeBundle = theme.cardImageBundle
        cardCollectionCellAppearance.cardBackgroundColor = theme.cardBackgroundColor
        cardCollectionCellAppearance.diamondColor = theme.cardColorDictionary[Card.Suite.diamond]
        cardCollectionCellAppearance.clubColor = theme.cardColorDictionary[Card.Suite.club]
        cardCollectionCellAppearance.heartColor = theme.cardColorDictionary[Card.Suite.heart]
        cardCollectionCellAppearance.spadeColor = theme.cardColorDictionary[Card.Suite.spade]
    }
    
    static func apply(buttonTheme theme:Theme, whenIn containers:[UIAppearanceContainer.Type]? = nil) {
        var buttonAppearance = DLButton.appearance()
        if let unwrappedContainers = containers {
            buttonAppearance = DLButton.appearance(whenContainedInInstancesOf: unwrappedContainers)
        }
        
        buttonAppearance.buttonBackgroundColor = theme.buttonBackgroundColor
        buttonAppearance.buttonBorderWidth = theme.buttonBorderWidth
        buttonAppearance.buttonCornerRadius = theme.buttonCornerRadius
        buttonAppearance.buttonBorderColor = theme.buttonBorderColor
        buttonAppearance.buttonFont = theme.buttonFont
    }
    
    static func apply(_ theme:Theme, whenIn containers:[UIAppearanceContainer.Type]? = nil) {
        //Card
        apply(cardTheme: theme, whenIn: containers)
        apply(buttonTheme: theme, whenIn: containers)
    }
}
