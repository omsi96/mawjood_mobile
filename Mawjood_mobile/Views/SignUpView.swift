//
//  AuthView.swift
//  Mawjood_mobile
//
//  Created by Omar Alibrahim on 24/07/2021.
//

import SwiftUI
import Alamofire
import SwiftyJSON


struct SignUpView: View {
    @EnvironmentObject var env: NetworkEnv
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State var showAlert = false
    @State var alertMessage = ""
    
    var body: some View {
        VStack{
            TextField("email", text: $email)
                .padding()
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            TextField("name", text: $name).padding()
            SecureField("password", text: $password).padding()
            SecureField("confirm password", text: $confirmPassword).padding()
            Button("Sign up", action: signUp).padding()
            
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Opps"), message: Text(alertMessage), dismissButton: .cancel())
        })
        
    }
    
    func signUp(){
        env.signUp(name: name, userCredential: UserCredential(email: email, password: password)) { Data in
            env.signed = true
        } fail: {
            alertMessage = "Couldn't sign up!"
            showAlert = true
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(NetworkEnv())
    }
}
