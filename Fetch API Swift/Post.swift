//
//  Post.swift
//  Fetch API Swift
//
//  Created by Tony Gultom on 16/08/24.
//

import Foundation

/*
 Codable protocol is a type alias for Encodable and Decodable protocols. Encodable protocol is used to convert data into external representation such as JSON whereas Decodable protocol is used to convert external representation data into the data that we need.
 */

class Post: Identifiable, Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
