//
//  Model.swift
//  CollecTableView
//
//  Created by Leandro Diaz on 12/2/20.
//

import Foundation

//struct Model: Codable {
//    var title: String
//    var releaseYear: String
//    var poster: String
//
//
//    enum CodingKeys: String, CodingKey {
//        case title = "Title"
//        case releaseYear = "Year"
//        case poster = "Poster"
//    }
//}


//struct Model: Codable {
//    let title, year, imdbID: String
//    let type: TypeEnum
//    let poster: String
//
//    enum CodingKeys: String, CodingKey {
//        case title = "Title"
//        case year = "Year"
//        case imdbID
//        case type = "Type"
//        case poster = "Poster"
//    }
//}
//
//enum TypeEnum: String, Codable {
//    case movie = "movie"
//    case series = "series"
//}


public struct Movies: Codable {
    let search: [Search]
    let totalResults, response: String

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

struct Search: Codable {
    var title, year, rated, released: String?
    var runtime, genre, director, writer: String?
    var actors, plot, language, country: String?
    var awards: String?
    var poster: String


    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"

    }
}
