//
//  ContentView.swift
//  Mawjood_mobile
//
//  Created by Omar Alibrahim on 24/07/2021.
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct TakeAttendanceView: View {
    @State var text: String = ""
    @State var status: String = ""
    @State var showAlert: Bool = false
    @EnvironmentObject var env: NetworkEnv
    var body: some View {
        VStack{
            Text("Type the class secret to get attended")
                .font(.title2)
                .bold()
            TextField("class secret", text: $text)
                .font(.largeTitle)
                .padding()
                .multilineTextAlignment(.center)
            
            Button("Submit", action: makeAttendanceRequest)
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Alert!"), message: Text(status), dismissButton: .cancel())
            })
        }
    }
    
    
    func makeAttendanceRequest(){
        env.attendSession(sessionSecret: text) { value in
            self.status = value as? String ?? "SUCCESS!"
            self.showAlert = true
            
        } fail: {
            self.status = "There is a problem connecting with the server please try again"
            self.showAlert = true
        }
    }
}

struct TakeAttendanceView_Previews: PreviewProvider {
    static var previews: some View {
        TakeAttendanceView()
            .environmentObject(NetworkEnv())
    }
}
