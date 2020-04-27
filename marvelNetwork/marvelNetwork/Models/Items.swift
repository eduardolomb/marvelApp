import Foundation

public struct Items : Codable {
	public let resourceURI : String?
	public let name : String?

	enum CodingKeys: String, CodingKey {

		case resourceURI
		case name
	}

	 public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		resourceURI = try values.decodeIfPresent(String.self, forKey: .resourceURI)
		name = try values.decodeIfPresent(String.self, forKey: .name)
	}

}
