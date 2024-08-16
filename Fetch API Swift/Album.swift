//
//  Album.swift
//  Fetch API Swift
//
//  Created by Tony Gultom on 16/08/24.
//

import Foundation



/*
 Codable protocol is a type alias for Encodable and Decodable protocols. Encodable protocol is used to convert data into external representation such as JSON whereas Decodable protocol is used to convert external representation data into the data that we need.
 */
struct Album: Identifiable,  Codable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
    
    
    static let example = Album(
    albumId: 1, id: 2, title: "lorem ipsum", url: "#", thumbnailUrl: "#")
}
