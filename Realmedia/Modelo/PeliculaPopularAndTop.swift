//
//  PeliculaPopular.swift
//  Realmedia
//
//  Created by Gabriel Soto valenzuela on 2/23/19.
//  Copyright © 2019 Gabriel Soto valenzuela. All rights reserved.
//

import Foundation

struct PeliculaPopularAndTop
{
    let Resultado: [[String:AnyObject]]?
    
    var original_title: String = ""
    var title: String = ""
    var poster_path: String = ""
    var overview: String = ""
    
    static var arrayOriginal_Title: [String] = []
    static var arraytitle: [String] = []
    static var arrayPoster_Path: [String] = []
    static var arrayOverview: [String] = []
    
    init(dictionary: [String:AnyObject])
    {

        Resultado = dictionary["results"] as? [[String:AnyObject]]

        if let Results = Resultado
        {
            for data in Results
            {
                original_title = data ["original_title"] as! String
                title = data ["title"] as! String
                poster_path = data ["poster_path"] as! String
                overview = data ["overview"] as! String
                
                PeliculaPopularAndTop.arrayOriginal_Title.append(original_title)
                PeliculaPopularAndTop.arraytitle.append(title)
                PeliculaPopularAndTop.arrayPoster_Path.append(poster_path)
                PeliculaPopularAndTop.arrayOverview.append(overview)
            
            }
        }
    }
    
    static func getPeliculas(_ peliculaResultado: [[String : AnyObject]]) -> [PeliculaPopularAndTop]
    {
        var peliculas = [PeliculaPopularAndTop]()
       
        for peli in peliculaResultado
        {
            peliculas.append(PeliculaPopularAndTop(dictionary: peli))
        }
        return peliculas
    }
    
}
