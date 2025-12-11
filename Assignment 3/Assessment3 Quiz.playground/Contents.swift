import Foundation

protocol Endpoint {
 var path: String { get }
 var method: String { get }
 var headers: [String: String]? { get }
}

enum UserEndpoint: Endpoint {
 case getUser(id: String)
 
 var path: String {
  switch self {
  case .getUser(let id):
   return "/users/\(id)"
  }
 }
 
 var method: String { "GET" }
 
 var headers: [String : String]? {
  return ["Content-Type": "application/json"]
 }
}
