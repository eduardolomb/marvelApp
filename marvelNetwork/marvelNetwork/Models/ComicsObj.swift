

import Foundation
public struct ComicsObj: Codable {
	let code : Int?
	let status : String?
	let copyright : String?
	let attributionText : String?
	let attributionHTML : String?
	let etag : String?
	public let data : ComicsData?

	enum CodingKeys: String, CodingKey {

		case code = "code"
		case status = "status"
		case copyright = "copyright"
		case attributionText = "attributionText"
		case attributionHTML = "attributionHTML"
		case etag = "etag"
		case data = "data"
	}

	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		code = try values.decodeIfPresent(Int.self, forKey: .code)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
		attributionText = try values.decodeIfPresent(String.self, forKey: .attributionText)
		attributionHTML = try values.decodeIfPresent(String.self, forKey: .attributionHTML)
		etag = try values.decodeIfPresent(String.self, forKey: .etag)
		data = try values.decodeIfPresent(ComicsData.self, forKey: .data)
	}

}
