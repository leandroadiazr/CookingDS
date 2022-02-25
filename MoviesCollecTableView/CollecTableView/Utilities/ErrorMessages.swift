//
//  ErrorMessages.swift
//  GitFollowers
//
//  Created by Leandro Diaz on 7/27/20.
//  Copyright © 2020 Leandro Diaz. All rights reserved.
//

import Foundation

//conforming to the error protocol
enum ErrorMessage: String, Error {
    case invalidRequest          = "Invalid User Request, Please try Again..."
    case unableToComplete        = "Unable to Complete you Request, Please Check your Internet Connection"
    case invalidResponse         = "Invalid Request from the Server, Please try Again..."
    case invalidData             = "Data Received was Invalid"
    case unableToAddToFavorites  = "There was an error trying to add this user to favorites"
    case favoriteExist           = "This user is already in the favorites List"
}
