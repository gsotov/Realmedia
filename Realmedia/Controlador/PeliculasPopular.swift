//
//  PeliculasPopular.swift
//  Realmedia
//
//  Created by Gabriel Soto valenzuela on 2/23/19.
//  Copyright © 2019 Gabriel Soto valenzuela. All rights reserved.
//

import Foundation
import UIKit

class PeliculasPopular: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getData()
    }
    func getData(){
        ServicioApi.getPeliculasOrdenadasPopular { (success, peliculaPopular, error) in
            DispatchQueue.main.async {
                if (success)
                {
                    
                    print("obtiene el json()")
                }
            }
        }
    }
    
}
