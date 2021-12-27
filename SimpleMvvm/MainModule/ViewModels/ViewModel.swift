//
//  ViewModel.swift
//  SimpleMvvm
//
//  Created by Boris Bolshakov on 27.12.21.
//

import Foundation

protocol MainViewModelProtocol {
    var updateViewData: ((ViewData) -> ())? { get set }
    func startFetch()
}

final class MainViewModel: MainViewModelProtocol {
    var updateViewData: ((ViewData) -> ())?
    
    init() {
        updateViewData?(.initial)
    }
    
    func startFetch() {
        updateViewData?(
            .loading(ViewData.Data(icon: nil,
                                   title: nil,
                                   description: nil,
                                   numberPhone: nil))
        )
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.updateViewData?(.success(ViewData.Data(icon: "success",
                                                         title: "success",
                                                         description: "good data",
                                                         numberPhone: nil)))
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            self?.updateViewData?(.faillure(ViewData.Data(icon: "not success",
                                                          title: "not success",
                                                          description: "bad data",
                                                          numberPhone: nil)))
            
        }
        
        
    }
}
