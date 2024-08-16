//
//  PostView.swift
//  Fetch API Swift
//
//  Created by Tony Gultom on 16/08/24.
//

import SwiftUI

struct PostView: View {
    
    
    @State private var posts = [Post]()
    
    private func fetchRemoteData() {
        RequestData.getData(requestUrl: "https://jsonplaceholder.typicode.com/posts", onSucceess: {(decodedData: [Post]) in
            
            self.posts = decodedData
           
            
        
        }, onFailed: {
            Error in print("error in here \(Error)")
        })
    }
    

    
    var body: some View {
        NavigationStack {
            List(posts) { post in
                NavigationLink(destination: PostDetailView(id: "\(post.id)")) {
                    VStack {
                        Text(post.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).multilineTextAlignment(.center).padding()
                        Text(post.body)
                            .multilineTextAlignment(.center)
                    }.padding(.vertical, 50)
                }
            }
            .navigationTitle("Posts")
        }.onAppear{
            fetchRemoteData()
        }
       
    }
}

#Preview {
    PostView()
}
