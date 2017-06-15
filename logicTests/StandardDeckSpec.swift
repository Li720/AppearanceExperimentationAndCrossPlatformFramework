import Quick
import Nimble
@testable import logic

class StandardDeckSpec: QuickSpec {
    override func spec() {
        describe("Standard Deck") {
            var standardDeck : Deck!
            beforeEach {
                standardDeck = StandardDeck()
            }
            it("Should have 52 cards", closure: {
                expect(standardDeck.count).to(equal(52))
            });
            
            it("Should have no duplicate cards", closure: { 
                let set = Set<Card>(standardDeck.cards)
                expect(set.count).to(equal(standardDeck.count))
            });
            
            it("Should contain Ace of Heart") {
                expect(standardDeck.contains(.Ace, of: .heart)).to(beTrue())
            }
            
            context("After removing a card") {
                var extractedCard : Card?
                beforeEach {
                    extractedCard = standardDeck.findAndRemove(.Ace, of: .heart)
                }
                it("Should not contain said card") {
                    expect(standardDeck.count).to(equal(51))
                    expect(standardDeck.contains(.Ace, of: .heart)).to(beFalse())
                }
                
                it("Should return extracted card") {
                    expect(extractedCard).to(equal(Card(suite: .heart, value: .Ace)))
                }
            }
            
            context("Adding a card (Spade King)") {
                beforeEach {
                    standardDeck.add(Card(suite: .spade, value: .King))
                }
                it("Should have an extra card") {
                    expect(standardDeck.count).to(equal(53))
                }
                it("Should contain 2 Space King cards") {
                    let extractedCard = standardDeck.findAndRemove(.King, of: .spade)
                    let extractedCard2 = standardDeck.findAndRemove(.King, of: .spade)
                    expect(extractedCard).to(equal(Card(suite: .spade, value: .King)))
                    expect(extractedCard2).to(equal(Card(suite: .spade, value: .King)))
                    
                }
            }
            
        }
    }
}
