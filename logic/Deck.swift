//
//  Deck.swift
//  logic
//
//  Created by Pivotal on 6/13/17.
//  Copyright © 2017 LST. All rights reserved.
//
import Foundation

protocol Deck {
    var cards : [Card] { get set }
    var count : Int { get }
    func contains(_ value: Card.Value, of suite: Card.Suite) -> Bool
    mutating func add(_ card: Card)
    @discardableResult mutating func findAndRemove(_ value: Card.Value, of suite: Card.Suite) -> Card?
    @discardableResult mutating func findAndRemoveAll(_ value: Card.Value, of suite: Card.Suite) -> [Card]?
}

extension Deck {
    var count: Int {
        get {
            return cards.count
        }
    }
    
    func contains(_ value: Card.Value, of suite: Card.Suite) -> Bool {
        return cards.contains(Card(suite: suite, value: value))
    }
    
    mutating func add(_ card: Card) {
        cards.append(card)
    }
    
    @discardableResult mutating func findAndRemove(_ value: Card.Value, of suite: Card.Suite) -> Card? {
        let mirrorCard = Card(suite: suite, value: value)
        let foundIndex = cards.index(of: mirrorCard)
        if foundIndex != nil {
            cards.remove(at:foundIndex!)
            return mirrorCard
        }
        return nil
    }
    
    @discardableResult mutating func findAndRemoveAll(_ value: Card.Value, of suite: Card.Suite) -> [Card]? {
        if !(contains(value, of: suite)) {
            return nil
        } else {
            let extractedcards = cards.filter({ (card) -> Bool in
                return card == Card(suite: suite, value: value)
            })
            cards = cards.filter({ (card) -> Bool in
                return card != Card(suite: suite, value: value)
            })
            return extractedcards
        }
    }
    
    subscript(index: Int) -> Card {
        get {
            return cards[index]
        }
        set(newValue) {
            cards[index] = newValue
        }
    }
}
