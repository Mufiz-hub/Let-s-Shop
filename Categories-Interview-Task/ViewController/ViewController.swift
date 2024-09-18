//
//  ViewController.swift
//  Categories-Interview-Task
//
//  Created by Rahul Sharma on 03/09/24.
//

import UIKit

class ViewController: UIViewController {
    var categoriesVM = CategoriesViewModel()
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblView.register(UINib(nibName: "CategoriesTVCell", bundle: nil), forCellReuseIdentifier: "CategoriesTVCell")
        self.title = "Home"
        fetchHeaders(for: "https://dummyjson.com/products/categories")
        categoriesVM.getCategoriresData { result in
            if result
            {
                self.tblView.reloadData()
            }
            else
            {
                print("Error Coming!")
            }
        }
        
    }


    func fetchHeaders(for urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "HEAD" // Use HEAD to fetch only headers

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            // Print all headers
            for (key, value) in httpResponse.allHeaderFields {
                print("\(key): \(value)")
            }
        }
        
        task.resume()
    }
}

extension ViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesVM.welcomeData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesTVCell", for: indexPath) as! CategoriesTVCell
        if let data = categoriesVM.welcomeData?[indexPath.row]
        {
            cell.setData(data: data)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        vc.mainData = categoriesVM.welcomeData?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


