//
//  Product.swift
//  ProductApp
//
//  Created by Alim Gönül on 27.09.2023.
//

import Foundation
class Product{
    var id : Int?
    var ad : String?
    var resim : String?
    var fiyat : Int?
    
    init(){
        
        
    }
    
    init(id: Int, ad: String, resim: String, fiyat: Int) {
        self.id = id
        self.ad = ad
        self.resim = resim
        self.fiyat = fiyat
    }
}
