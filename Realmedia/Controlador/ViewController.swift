//
//  ViewController.swift
//  Realmedia
//
//  Created by Gabriel Soto valenzuela on 2/23/19.
//  Copyright © 2019 Gabriel Soto valenzuela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getData()
    }
    func getData(){
        ServicioApi.getPeliculasOrdenadasTopRated{ (success, peliculaPopular, error) in
            DispatchQueue.main.async {
                if (success)
                {
                    
                    print("obtiene el json()")
                }
            }
        }
    }


}

