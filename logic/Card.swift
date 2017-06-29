import Foundation

public struct Card : Equatable, Hashable {
    
    public let suite : Suite
    public let value : Value
    
    public enum Suite : String {
        case diamond = "diamonds"
        case club = "clubs"
        case heart = "hearts"
        case spade = "spades"
        
    }
    
    public enum Value : String {
        case Ace = "A"
        case Two = "2"
        case Three = "3"
        case Four = "4"
        case Five = "5"
        case Six = "6"
        case Seven = "7"
        case Eight = "8"
        case Nine = "9"
        case Ten = "10"
        case Jack = "J"
        case Queen = "Q"
        case King = "K"
    }
    
    public static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.value == rhs.value && lhs.suite == rhs.suite
    }
    
    public 	var hashValue: Int {
        get {
            return self.suite.hashValue ^ self.value.hashValue
        }
    }
}

