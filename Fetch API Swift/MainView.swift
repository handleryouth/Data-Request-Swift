//
//  MainView.swift
//  Fetch API Swift
//
//  Created by Tony Gultom on 16/08/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            PhotosView().tabItem {
                Label("Photo", systemImage: "photo.artframe")
            }
            
            PostView().tabItem { Label("Posts", systemImage: "signpost.left.fill") }
            
            
        }
    }
}

#Preview {
    MainView()
}
