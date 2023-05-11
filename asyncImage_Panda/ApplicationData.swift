//
//  ApplicationData.swift
//  asyncImage_Panda
//
//  Created by Peter Deyi on 5/11/23.
//

import Foundation

@MainActor
class ApplicationData: ObservableObject {
    
    struct ReturnedData: Codable {
        var sample: [Panda]
    }
    
    @Published var urlString = "http://playgrounds-cdn.apple.com/assets/pandaData.json"
    
    @Published var pandas: [Panda] = []
    
    func getData() async {
        print("we are accessing the url \(urlString)")
        
        guard let url = URL(string: urlString) else {
            print("ERROR: Could not create a URL from \(urlString)")
            return
        }
        
        do {
            let(data, _) = try await
                URLSession.shared.data(from: url)
            
            //try to decode JSON data into our own data structures
            //use guard let to handle the error condition first
            guard let returnedData = try?
                JSONDecoder().decode(ReturnedData.self, from: data) else {
                print("ERROR: Could not decode returned JSON data")
                return
            }
            
            self.pandas = returnedData.sample
        } catch {
            print("ERROR: Could not use URL at \(urlString) to get data and response")
        }
    }
}

