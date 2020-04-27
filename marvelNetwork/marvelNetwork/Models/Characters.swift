import Foundation

public struct Characters : Codable {
	let code : Int?
	let status : String?
	let copyright : String?
	let attributionText : String?
	let attributionHTML : String?
	let etag : String?
    public let data : Data?

	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		code = try values.decodeIfPresent(Int.self, forKey: .code)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
		attributionText = try values.decodeIfPresent(String.self, forKey: .attributionText)
		attributionHTML = try values.decodeIfPresent(String.self, forKey: .attributionHTML)
		etag = try values.decodeIfPresent(String.self, forKey: .etag)
		data = try values.decodeIfPresent(Data.self, forKey: .data)
	}

}
