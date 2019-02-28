//
//  ViewController.swift
//  Realmedia
//
//  Created by Gabriel Soto valenzuela on 2/23/19.
//  Copyright © 2019 Gabriel Soto valenzuela. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    //var arrayPelicula: [PeliculaPopularAndTop]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getData()
    }
    func getData(){
        ServicioApi.getPeliculasOrdenadasTopRated{ (success, peliculaPopular, error) in
            DispatchQueue.main.async {
                if (success)
                {
                    if let pelicula = peliculaPopular{
                        //self.arrayPelicula = pelicula
                        //self.tablePeliculaPopular.reloadData()
                    }
                    print("obtiene el json()")
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1 //arrayPelicula.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellReuseId = "cellPeliculaTop"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as UITableViewCell
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }


}

