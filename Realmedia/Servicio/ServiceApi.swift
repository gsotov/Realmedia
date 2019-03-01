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
    class func getPeliculasOrdenadasPopular(completion: @escaping (_ peliculaPopular: [PeliculaPopular]?) -> ()){
        let url = "https://api.themoviedb.org/3/movie/popular?api_key=34738023d27013e6d1b995443764da44"
        
        Alamofire.request(url).responseJSON
        {
            response in
            
            let peliculaPopular: NSMutableArray = []
            switch response.result{
            case .failure( _):
                if let data = response.data{
                    print("Server error  " + String(data: data, encoding: String.Encoding.utf8)!)
                }
                completion(nil)
                
            case .success(let value):
                let json = JSON(value)
                
                for current in JSON(json)["results"].arrayValue{
                    peliculaPopular.add(PeliculaPopular(dictionary: (current.dictionaryObject! as NSDictionary) as! [String:AnyObject]))
                }
                completion(peliculaPopular as NSArray as? [PeliculaPopular])
            }
            
        }
    }
    
    //Clase que consume api de peliculas ordenadas películas por top rated
    class func getPeliculasOrdenadasTopRated(completion: @escaping (_ peliculaTop: [PeliculaTopRader]?) -> ()){
        let url = "https://api.themoviedb.org/3/movie/top_rated?api_key=34738023d27013e6d1b995443764da44"
        
        Alamofire.request(url).responseJSON { response in
            let peliculaTop: NSMutableArray = []
            switch response.result{
            case .failure( _):
                if let data = response.data{
                    print("Server error  " + String(data: data, encoding: String.Encoding.utf8)!)
                }
                completion(nil)
                
            case .success(let value):
                let json = JSON(value)
                
                for current in JSON(json)["results"].arrayValue{
                    peliculaTop.add(PeliculaTopRader(dictionary: (current.dictionaryObject! as NSDictionary) as! [String:AnyObject]))
                }
                completion(peliculaTop as NSArray as? [PeliculaTopRader])
            }
        }
    }
}


