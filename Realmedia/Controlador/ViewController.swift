//
//  ViewController.swift
//  Realmedia
//
//  Created by Gabriel Soto valenzuela on 2/23/19.
//  Copyright © 2019 Gabriel Soto valenzuela. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var tablaTop: UITableView!
    var peliculaTopRaderArray = [PeliculaTopRader]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tablaTop.delegate = self
        tablaTop.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
        getData()
    }
    func getData(){
        ServicioApi.getPeliculasOrdenadasTopRated{
            (peliculasTopRader) in
            
            if let pTopRader = peliculasTopRader {
                self.peliculaTopRaderArray = pTopRader
                self.tablaTop.reloadData()
                print("count peliculas ", self.peliculaTopRaderArray.count)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return peliculaTopRaderArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellReuseId = "cellTopRader"
        let peliTopRader = peliculaTopRaderArray[(indexPath as NSIndexPath).row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as UITableViewCell
                
        let s = String(describing: peliTopRader.title)
        cell.textLabel?.text = s
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let userIdentityString : NSString? = peliculaTopRaderArray[indexPath.row].poster_path
        
        self.performSegue(withIdentifier: "segue2", sender: userIdentityString)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue2"
//        {
//            let vc = segue.destination as! PeliculasPopular
//            vc.path = "" as NSString
//
//        }
        {
            if let id = tablaTop.indexPathForSelectedRow
            {
                let fila = peliculaTopRaderArray[id.row]
                let destino = segue.destination as! DetallePelicula
                destino.poster_path = fila.poster_path
                destino.overview = fila.overview
                
                if let index = self.tablaTop.indexPathForSelectedRow
                {
                    self.tablaTop.deselectRow(at: index, animated: true)
                }
                
            }
        }
    }

}

