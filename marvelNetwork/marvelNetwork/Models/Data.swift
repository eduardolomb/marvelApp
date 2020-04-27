import Foundation

public struct Data : Codable {
	let offset : Int?
	public let limit : Int?
	let total : Int?
	let count : Int?
    public let results : [Results]?

public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		offset = try values.decodeIfPresent(Int.self, forKey: .offset)
		limit = try values.decodeIfPresent(Int.self, forKey: .limit)
		total = try values.decodeIfPresent(Int.self, forKey: .total)
		count = try values.decodeIfPresent(Int.self, forKey: .count)
		results = try values.decodeIfPresent([Results].self, forKey: .results)
	}

}
