//
//  Router.swift
//  ExpandableTableTask
//
//  Created by Ammar.M on 31/05/2023.
//

import Alamofire

enum Router: URLRequestConvertible {

    static var baseURL = "https://app.cheetahkw.com/"
    
    case getCountries
    
    var url: URL {
        switch self {
        case .getCountries:
            return URL(string: Router.baseURL + "api/areas/countries-with-cities-and-states")!
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getCountries:
            return .get
        }
    }
    
    var header: [String: Any]? {
        switch self {
        case .getCountries:
            return nil
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .getCountries:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.method = method
        return urlRequest
    }
    
}
