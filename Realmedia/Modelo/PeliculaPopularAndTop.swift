//
//  PeliculaPopular.swift
//  Realmedia
//
//  Created by Gabriel Soto valenzuela on 2/23/19.
//  Copyright © 2019 Gabriel Soto valenzuela. All rights reserved.
//

import Foundation
import UIKit

struct PeliculaPopularAndTop
{
    
    let results: [[String:AnyObject]]?
    
    var original_title: String = ""
    
    static var original_Title: [String] = []
    
    init(dictionary: [String:AnyObject])
    {
        
        results = dictionary["results"] as? [[String:AnyObject]]
        
        if let Results = results
        {
            for data in Results
            {
                original_title = data ["original_title"] as! String
                
                PeliculaPopularAndTop.original_Title.append(original_title)
            
            }
        }
    }
    
    static func getPeliculas(_ messageResultado: [[String:AnyObject]]) -> [PeliculaPopularAndTop]
    {
        var mensajeInst = [PeliculaPopularAndTop]()
        //obtiene los datos y lo va almacenando en el diccionario
        for mensaje in messageResultado
        {
            mensajeInst.append(PeliculaPopularAndTop(dictionary: mensaje))
        }
        return mensajeInst
    }
    
}
