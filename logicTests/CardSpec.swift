import Quick
import Nimble
@testable import logic

typealias Suite = Card.Suite

class CardSpec: QuickSpec {
    override func spec() {
        describe("Card") {
            it("When cards have the same value and same suite they are equal") {
                let lhs = Card(suite: .diamond, value: .Ace)
                let rhs = Card(suite: .diamond, value: .Ace)
                expect(lhs).to(equal(rhs))
                expect(lhs==rhs).to(beTrue())
            }
            
            it("When cards have the different value and same suite they are not equal") {
                let lhs = Card(suite: .diamond, value: .Ace)
                let rhs = Card(suite: .diamond, value: .King)
                expect(lhs).toNot(equal(rhs))
                expect(lhs==rhs).to(beFalse())
            }
            
            it("When cards have the same value and different suite they are not equal") {
                let lhs = Card(suite: .diamond, value: .Ace)
                let rhs = Card(suite: .spade, value: .Ace)
                expect(lhs).toNot(equal(rhs))
                expect(lhs==rhs).to(beFalse())
            }
            
        }
    }
}



