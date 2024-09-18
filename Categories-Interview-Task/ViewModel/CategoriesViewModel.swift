//
//  CategoriesViewModel.swift
//  Categories-Interview-Task
//
//  Created by Rahul Sharma on 03/09/24.
//

import Foundation


class CategoriesViewModel : NSObject
{
    var mainData:MainModel?
    var welcomeData:Welcome?
    var categoriesData:SecondAPIMainModel?
    
    func getCategoriresData(completion : @escaping (Bool) -> Void)
    {
        let url = APIKeys.base_Url + APIKeys.Endpoint.endP

 
        NetworkCall(url: url,method: .get,isJSONRequest: false).executeQuery()
        {
            (result : Result<Welcome,Error>) in
            
            switch result
            {
                
            case .success(let post):
                print(post)
                self.welcomeData = post
                completion(true)
            case .failure(let error):
                completion(false)
                
                print(error.localizedDescription)
                
                print("")
                
            }
            
        }
    }
    func getProductData(urlKey : String,completion : @escaping (Bool) -> Void)
    {
        let url = urlKey

 
        NetworkCall(url: url,method: .get,isJSONRequest: false).executeQuery()
        {
            (result : Result<SecondAPIMainModel,Error>) in
            
            switch result
            {
                
            case .success(let post):
                print(post)
                self.categoriesData = post
                completion(true)
            case .failure(let error):
                completion(false)
                
                print(error.localizedDescription)
                
                print("")
                
            }
            
        }
    }
}
