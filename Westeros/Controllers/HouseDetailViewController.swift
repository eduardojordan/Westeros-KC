//
//  HouseDetailViewController.swift
//  Westeros
//
//  Created by Eduardo on 12/9/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController {

    
    //Mark: Properties
    let model: House
    
    
    // Mark - Outlets
    @IBOutlet weak var houseNameLabel: UILabel!
    
    
    @IBOutlet weak var sigilImageView: UIImageView!
    
    @IBOutlet weak var wordsLabel:UILabel!
   
    //MARK : Init - initialization
    
    init(model:House) {
        // Primero limpio mi propio desorden, es decir le doy valor a mi s propios valore
        
        self.model = model
        
        // Despues , llamamos a super
        super.init(nibName: nil,bundle: nil)
    }
    // Chapuza de los de cupertino , este init es el que usan los storyboards
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Sincronizar modelo y vista
        syncModelWithView()
    }
    
    // MARK: - Sync
    func syncModelWithView() {
        houseNameLabel.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsLabel.text = model.words
        
    }
    
    
}
