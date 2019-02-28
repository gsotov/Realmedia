//
//  ServiceApi.swift
//  Realmedia
//
//  Created by Gabriel Soto valenzuela on 2/23/19.
//  Copyright © 2019 Gabriel Soto valenzuela. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

//Clase que consume las API de themoviedb
class ServicioApi : NSObject
{
    
    //Clase que consume api de peliculas ordenadas por polular
    static func getPeliculasOrdenadasPopular(_ completionHandlerForMessageObject: @escaping ( _ success: Bool, _ peliculaPopular: [PeliculaPopularAndTop]?, _  errorString: String?) -> Void){
        let url = "https://api.themoviedb.org/3/movie/popular?api_key=34738023d27013e6d1b995443764da44"
        
        Alamofire.request(url).responseJSON
        {
            response in
                if let json = response.result.value
                {
                    debugPrint("json:: getPeliculasOrdenadasPopular ", json)
                    let parseJson = JSON(json)
                    debugPrint("JSON", parseJson)
                    let resultPeliculas = PeliculaPopularAndTop.getPeliculas(json as! [[String : AnyObject]])
                    completionHandlerForMessageObject(true, resultPeliculas, nil)
                    
                    
                }
            
        }
    }
    
    //Clase que consume api de peliculas ordenadas películas por top rated
    static func getPeliculasOrdenadasTopRated(_ completionHandlerForMessageObject: @escaping ( _ success: Bool, _ peliculaTopRated: [PeliculaPopularAndTop]?, _  errorString: String?) -> Void){
        let url = "https://api.themoviedb.org/3/movie/top_rated?api_key=34738023d27013e6d1b995443764da44"
        
        Alamofire.request(url).responseJSON { response in
            if let json = response.result.value{
                print("json:: getPeliculasOrdenadasTopRated \(json)")
                let parseJson = JSON(json)
                debugPrint("JSON", parseJson)
                let resultPeliculas = PeliculaPopularAndTop.getPeliculas(json as! [[String:AnyObject]])
                completionHandlerForMessageObject(true, resultPeliculas, nil)
            }
        }
    }
    
    //Clase que consume api obtiene detalle de peliculas
    static func getDetallePelicula(poster_path:String, _ completionHandlerForMessageObject: @escaping ( _ success: Bool, _ detallePelicula: [DetallePeliculaModelo]?, _  errorString: String?) -> Void){
        let url = "http://image.tmdb.org/t/p/w500"
        
        Alamofire.request(url + poster_path).responseJSON { response in
            if let json = response.result.value{
                print("json:: getDetallePelicula \(json)")
                
                
            }
        }
    }
    
    
    struct PeliculasPopular_JsonObject
    {
        struct  JsonResponseKeys
        {
            static let original_title = "original_title"
            static let title = "title"
            static let poster_path = "poster_path"
            static let overview = "overview"

        }
    }
}


