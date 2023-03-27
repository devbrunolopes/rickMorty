//
//  HomeViewModel.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 2/21/23.
//

import UIKit

class HomeViewModel: UIViewController {

    var data: [Result] = [
//        PopularView(name: "Nome: Franklin", status: "Status: Vivo", specie: "Specie: Humano", localizion: "Localização: PlanetaTerra", image: ""),
//        PopularView(name: "Nome: Morty Smith", status: "Status: Vivo", specie: "Specie: Humano", localizion: "Localização: PlanetaTerra", image: ""),
//        PopularView(name: "Nome: Rick Sanchez", status: "Status: Vivo", specie: "Specie: Humano", localizion: "Localização: PlanetaTerra", image: ""),
//        PopularView(name: "Nome: Squanchy", status: "Status: Vivo", specie: "Specie: Humano", localizion: "Localização: PlanetaTerra", image: ""),
//        PopularView(name: "Nome: Arthiricia", status: "Status: Vivo", specie: "Specie: Humano", localizion: "Localização: PlanetaTerra", image: ""),
//        PopularView(name: "Nome: Sleepy Gary", status: "Status: Vivo", specie: "Specie: Humano", localizion: "Localização: PlanetaTerra", image: ""),
//        PopularView(name: "Nome: Birdperson", status: "Status: Vivo", specie: "Specie: Humano", localizion: "Localização: PlanetaTerra", image: "")
    ]
    
    var numberOfRowsInSection: Int{
        return data.count
    }
}
