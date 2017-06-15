import Quick
import Nimble
@testable import logic

struct TestEmptyDeck : Deck {
    var cards : [Card] = []
}

struct TestOneCardDeck : Deck {
    var cards = [Card(suite: .diamond, value: .Ace)]
}

struct TestThreeCardDeck : Deck {
    var cards = [Card(suite: .diamond, value: .Ace),
                 Card(suite: .club, value: .King),
                 Card(suite: .heart, value: .Queen)]
}

struct TestMultiDeck : Deck {
    var cards = [Card(suite: .club, value: .King),
                 Card(suite: .club, value: .King),
                 Card(suite: .heart, value: .Queen)]
}

class DeckSpec: QuickSpec {
    override func spec() {
        var emptyDeck : TestEmptyDeck!
        var oneCardDeck : TestOneCardDeck!
        var threeCardDeck : TestThreeCardDeck!
        beforeEach {
            emptyDeck = TestEmptyDeck()
            oneCardDeck = TestOneCardDeck()
            threeCardDeck = TestThreeCardDeck()
        }
        context("Count") {
            it("Empty should 0 count") {
                expect(emptyDeck.count).to(equal(0))
            }
            it("One card deck should have 1 count") {
                expect(oneCardDeck.count).to(equal(1))
            }
            it("Three card deck should have 3 count") {
                expect(threeCardDeck.count).to(equal(3))
            }
        }
        
        context("Contains") { 
            it("Empty should not contain") {
                expect(emptyDeck.contains(.Ace, of: .diamond)).to(beFalse())
            }
            
            it("One deck should contain Ace Diamonds") {
                expect(oneCardDeck.contains(.Ace, of: .diamond)).to(beTrue())
            }
            it("Three deck should contain Ace diamonds and King club") {
                expect(threeCardDeck.contains(.Ace, of: .diamond)).to(beTrue())
                expect(threeCardDeck.contains(.King, of: .club)).to(beTrue())
            }
        }
        
        context("Adding Eight Diamonds to Empty Deck") {
            var startOffEmptyDeck : TestEmptyDeck!
            beforeEach {
                startOffEmptyDeck = TestEmptyDeck()
                startOffEmptyDeck.add(Card(suite: .diamond, value: .Eight))
            }
            
            it("Should contain a single card now") {
                expect(startOffEmptyDeck.count).to(equal(1))
            }
            
            it("Should contain the eight of diamonds") {
                expect(startOffEmptyDeck.contains(.Eight, of: .diamond)).to(beTrue())
            }
        }
        
        context("Adding Eight Diamonds to Populated Deck") {
            var startOffPopulatedDeck : TestThreeCardDeck!
            beforeEach {
                startOffPopulatedDeck = TestThreeCardDeck()
                startOffPopulatedDeck.add(Card(suite: .diamond, value: .Eight))
            }
            
            it("Should contain 4 cards now") {
                expect(startOffPopulatedDeck.count).to(equal(4))
            }
            
            it("Should contain the eight of diamonds") {
                expect(startOffPopulatedDeck.contains(.Eight, of: .diamond)).to(beTrue())
            }
        }
        
        context("Find and Remove") {
            
            context("A card that is in the deck") {
                
                var extractedCardFromThreeDeck : Card?
                var extractedCardFromOneDeck: Card?
                
                beforeEach {
                    extractedCardFromThreeDeck = threeCardDeck.findAndRemove(.Ace, of: .diamond)
                    extractedCardFromOneDeck = oneCardDeck.findAndRemove(.Ace, of: .diamond)
                }
                
                it("Should remove the card") {
                    expect(threeCardDeck.count).to(equal(2))
                    expect(oneCardDeck.count).to(equal(0))
                    expect(extractedCardFromOneDeck).to(equal(Card(suite: .diamond, value: .Ace)))
                    expect(extractedCardFromThreeDeck).to(equal(Card(suite: .diamond, value: .Ace)))
                    
                }
                
                it("Should no longer contain removed card") {
                    expect(threeCardDeck.contains(.Ace, of: .diamond)).to(beFalse())
                    expect(oneCardDeck.contains(.Ace, of: .diamond)).to(beFalse())
                }
            }
            
            context("A card that is not in the deck") {
                var extractedCardFromThreeDeck : Card?
                var extractedCardFromOneDeck: Card?
                var extractedCardFromEmptyDeck: Card?
                
                beforeEach {
                    extractedCardFromThreeDeck = threeCardDeck.findAndRemove(.Nine, of: .heart)
                    extractedCardFromOneDeck = oneCardDeck.findAndRemove(.Three, of: .club)
                    extractedCardFromEmptyDeck = emptyDeck.findAndRemove(.Three, of: .spade)
                }
                
                it("Should not remove or return any card") {
                    expect(threeCardDeck.count).to(equal(3))
                    expect(oneCardDeck.count).to(equal(1))
                    expect(emptyDeck.count).to(equal(0))
                    expect(extractedCardFromOneDeck).to(beNil())
                    expect(extractedCardFromThreeDeck).to(beNil())
                    expect(extractedCardFromEmptyDeck).to(beNil())
                }
            }
        }
        
        context("Find and Remove All") {
            
            var multiDeck : TestMultiDeck!
            var extractedCardsFromMultiDeck : [Card]?

            beforeEach {
                multiDeck = TestMultiDeck()
                extractedCardsFromMultiDeck = multiDeck.findAndRemoveAll(.King, of: .club)
            }
            
            it("Should remove the 2 king of clubs") {
                expect(multiDeck.count).to(equal(1))
                expect(multiDeck.contains(.King, of: .club)).to(beFalse())
            }
            
            it("Should return the 2 extracted cards") {
                expect(extractedCardsFromMultiDeck).to(equal([Card(suite: .club, value: .King),Card(suite: .club, value: .King)]))
            }
            
            context("when nothing to remove", closure: { 
                beforeEach {
                    extractedCardsFromMultiDeck = multiDeck.findAndRemoveAll(.Queen, of: .club)
                }
                
                it("should return nil") {
                    expect(extractedCardsFromMultiDeck).to(beNil())
                }
            })
        }
        
        context("subscript access & manipulation") {
            it("should return the right card") {
                expect(threeCardDeck[0]).to(equal(Card(suite: .diamond, value: .Ace)))
                expect(threeCardDeck[1]).to(equal(Card(suite: .club, value: .King)))
                expect(threeCardDeck[2]).to(equal(Card(suite: .heart, value: .Queen)))
            }
            
            it("should replace the right card") {
                threeCardDeck[0] = Card(suite: .club, value: .Eight)
                expect(threeCardDeck[0]).to(equal(Card(suite: .club, value: .Eight)))
            }
        }
        
    }
}
