//
//  PostData.swift
//  Hakcer News
//
//  Created by PhuongDo on 30/07/2023.
//

import Foundation

struct Results: Decodable{
    let hits: [Post]
}

struct Post: Decodable, Identifiable{
    var id: String{
        return objectID  //id == objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
