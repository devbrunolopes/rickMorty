//
//  ViewCode.swift
//  rickAndMorty
//
//  Created by Franklin  Stilhano on 2/2/23.
//

import Foundation

protocol ViewCode{
    func configElements()
    func configConstraint()
}

extension ViewCode {
    func setupViewCode(){
        configElements()
        configConstraint()
    }
}
