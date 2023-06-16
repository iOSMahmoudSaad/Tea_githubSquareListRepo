//
//  APIService.swift
//  Tea_githubSquareListRepo
//
//  Created by Mahmoud Saad on 15/06/2023.
//

import Foundation

class APIService {
    
    static let sharedService = APIService()
    
    func getSquareRepso(completion:@escaping(_ squares :[Square]?,_ error:Error?) -> Void){
        
        guard let url = URL(string: "https://api.github.com/orgs/square/repos") else {return}
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { data, response, error in
            guard error == nil else {return}
            
            guard let data = data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode([Square].self, from: data)
                debugPrint(response)
                completion(response, nil)
                
            }
            catch {
                debugPrint(error.localizedDescription)
                completion(nil, error)
            }
            
        }
        task.resume()
        
        
    }
}
