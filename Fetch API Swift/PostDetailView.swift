//
//  PostDetailView.swift
//  Fetch API Swift
//
//  Created by Tony Gultom on 16/08/24.
//

import SwiftUI

struct PostDetailView: View {
    
    let id: String
    
    @State private var post: Post?
    
    private func fetchRemoteData() {
        RequestData.getData(requestUrl: "https://jsonplaceholder.typicode.com/posts/\(id)", onSucceess: {(decodedData: Post) in
            
            self.post = decodedData
           
        
        }, onFailed: {
            Error in print("error in here \(Error)")
        })
    }
    
    
    
    var body: some View {
        if let post = post {
            VStack(spacing: 20) {
                Text("\(post.id)").font(.largeTitle).bold()
                Text(post.title).multilineTextAlignment(.center).bold().font(.largeTitle)
                Text(post.body).multilineTextAlignment(.center)
            }
        } else {
            ProgressView().onAppear(perform: {
                fetchRemoteData()
            })
        }
        
    }
}

#Preview {
    PostDetailView(id: "1")
}
