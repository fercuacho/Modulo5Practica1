//
//  PokemonViewController.swift
//  MVC
//
//  Created by D on 05/08/23.
//

import UIKit

class PokemonViewController: UIViewController {

    let dataManager = PokemonDataManager()
    var selectedPokemon : Pokemon?
    
    @IBOutlet var pknTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dataManager.fetch()
    }
}


extension PokemonViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.countPokemons()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! PokemonCell
        let pokemon = dataManager.getPokemon(at: indexPath.row)
        cell.pokemonImage.image = UIImage(named: pokemon.image)
        cell.pokemonLabel.text = pokemon.name
        return cell
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Pokemons"
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return CGFloat.init(60.0)
//    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIImageView.init(image: UIImage(named: "Pokemon"))
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected:", indexPath.row)
        selectedPokemon = dataManager.getPokemon(at: indexPath.row)
        self.performSegue(withIdentifier: "detailSegue", sender: Self.self)
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue",
               let destination = segue.destination as? PokemonDetailController {
                destination.recivedPokemon = selectedPokemon
        }
    }
    
    
}
