import XCTest
import Quick
import Nimble
@testable import SimpleStorable

class StoredTests: QuickSpec {
    @Stored(key: UUID().uuidString)
    var exampleStored: String?
    
    @KeychainStored(key: UUID().uuidString)
    var exampleKeychainStored: String?
    
    override func spec() {
        describe("Store a string via Stored wrapper") {
            it("should resides in UserDefaults.standard") {
                expect(self.exampleStored).to(beNil())
                
                let key = self.$exampleStored.key
                let value = UUID().uuidString
                self.exampleStored = value
                expect(self.exampleStored).to(equal(value))
                expect(UserDefaults.standard.value(by: key)).to(equal(value))
            }
        }
        
        describe("Store a string via KeychainStored wrapper") {
            it("should be inside keychain") {
                expect(self.exampleKeychainStored).to(beNil())
                
                let key = self.$exampleKeychainStored.key
                let keychain = self.$exampleKeychainStored.container
                let value = UUID().uuidString
                self.exampleKeychainStored = value
                expect(self.exampleKeychainStored).to(equal(value))
                expect(keychain.value(by: key)).to(equal(value))
            }
        }
    }
}
