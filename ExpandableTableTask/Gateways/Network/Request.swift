//
//  Request.swift
//  ExpandableTableTask
//
//  Created by Ammar.M on 31/05/2023.
//

import Alamofire

class Request {
    
    func sendRequest<T: Decodable>(_ router: Router, success: @escaping(T) -> Void, failure: @escaping(Error?) -> Void) {
        
        if !Connectivity.isConnectedToInternet() {
            print("Please check your internet connection")
        } else {
            AF.request(router).responseDecodable(of: T.self) { (response) in
                print(response.debugDescription)
                switch response.result {
                case .success(let result):
                    success(result)
                case .failure(let error):
                    print(error)
                    failure(error)
                }
            }
        }
    }
}

class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
