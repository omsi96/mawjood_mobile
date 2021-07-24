//
//  Router.swift
//  Mawjood_mobile
//
//  Created by Omar Alibrahim on 24/07/2021.
//

import SwiftUI

struct Router: View {
    @EnvironmentObject var env: NetworkEnv
    var body: some View {
        NavigationView{
            if(env.signed){
                TakeAttendanceView()
            }
            else{
                SignInView()
            }
        }
    }
}

struct Router_Previews: PreviewProvider {
    static var previews: some View {
        Router()
            .environmentObject(NetworkEnv())
    }
}
