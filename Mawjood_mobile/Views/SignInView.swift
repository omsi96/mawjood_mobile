//
//  AuthView.swift
//  Mawjood_mobile
//
//  Created by Omar Alibrahim on 24/07/2021.
//

import SwiftUI
import Alamofire
import SwiftyJSON


struct SignInView: View {
    @EnvironmentObject var env: NetworkEnv
    @State var userCredentials: UserCredential = UserCredential(email: "", password: "")
    var body: some View {
        VStack{
            TextField("email", text: $userCredentials.email)
                .padding()
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            SecureField("password", text: $userCredentials.password)
                .padding()
            Button("Sign in", action: signIn)
                .padding()
            NavigationLink("Don't have an account?", destination: SignUpView())
        }
        
    }
    
    func signIn(){
        env.signIn(userCredential: userCredentials) {_ in
            print("Signed in!")
        } fail: {
            print("Couldn't sign in!")
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .environmentObject(NetworkEnv())
    }
}
