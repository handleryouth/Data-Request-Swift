//
//  RequestData.swift
//  Fetch API Swift
//
//  Created by Tony Gultom on 16/08/24.
//

import Foundation


class RequestData {
    
    
    static func getData<T: Decodable>(requestUrl: String,
                                onSucceess: @escaping (T) -> Void,
                                onFailed: @escaping (Error) -> Void) {
        
        let url = URL(string: requestUrl)!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET" //optional
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request){
            data, response, error in
            
            if let error = error{
                print("Error while fetching data: ", error)
                onFailed(error)
                
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                
                onSucceess(decodedData)
                
            } catch let jsonError{
                print("failed to decode JSON", jsonError)
            }
        }
        
        task.resume()
    }
    
    
}
