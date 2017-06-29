import Foundation
public struct StandardDeck : Deck {
   
    public init() {
        
    }
    
    public var cards = [
        Card(suite: .diamond, value: .Ace),
        Card(suite: .diamond, value: .Two),
        Card(suite: .diamond, value: .Three),
        Card(suite: .diamond, value: .Four),
        Card(suite: .diamond, value: .Five),
        Card(suite: .diamond, value: .Six),
        Card(suite: .diamond, value: .Seven),
        Card(suite: .diamond, value: .Eight),
        Card(suite: .diamond, value: .Nine),
        Card(suite: .diamond, value: .Ten),
        Card(suite: .diamond, value: .Jack),
        Card(suite: .diamond, value: .Queen),
        Card(suite: .diamond, value: .King),
        
        Card(suite: .club, value: .Ace),
        Card(suite: .club, value: .Two),
        Card(suite: .club, value: .Three),
        Card(suite: .club, value: .Four),
        Card(suite: .club, value: .Five),
        Card(suite: .club, value: .Six),
        Card(suite: .club, value: .Seven),
        Card(suite: .club, value: .Eight),
        Card(suite: .club, value: .Nine),
        Card(suite: .club, value: .Ten),
        Card(suite: .club, value: .Jack),
        Card(suite: .club, value: .Queen),
        Card(suite: .club, value: .King),
        
        Card(suite: .heart, value: .Ace),
        Card(suite: .heart, value: .Two),
        Card(suite: .heart, value: .Three),
        Card(suite: .heart, value: .Four),
        Card(suite: .heart, value: .Five),
        Card(suite: .heart, value: .Six),
        Card(suite: .heart, value: .Seven),
        Card(suite: .heart, value: .Eight),
        Card(suite: .heart, value: .Nine),
        Card(suite: .heart, value: .Ten),
        Card(suite: .heart, value: .Jack),
        Card(suite: .heart, value: .Queen),
        Card(suite: .heart, value: .King),
        
        Card(suite: .spade, value: .Ace),
        Card(suite: .spade, value: .Two),
        Card(suite: .spade, value: .Three),
        Card(suite: .spade, value: .Four),
        Card(suite: .spade, value: .Five),
        Card(suite: .spade, value: .Six),
        Card(suite: .spade, value: .Seven),
        Card(suite: .spade, value: .Eight),
        Card(suite: .spade, value: .Nine),
        Card(suite: .spade, value: .Ten),
        Card(suite: .spade, value: .Jack),
        Card(suite: .spade, value: .Queen),
        Card(suite: .spade, value: .King),
        ]
}
