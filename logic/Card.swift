//
//  Card.swift
//  logic
//
//  Created by Pivotal on 6/13/17.
//  Copyright © 2017 LST. All rights reserved.
//

import Foundation

public struct Card : Equatable, Hashable {
    
    let suite : Suite
    let value : Value
    
    enum Suite {
        case diamond
        case club
        case heart
        case spade
    }
    
    enum Value {
        case Ace
        case Two
        case Three
        case Four
        case Five
        case Six
        case Seven
        case Eight
        case Nine
        case Ten
        case Jack
        case Queen
        case King
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

