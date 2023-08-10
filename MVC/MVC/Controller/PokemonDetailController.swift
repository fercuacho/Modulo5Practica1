//
//  PokemonDetailController.swift
//  MVC
//
//  Created by D on 05/08/23.
//

import UIKit

class PokemonDetailController: UIViewController {
    
    var recivedPokemon : Pokemon?
    
    @IBOutlet var pkImage: UIImageView!
    @IBOutlet var pkLabelAbility: UILabel!
    @IBOutlet var pkLabelName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let pokemon = recivedPokemon {
            pkImage.image = UIImage(named: pokemon.image) // Assign the Pokemon's image to the UIImageView
            pkLabelName.text = pokemon.name
            pkLabelAbility.text = "Ability: " + pokemon.ability
            // Set other labels or properties with relevant Pokemon data
        }
        
        
        
        //@IBAction func closeButtonTapped(_ sender: Any) {
        //    dismiss(animated: true, completion: nil)
        //}
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
    
    @IBAction func btnCerrarModal(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
