////
////  Characters.swift
////  marvelNetwork
////
////  Created by Eduardo Lombardi on 19/04/20.
////  Copyright © 2020 Eduardo Lombardi. All rights reserved.
////
//
//import Foundation
//
//// MARK: - Characters
//public struct Characters: Codable {
//   public let code: Int
//   let status, copyright, attributionText, attributionHTML: String
//   let etag: String
//   public let data: DataClass
//}
//
//// MARK: - DataClass
//public struct DataClass: Codable {
//   public let offset, limit, total, count: Int
//   public let results: [Result]
//}
//
//// MARK: - Result
//public struct Result: Codable {
//    let id: Int
//   public let name, resultDescription: String
//    let modified: Date
//   public let thumbnail: Thumbnail
//    let resourceURI: String
//    let comics, series: Comics
//    let stories: Stories
//    let events: Comics
//    let urls: [URLElement]
//
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case resultDescription = "description"
//        case modified, thumbnail, resourceURI, comics, series, stories, events, urls
//    }
//}
//
//// MARK: - Comics
//struct Comics: Codable {
//    let available: Int
//    let collectionURI: String
//    let items: [ComicsItem]
//    let returned: Int
//}
//
//// MARK: - ComicsItem
//struct ComicsItem: Codable {
//    let resourceURI: String
//    let name: String
//}
//
//// MARK: - Stories
//struct Stories: Codable {
//    let available: Int
//    let collectionURI: String
//    let items: [StoriesItem]
//    let returned: Int
//}
//
//// MARK: - StoriesItem
//struct StoriesItem: Codable {
//    let resourceURI: String
//    let name: String
//    let type: ItemType
//}
//
//enum ItemType: String, Codable {
//    case cover = "cover"
//    case empty = ""
//    case interiorStory = "interiorStory"
//}
//
//// MARK: - Thumbnail
//public struct Thumbnail: Codable {
//    public let path: String
//    public let thumbnailExtension: Extension
//
//    enum CodingKeys: String, CodingKey {
//        case path
//        case thumbnailExtension = "extension"
//    }
//}
//
//public enum Extension: String, Codable {
//    case gif = "gif"
//    case jpg = "jpg"
//}
//
//// MARK: - URLElement
//struct URLElement: Codable {
//    let type: URLType
//    let url: String
//}
//
//enum URLType: String, Codable {
//    case comiclink = "comiclink"
//    case detail = "detail"
//    case wiki = "wiki"
//}
