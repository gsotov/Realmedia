//
//  DetallePelicula.swift
//  Realmedia
//
//  Created by Gabriel Soto valenzuela on 2/24/19.
//  Copyright © 2019 Gabriel Soto valenzuela. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit

class DetallePelicula: UIViewController {
    
    @IBOutlet weak var imagenDetalle: UIImageView!
    @IBOutlet weak var textoDetalle: UILabel!
    
    
    
    var delegate: ViewController?
    var delegate2: PeliculaPopular?
    
    var poster_path: NSString?
    var overview: NSString?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        //Casteo overview
        let s = String(describing: overview)
        self.textoDetalle.text = s
        
        let path = String(describing: poster_path)
        self.getDetallePelicula(poster_path: path)
    }
    
    func getDetallePelicula(poster_path:String){
        
        let urlKey = "http://image.tmdb.org/t/p/w500"+poster_path.replacingOccurrences(of: ")", with: "").replacingOccurrences(of: "Optional(", with: "")
        if let url = URL(string: urlKey){
            
            do {
                let data = try Data(contentsOf: url)
                self.imagenDetalle.image = UIImage(data: data)
                
            }catch let err {
                print(" Error : \(err.localizedDescription)")
            }
            
            
        }
    }
    
    @IBAction func volverButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "volver", sender: nil)
    }
    
    
}
