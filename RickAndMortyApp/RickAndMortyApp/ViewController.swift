//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by Pınar Macit on 1.05.2022.
//

import UIKit

class ViewController: UIViewController {
     
    @IBOutlet weak var tableView: UITableView!
    
     private var dataList = [Result]()
    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://rickandmortyapi.com/api/character")!)) { [weak self ] (data,_,error) in
            do{
                let reslut = try JSONDecoder().decode(RickandMorty.self, from: data!)
                DispatchQueue.main.async {
                    
                    print("tttt\(reslut.results)")
                    
                    self?.dataList = reslut.results
                    self?.tableView.reloadData()
                }
            }catch{
                
            }
        }.resume()
    }
}

extension ViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        cell.onBind(data: dataList[indexPath.row])
            return cell
    }
    
    
}
