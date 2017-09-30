//
//  Post.swift
//  MDB Socials
//
//  Created by Sam Rai on 9/28/17.
//  Copyright © 2017 Samanvi Rai. All rights reserved.
//
import Foundation
import UIKit
import Firebase

class Post {

    var text: String?
    var imageUrl: String?
    var posterId: String?
    var poster: String?
    var id: String?
    
    init(id: String, postDict: [String:Any]?) {
        self.id = id
        if postDict != nil {
            if let text = postDict!["text"] as? String {
                self.text = text
            }
            if let imageUrl = postDict!["imageUrl"] as? String {
                self.imageUrl = imageUrl
            }
            if let posterId = postDict!["posterId"] as? String {
                self.posterId = posterId
            }
            if let poster = postDict!["poster"] as? String {
                self.poster = poster
            }
        }
    }
    init() {
        self.text = "Deloitte recruitting interviews will be held on campus in room 215"
        self.imageUrl = "https://cmgajcmusic.files.wordpress.com/2016/06/kanye-west2.jpg"
        self.id = "1"
        self.poster = "Bryan Robbins"
    }
}
