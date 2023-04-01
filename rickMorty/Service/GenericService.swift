//
//  GenericService.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 3/27/23.
//

import Foundation

protocol GenericService: AnyObject {
    typealias completion <T> = (_ result : T, _ failure: Error?) -> Void
}
