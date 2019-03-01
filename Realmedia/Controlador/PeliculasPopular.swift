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
        
    @IBOutlet weak var tablaPopular: UITableView!

    
    var peliculasTopArray = [PeliculaPopular]()
    var editarUsuario : PeliculaPopular!
    
    var path: NSString?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablaPopular.delegate = self
        tablaPopular.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
        getData()
    }
    
    func getData(){
        ServicioApi.getPeliculasOrdenadasPopular{
            (peliculasTop) in
            
            if let pTop = peliculasTop {
                self.peliculasTopArray = pTop
                self.tablaPopular.reloadData()
                print("count peliculas ", self.peliculasTopArray.count)
                
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return peliculasTopArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellReuseId = "cellPelPopular"
        let pelPopular = peliculasTopArray[(indexPath as NSIndexPath).row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as UITableViewCell

        let s = String(describing: pelPopular.title)
        cell.textLabel?.text = s
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //let userIdentityString : NSString? = peliculasTopArray[indexPath.row].poster_path
        self.performSegue(withIdentifier: "segue1", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue1"{
            if let id = tablaPopular.indexPathForSelectedRow
            {
                let fila = peliculasTopArray[id.row]
                
                let controller = segue.destination as! DetallePelicula
                controller.poster_path = fila.poster_path
                controller.overview = fila.overview
                
                if let index = self.tablaPopular.indexPathForSelectedRow
                {
                    self.tablaPopular.deselectRow(at: index, animated: true)
                }
                
            }
        }
    }
    
}
