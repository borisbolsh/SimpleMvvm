//
//  ViewData.swift
//  SimpleMvvm
//
//  Created by Boris Bolshakov on 27.12.21.
//

import Foundation

enum ViewData {
    case initial
    case loading(Data)
    case success(Data)
    case faillure(Data)
    
    struct Data {
        let icon: String?
        let title: String?
        let description: String?
        let numberPhone: String?
    }
}
