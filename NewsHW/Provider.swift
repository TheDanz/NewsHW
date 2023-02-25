import Moya
import Foundation

enum Provider {
    static private let APIKey = "bb930147941848c19546fa9834523a19"
    
    case everything(topic: String, language: String)
}

extension Provider: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://newsapi.org/v2")!
    }
    
    var path: String {
        switch self {
        case .everything:
            return "/everything"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .everything(_,_):
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .everything(let topic, let language):
            return .requestParameters(parameters: ["q" : topic, "language" : language, "apiKey" : Provider.APIKey], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
