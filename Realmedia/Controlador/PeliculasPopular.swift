//
//  PeliculasPopular.swift
//  Realmedia
//
//  Created by Gabriel Soto valenzuela on 2/23/19.
//  Copyright © 2019 Gabriel Soto valenzuela. All rights reserved.
//

import Foundation
import UIKit

class PeliculasPopular: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tablaPeliculaPopular: UITableView!
    @IBOutlet weak var imageLista: UIImageView!
    @IBOutlet weak var labelLista: UILabel!
    
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellReuseId = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as UITableViewCell
        cell.textLabel?.text = "golaaa"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
}
