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
        print("Saved \(name)'s details")
    }
    
    func sendWelcomeEmail() {
        print("Sent email to \(email)")
    }
}


let manager = BadUserManager(name: "Steve Jobs", email: "stevejobs@apple.com")
manager.saveUserDetails()
manager.sendWelcomeEmail()

///
/// Good Example
///
///  In BetterUserManager, you got

class BetterUserManager {
    var user: User
    var communicationManager: CommunicationManagerProtcool
    var persistanceManager: PersistanceManagerProtocol
    
    init(user: User,
         communicationManager: CommunicationManagerProtcool = CommunicationManager(),
         persistanceManager: PersistanceManagerProtocol = PersistanceManager()) {
        self.user = user
        self.communicationManager = communicationManager
        self.persistanceManager = persistanceManager
    }
    
    func sendWelcomeEmail() {
        communicationManager.sendEmail(user: user)
    }
    
    func saveUserDeatils() {
        persistanceManager.saveCustomer(user: user)
    }
}


class User {
    var name: String
    var email: String
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
}


protocol CommunicationManagerProtcool {
    func sendEmail(user: User)
}

protocol PersistanceManagerProtocol {
    func saveCustomer(user: User)
}

class CommunicationManager: CommunicationManagerProtcool {
    
    func sendEmail(user: User) {
        print("Sent email to \(user.email)")
    }
}

class PersistanceManager: PersistanceManagerProtocol {

    func saveCustomer(user: User) {
        print("Saved \(user.name)'s details")
    }
}

let user = User(name: "Tim Cook", email: "timcook@apple.com")

let betterUserManager = BetterUserManager(user: user)
betterUserManager.saveUserDeatils()
betterUserManager.sendWelcomeEmail()
//: [Next](@next)
