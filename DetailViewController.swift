//
//  DetailViewController.swift
//  ProductApp
//
//  Created by Alim Gönül on 27.09.2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
    var products : Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let product = products {
            // back yazan kısma ürünün ismini veriyoruz.
            self.navigationItem.title = product.ad
            imageView.image = UIImage(named: product.resim!)
            priceLabel.text = ("\(product.fiyat!) ₺")
        }
    }
    @IBAction func addBasketButton(_ sender: Any) {
        if let product = products {
            print("Detay Sayfa: \(product.ad!) sepete eklendi.")
        }
    }
    

}
