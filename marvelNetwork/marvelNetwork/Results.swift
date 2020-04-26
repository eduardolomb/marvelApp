import Foundation

public struct Results : Codable {
	public let id : Int?
	public let name : String?
	public let description : String?
	let modified : String?
	public let thumbnail : Thumbnail?
	let resourceURI : String?
	public let comics : Comics?
	public let series : Series?
	let stories : Stories?
	let events : Events?
	let urls : [Urls]?

	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		modified = try values.decodeIfPresent(String.self, forKey: .modified)
		thumbnail = try values.decodeIfPresent(Thumbnail.self, forKey: .thumbnail)
		resourceURI = try values.decodeIfPresent(String.self, forKey: .resourceURI)
		comics = try values.decodeIfPresent(Comics.self, forKey: .comics)
		series = try values.decodeIfPresent(Series.self, forKey: .series)
		stories = try values.decodeIfPresent(Stories.self, forKey: .stories)
		events = try values.decodeIfPresent(Events.self, forKey: .events)
		urls = try values.decodeIfPresent([Urls].self, forKey: .urls)
	}

}
