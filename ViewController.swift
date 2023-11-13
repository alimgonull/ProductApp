//
//  ViewController.swift
//  ProductApp
//
//  Created by Alim Gönül on 27.09.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var productArray = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self

        let u1 = Product(id: 1 , ad: "Macbook Pro 14", resim : "bilgisayar",fiyat: 43000)
        let u2 = Product(id: 2 , ad: "Rayban Club Master", resim : "gozluk",fiyat: 2500)
        let u3 = Product(id: 3 , ad: "Sony ZX Series", resim : "kulaklik",fiyat: 40000)
        let u4 = Product(id: 4 , ad: "Gio Armani", resim : "parfum",fiyat: 2000)
        let u5 = Product(id: 5 , ad: "Casio X Series", resim : "saat",fiyat: 8000)
        let u6 = Product(id: 6 , ad: "Dyson V8", resim : "supurge",fiyat: 18000)
        let u7 = Product(id: 7 , ad: "IPhone 13", resim : "telefon",fiyat: 32000)
        productArray.append(u1)
        productArray.append(u2)
        productArray.append(u3)
        productArray.append(u4)
        productArray.append(u5)
        productArray.append(u6)
        productArray.append(u7)
    }
    

}
extension ViewController: UITableViewDelegate, UITableViewDataSource,CellProtocol{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = productArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ProductCell
        
        cell.phoneImage.image = UIImage(named: product.resim!)
        cell.productNameLabel.text = product.ad
        cell.productPriceLabel.text = "\(product.fiyat!) ₺"
        // ARKA PLAN RENGİ İÇİN
        cell.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        // Hücre içinde seçili olma durumunu kaldırıyor
        cell.selectionStyle = .none
        
        cell.cellProtocol = self
        cell.indexPath = indexPath
        return cell
        
    }
    // SİLME VE DÜZENLEME İŞLEMİ
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let product = productArray[indexPath.row]
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") {
            contextualAction,view,bool in
            print("\(product.ad!) Silindi")
        }
        let update = UIContextualAction(style: .normal, title: "Update"){
            contextualAction,view,bool in
            print("\(product.ad!) düzenlendi")
        }
        return UISwipeActionsConfiguration(actions: [delete,update])
    }
    // Ürüne tıkladıktan sonra sayfa aktarımı  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = productArray[indexPath.row]
        print("\(product.ad!) Seçildi")
        performSegue(withIdentifier: "toDetailVc", sender: product)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVc" {
            if let product = sender as? Product {
                let destintaion = segue.destination as! DetailViewController
                destintaion.products = product
            }
        }
        
    }
    func selectedButton(indexPath: IndexPath) {
        let product = productArray[indexPath.row]
        print("\(product.ad!) Sepete eklendi")

    }
   
}
