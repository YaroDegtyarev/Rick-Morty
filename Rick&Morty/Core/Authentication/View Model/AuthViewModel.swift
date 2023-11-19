//
//  AuthViewModel.swift
//  Rick&Morty
//
//  Created by Ярослав Дегтярев on 17.11.2023.
//

import Foundation

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}
@MainActor
class AuthViewModel: ObservableObject {

    @Published var currentUser: User?
    @Published var validatePassword: Bool
    @Published var successSignUp: Bool


    
    init() {
        self.validatePassword = false
        self.successSignUp = false
        self.currentUser = nil
    }
   
    // SignIN
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let data = try KeychainManager.getPassword(for: email)
            let pass = String(
                decoding: data ?? Data(),
                as: UTF8.self)
            if password == pass {
               validatePassword = true
            } else {
                print("no")
            }
        } catch {
            print(error)
        }
        let savedName: String = UserDefaults.standard.string(forKey: email) ?? ""
        currentUser = User(fullName: savedName, email: email)
      
    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            try KeychainManager.save(
                email: email,
                password: password.data(using: .utf8) ?? Data())
        } catch {
            print(error)
        }
                UserDefaults.standard.set(fullname, forKey: email)
          
    }
    
    func signOut() {
        do {
            self.validatePassword = false
            self.currentUser = nil
        }
    }
}
