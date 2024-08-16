//
//  ContentView.swift
//  Fetch API Swift
//
//  Created by Tony Gultom on 16/08/24.
//

import SwiftUI
import SwiftData

struct PhotosView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @State private var albums: [Album] = []
    
    
    
//    private func fetchRemoteData() {
//        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")!
//        
//        var request = URLRequest(url: url)
//        
//        request.httpMethod = "GET" //optional
//        
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        let task = URLSession.shared.dataTask(with: request){
//            data, response, error in
//            
//            if let error = error{
//                print("Error while fetching data: ", error)
//                
//                return
//            }
//            
//            guard let data = data else {
//                return
//            }
//            
//            do {
//                let decodedData = try JSONDecoder().decode([Album].self, from: data)
//                
//                self.albums = decodedData
//                
//                
//            } catch let jsonError{
//                print("failed to decode JSON", jsonError)
//            }
//        }
//        
//        
//        
//        task.resume()
//        /*
//         called to start the network request.
//         */
//    }
    
    
    private func fetchRemoteData() {
        RequestData.getData(requestUrl: "https://jsonplaceholder.typicode.com/photos", onSucceess: {(decodedData: [Album]) in self.albums = decodedData
        }, onFailed: {
            Error in print("error in here \(Error)")
        })
    }
    
    
    

    var body: some View {
        NavigationStack {
            List(albums) {
                album in 
                NavigationLink(destination: DetailAlbum(album: album)) {
                   ImageView(album: album)
                }
                }.scrollContentBackground(.hidden).background(.purple).navigationTitle("Photos").onAppear{
                    fetchRemoteData()
                }
                
               
        }
    }

    

    
}

#Preview {
    PhotosView()
        .modelContainer(for: Item.self, inMemory: true)
}
