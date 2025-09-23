import Foundation
import SwiftData

@Model
final class Contact {
    var firstName: String
    var lastName: String
    var phone: String
    var email: String
    
    init(firstName: String, lastName: String, phone: String, email: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.phone = phone
        self.email = email
    }
}
