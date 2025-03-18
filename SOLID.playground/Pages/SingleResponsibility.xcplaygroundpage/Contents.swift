//: [Previous](@previous)

import Foundation

///
/// Bad Example
///  Here BadUserManager class is responsible for managing user data, saving user data and sending welcome emails.
///

class BadUserManager {
    var name: String
    var email: String
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
    
    func saveUserDetails() {
        print("Saved details for \(name)")
    }
    
    func sendWelcomeEmail() {
        print("Sent email to \(email)")
    }
}


let manager = BadUserManager(name: "Steve Jobs", email: "stevejobs@apple.com")
manager.saveUserDetails()
manager.sendWelcomeEmail()


class User {
    var name: String
    var email: String
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
}

///
/// Good Example
///
///  In BetterUserManager, you got

class BetterUserManager {
    var user: User
    var communicationManager: CommunicationManagerProtcool
    var persistanceManager: PersistanceManagerProtocol
    
    init(user: User) {
        self.user = user
        self.communicationManager = CommunicationManager(user: user)
        self.persistanceManager = PersistanceManager(user: user)
    }
    
    func sendWelcomeEmail() {
        communicationManager.sendEmail()
    }
    
    func saveUserDeatils() {
        persistanceManager.saveCustomerDetails()
    }
}

protocol CommunicationManagerProtcool {
    func sendEmail()
}


class CommunicationManager: CommunicationManagerProtcool {
    
    var user: User
    
    init(user: User) {
        self.user = user
    }
    func sendEmail() {
        print("Sent email to \(self.user.email)")
    }
}


protocol PersistanceManagerProtocol {
    func saveCustomerDetails()
}

class PersistanceManager: PersistanceManagerProtocol {
    var user: User
    
    init(user: User){
        self.user = user
    }
    
    func saveCustomerDetails() {
        print("Saved \(user.name)'s details")
    }
}

let user = User(name: "Tim Cook", email: "timcook@apple.com")

let betterUserManager = BetterUserManager(user: user)
betterUserManager.saveUserDeatils()
betterUserManager.sendWelcomeEmail()
//: [Next](@next)
