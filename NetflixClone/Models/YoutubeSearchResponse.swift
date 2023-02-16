//
//  YoutubeSearchResponse.swift
//  NetflixClone
//
//  Created by  Mukhammed Ali Khamzayev on 14.02.2023.
//

import Foundation

/*
 items =     (
             {
         etag = "6zLkJhnFU_KpuRaiW0O2n0gK8Yc";
         id =             {
             kind = "youtube#video";
             videoId = 7SNA8CxFeIM;
         };
         kind = "youtube#searchResult";
     },
 */
struct YoutubeSearchResponse: Codable{
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
