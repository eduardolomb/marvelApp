
/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
public struct ComicsResults : Codable {
	let id : Int?
	let digitalId : Int?
	let title : String?
	let issueNumber : Int?
	let variantDescription : String?
	let description : String?
	let modified : String?
	let isbn : String?
	let upc : String?
	let diamondCode : String?
	let ean : String?
	let issn : String?
	let format : String?
	let pageCount : Int?
	let textObjects : [String]?
	let resourceURI : String?
	let urls : [Urls]?
	let series : Series?
	let variants : [Variants]?
	let collections : [String]?
	let collectedIssues : [String]?
	let dates : [Dates]?
	let prices : [Prices]?
	public let thumbnail : Thumbnail?
	let images : [String]?
	let creators : Creators?
	let characters : Characters?
	let stories : Stories?
	let events : Events?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case digitalId = "digitalId"
		case title = "title"
		case issueNumber = "issueNumber"
		case variantDescription = "variantDescription"
		case description = "description"
		case modified = "modified"
		case isbn = "isbn"
		case upc = "upc"
		case diamondCode = "diamondCode"
		case ean = "ean"
		case issn = "issn"
		case format = "format"
		case pageCount = "pageCount"
		case textObjects = "textObjects"
		case resourceURI = "resourceURI"
		case urls = "urls"
		case series = "series"
		case variants = "variants"
		case collections = "collections"
		case collectedIssues = "collectedIssues"
		case dates = "dates"
		case prices = "prices"
		case thumbnail = "thumbnail"
		case images = "images"
		case creators = "creators"
		case characters = "characters"
		case stories = "stories"
		case events = "events"
	}

	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		digitalId = try values.decodeIfPresent(Int.self, forKey: .digitalId)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		issueNumber = try values.decodeIfPresent(Int.self, forKey: .issueNumber)
		variantDescription = try values.decodeIfPresent(String.self, forKey: .variantDescription)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		modified = try values.decodeIfPresent(String.self, forKey: .modified)
		isbn = try values.decodeIfPresent(String.self, forKey: .isbn)
		upc = try values.decodeIfPresent(String.self, forKey: .upc)
		diamondCode = try values.decodeIfPresent(String.self, forKey: .diamondCode)
		ean = try values.decodeIfPresent(String.self, forKey: .ean)
		issn = try values.decodeIfPresent(String.self, forKey: .issn)
		format = try values.decodeIfPresent(String.self, forKey: .format)
		pageCount = try values.decodeIfPresent(Int.self, forKey: .pageCount)
		textObjects = try values.decodeIfPresent([String].self, forKey: .textObjects)
		resourceURI = try values.decodeIfPresent(String.self, forKey: .resourceURI)
		urls = try values.decodeIfPresent([Urls].self, forKey: .urls)
		series = try values.decodeIfPresent(Series.self, forKey: .series)
		variants = try values.decodeIfPresent([Variants].self, forKey: .variants)
		collections = try values.decodeIfPresent([String].self, forKey: .collections)
		collectedIssues = try values.decodeIfPresent([String].self, forKey: .collectedIssues)
		dates = try values.decodeIfPresent([Dates].self, forKey: .dates)
		prices = try values.decodeIfPresent([Prices].self, forKey: .prices)
		thumbnail = try values.decodeIfPresent(Thumbnail.self, forKey: .thumbnail)
		images = try values.decodeIfPresent([String].self, forKey: .images)
		creators = try values.decodeIfPresent(Creators.self, forKey: .creators)
		characters = try values.decodeIfPresent(Characters.self, forKey: .characters)
		stories = try values.decodeIfPresent(Stories.self, forKey: .stories)
		events = try values.decodeIfPresent(Events.self, forKey: .events)
	}

}
