//
// Pet.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class Pet: Codable {

    public enum Status: String, Codable { 
        case available = "available"
        case pending = "pending"
        case sold = "sold"
    }
    public var id: Int64?
    public var idNum: NSNumber? {
        get {
            return id.map({ return NSNumber(value: $0) })
        }
    }
    public var category: Category?
    public var name: String
    public var photoUrls: [String]
    public var tags: [Tag]?
    /** pet status in the store */
    public var status: Status?


    public init(id: Int64?, category: Category?, name: String, photoUrls: [String], tags: [Tag]?, status: Status?) {
        self.id = id
        self.category = category
        self.name = name
        self.photoUrls = photoUrls
        self.tags = tags
        self.status = status
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(id, forKey: "id")
        try container.encodeIfPresent(category, forKey: "category")
        try container.encode(name, forKey: "name")
        try container.encodeArray(photoUrls, forKey: "photoUrls")
        try container.encodeArrayIfPresent(tags, forKey: "tags")
        try container.encodeIfPresent(status, forKey: "status")
    }

    // Decodable protocol methods

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        id = try container.decodeIfPresent(Int64.self, forKey: "id")
        category = try container.decodeIfPresent(Category.self, forKey: "category")
        name = try container.decode(String.self, forKey: "name")
        photoUrls = try container.decodeArray(String.self, forKey: "photoUrls")
        tags = try container.decodeArrayIfPresent(Tag.self, forKey: "tags")
        status = try container.decodeIfPresent(String.self, forKey: "status")
    }
}
