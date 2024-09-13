//
//  ApiService.swift
//  TaskManagementApplication
//
//  Created by Sarthak Agrawal on 12/09/24.
//

import Foundation
import Alamofire

class APIService {
    
    static let shared = APIService()
    
    func signUpUser(parameters: [String: Any], completion: @escaping (Result<User, AFError>) -> Void) {
        let url = Constants.baseUrl + Constants.signinUrl
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: User.self) { response in
                switch response.result{
                case .success(let user):
                    print(user)
                    completion(.success(user))
                case .failure(let error):
                    print(error)
                    completion(.failure(error))
                }
            }
    }
    
    func login(parameters:[String:Any], completion: @escaping (Result<LoginResponse, AFError>) -> Void) {
        let url = Constants.baseUrl + Constants.loginUrl
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: LoginResponse.self) { response in
//                switch response.result{
//                case .success(let loginResponse):
//                    print(loginResponse)
//                case .failure(let error):
//                    print(error)
//                }
                completion(response.result)
            }
    }
    
    func fetchTask(userRole: String, token: String, completion: @escaping (Result<[Task], AFError>) -> Void){
        let url = Constants.baseUrl+userRole+Constants.getTaskUrl
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        
        AF.request(url,method: .get, headers: headers)
            .responseDecodable(of: [Task].self) { response in
                switch response.result{
                case .success(let tasks):
                    print(tasks.count)
                case .failure(let error):
                    print(error)
                }
                completion(response.result)
            }
    }
}
