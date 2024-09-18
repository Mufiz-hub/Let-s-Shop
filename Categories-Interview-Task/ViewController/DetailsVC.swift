//
//  DetailsVC.swift
//  Categories-Interview-Task
//
//  Created by Rahul Sharma on 09/09/24.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    var categoryVM = CategoriesViewModel()
    var mainData:MainModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblView.register(UINib(nibName: "ProductsTVCell", bundle: nil), forCellReuseIdentifier: "ProductsTVCell")
        self.title = mainData?.name
        categoryVM.getProductData(urlKey: mainData?.url ?? "") { result in
            if result
            {
                self.tblView.reloadData()
            }
            else
            {
                print("Error Coming!")
            }
        }
        self.tblView.rowHeight = UITableView.automaticDimension
    }
}


extension DetailsVC : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryVM.categoriesData?.products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTVCell") as! ProductsTVCell
        
        if let data1 = categoryVM.categoriesData?.products?[indexPath.row]
        {
            cell.setData(data: data1)
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProductsDetailsVC") as! ProductsDetailsVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
