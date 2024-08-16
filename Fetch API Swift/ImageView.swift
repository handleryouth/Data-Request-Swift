//
//  ImageView.swift
//  Fetch API Swift
//
//  Created by Tony Gultom on 16/08/24.
//

import SwiftUI

struct ImageView: View {
    let album: Album
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "\(album.url)")){
                phase in
                switch phase {
                case .failure: Image(systemName: "photo").font(.largeTitle)
                case .success(let image): image.resizable()
                default: ProgressView()
                }
            }.frame(width: 150, height: 150).clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, content: {
                Text("\(album.id)").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text(album.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title3)
            })
        }
    }
}

#Preview {
    ImageView(album: Album.example)
}
