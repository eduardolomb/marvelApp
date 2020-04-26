import Foundation

public struct Thumbnail : Codable {
	public let path : String?
	public let ext : String?

	enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
	}

	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		path = try values.decodeIfPresent(String.self, forKey: .path)
		ext = try values.decodeIfPresent(String.self, forKey: .ext)
	}

}
