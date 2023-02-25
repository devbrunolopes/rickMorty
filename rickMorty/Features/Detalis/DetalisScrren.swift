//
//  DetalisScrren.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 2/25/23.
//

import UIKit

class DetalisScrren: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Extension ViewCode

extension DetalisScrren: ViewCode {
    func configElements() {
        
    }
    
    func configConstraint() {
        
    }
    
    
}
