//
//  TableViewCell.swift
//  RickAndMortyApp
//
//  Created by Pınar Macit on 1.05.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var mImage: UIImageView!
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func onBind(data : Result) {
        
        nameLabel.text = data.name
        statusLabel.text = data.status
        speciesLabel.text = data.species
        genderLabel.text = data.gender
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://rickandmortyapi.com/api/character/avatar/2.jpeg")!)){
            (data,_,error) in
            do{
               let datas = try data
                DispatchQueue.main.async {
                    self.mImage.image = UIImage(data: datas!)
                }
            }catch{
                
            }
        }.resume()
        
    }
}
 
    /*
   func configure (with name: String, with status: String, with species: String, with gender: String) {
        nameLabel.text = name
        statusLabel.text = status
        speciesLabel.text = species
        genderLabel.text = gender
    }
}

*/
