//
//  AuthEnv.swift
//  Mawjood_mobile
//
//  Created by Omar Alibrahim on 24/07/2021.
//

import SwiftUI
import Alamofire
import SwiftyJSON



class NetworkEnv: ObservableObject{
    @Published var signed: Bool = false
    let path = "http://localhost:8000"
    @Published var userId = ""
    func signIn(userCredential: UserCredential, success: @escaping (Any) -> (), fail: @escaping () -> ()){
        let parameters: [String: Any] = [
            "username": userCredential.email,
            "password": userCredential.password,
            "userType": "student"
        ]
        
        AF.request(
            "\(path)/account/login",
            method: .post,
            parameters: parameters
        )
        .validate()
        .responseData { response in
            switch response.result{
            case .success(let data):
                let json = JSON(data)
                print("SUCCESS", json.debugDescription)
                self.userId = json["user"]["id"].stringValue
                success(json)
                self.signed = true
            case .failure(let error):
                fail()
                print("FAIL!", error.localizedDescription)
//                self.status = "There is a problem connecting with the server please try again"
//                self.showAlert = true
            }
        }
    }
    
    func signUp(name: String, userCredential: UserCredential, success: @escaping (Any) -> (), fail: @escaping () -> ()){
        let parameters: [String: Any] = [
            "username": userCredential.email,
            "password": userCredential.password,
            "name": name,
            "userType": "student"
        ]
        
        AF.request(
            "\(path)/account/register",
            method: .post,
            parameters: parameters
        )
        .validate()
        .responseData { response in
            switch response.result{
            case .success(let data):
                let json = JSON(data)
                print("SUCCESS", json.debugDescription)
                success(json)
            case .failure(let error):
                fail()
                print("FAIL!", error.localizedDescription)
//                self.status = "There is a problem connecting with the server please try again"
//                self.showAlert = true
            }
        }

    }
    
    func attendSession(sessionSecret: String, success: @escaping (Any) -> (), fail: @escaping () -> ()){
        
        let parameters: [String: Any] = [
            "studentId": userId,
            "classSecret": sessionSecret,
        ]
        
        AF.request(
            "\(path)/attendance/attendstudent",
            method: .post,
            parameters: parameters
        )
        .validate()
        .responseData { response in
            switch response.result{
            case .success(let data):
                let json = JSON(data)
                print("SUCESS", json.debugDescription)
                success(json)
            case .failure(let error):
                fail()
                print("FAIL!", error.localizedDescription)
//                self.status = "There is a problem connecting with the server please try again"
//                self.showAlert = true
            }
        }
    }
}
