//
//  InteriewModel.swift
//  Categories-Interview-Task
//
//  Created by Rahul Sharma on 03/09/24.
//

import Foundation


struct MainModel: Codable {
    var slug : String?
    var name : String?
    var url: String?
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.slug = try container.decodeIfPresent(String.self, forKey: .slug)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
    }
}

typealias Welcome = [MainModel]


struct SecondAPIMainModel : Codable
{
    var products :[Productss]?
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.products = try container.decodeIfPresent([Productss].self, forKey: .products)
    }
}

struct Productss : Codable
{
    var title : String?
    var description : String?
    var category : String?
    var price : Double?
    var rating : Double?
    var thumbnail : String?
    var images : [String]?
    var reviews : [ReviewModel]?
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.category = try container.decodeIfPresent(String.self, forKey: .category)
        self.price = try container.decodeIfPresent(Double.self, forKey: .price)
        self.rating = try container.decodeIfPresent(Double.self, forKey: .rating)
        self.thumbnail = try container.decodeIfPresent(String.self, forKey: .thumbnail)
        self.images = try container.decodeIfPresent([String].self, forKey: .images)
        self.reviews = try container.decodeIfPresent([ReviewModel].self, forKey: .reviews)
    }
}

struct ReviewModel : Codable
{
    var rating : Double?
    var comment : String?
    var date : String?
    var reviewerName : String?
    var reviewerEmail : String?
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.rating = try container.decodeIfPresent(Double.self, forKey: .rating)
        self.comment = try container.decodeIfPresent(String.self, forKey: .comment)
        self.date = try container.decodeIfPresent(String.self, forKey: .date)
        self.reviewerName = try container.decodeIfPresent(String.self, forKey: .reviewerName)
        self.reviewerEmail = try container.decodeIfPresent(String.self, forKey: .reviewerEmail)
    }
}


enum ProductDetailsCellType : Int,CaseIterable
{
    case productImages = 0
    case productDescription
    case productReviews
    

}
