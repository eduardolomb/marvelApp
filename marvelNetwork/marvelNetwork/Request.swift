//
//  Request.swift
//  marvelNetwork
//
//  Created by Eduardo Lombardi on 19/04/20.
//  Copyright © 2020 Eduardo Lombardi. All rights reserved.
//

import Foundation
import CommonCrypto

public class Request {

// MARK: - Proprierties and initializers
private let limit = 20
public var offset = 10
public typealias CompletionHandler = (_ success:Characters) -> Void
public typealias ComicsCompletionHandler = (_ success:ComicsObj) -> Void
public init() {}
let apiKey = "757948084785697b972e93938cc60c53"
let apiPrivateKey = "2c2a89b239fc9feac42d2c9ab49a335dd4d5ea3e"
public var seriesUrl = String()
/***** ***** ***** *****/
    
    
// MARK: - request Methods
public func request(completionHandler: @escaping CompletionHandler) -> (Int, String) {
  guard let url = URL(string: "https://gateway.marvel.com:443/v1/public/characters?orderBy=name&limit=\(limit)&offset=\(offset)&\(generateHash())") else { return (0, "could not unpack url") }
         URLSession.shared.dataTask(with: url) { (data, response
             , error) in
             guard let data = data else { return }
             do {
                print("JSON String: \(String(data: data, encoding: .utf8))")
                 let decoder = JSONDecoder()
                 let charactersData = try decoder.decode(Characters.self, from: data)
                completionHandler(charactersData)
                
             } catch let err {
                 print("Error", err)
             }
             }.resume()
        return (0, "could not unpack data")
    }
    
    public func requestSeries(completionHandler: @escaping ComicsCompletionHandler) -> (Int, String) {
    guard let url = URL(string: "\(seriesUrl)?\(generateHash())") else { return (0, "could not unpack url") }
           URLSession.shared.dataTask(with: url) { (data, response
               , error) in
               guard let data = data else { return }
               do {
                  print("JSON String: \(String(data: data, encoding: .utf8))")
                   let decoder = JSONDecoder()
                   let comicsData = try decoder.decode(ComicsObj.self, from: data)
                   completionHandler(comicsData)
                  
               } catch let err {
                   print("Error", err)
               }
               }.resume()
          return (0, "could not unpack data")
      }
    
    func generateHash() -> String {
     let timestamp = "1"
     let md5 = "\(timestamp)\(apiPrivateKey)\(apiKey)".MD5() ?? ""
     return "ts=\(timestamp)&apikey=\(apiKey)&hash=\(md5)"
    }
}

extension String {
    func MD5() -> String? {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        var digest = [UInt8](repeating: 0, count: length)
        if let d = self.data(using: .utf8) {
            _ = d.withUnsafeBytes { body -> String in
                CC_MD5(body.baseAddress, CC_LONG(d.count), &digest)
                return ""
            }
        }
        return (0..<length).reduce("") {
            $0 + String(format: "%02x", digest[$1])
        }
}

}
