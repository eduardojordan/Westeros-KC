//
//  SeasonDetailViewController.swift
//  Westeros
//
//  Created by Eduardo on 29/9/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

import UIKit

class SeasonDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
   
   
    @IBAction func checkLabel(_ sender: Any) {
        let viewController = EpisodeListViewController(model: model.sortedEpisodes)
        //push
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    //Mark: Properties
    var model: Season
    
    //Mark: Initialization
    init(model: Season){
        //Limpio mi ***
        self.model = model
        //LLamamos a super
       super.init(nibName:nil, bundle:nil)
        // Si quiero uso alguna propiedad
     
        title = model.name
    }
    //Parche cuperino marca ACME
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //Mark - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
        syncModel()
}

   //Mark: Sync
    func syncModel(){
        
        title = model.name
        nameLabel.text = model.name
        
// ***********PENDIENTE********
                
        // Resolver las fechas que salgan como se requiere y numero de Episodios!!
        
        
        releaseDateLabel.text = " Release Date : \(Date())"
        episodeLabel.text = "Number of Episodes: \(model.count)"
    }

    func setupUI(){
        //Crear Botones
        
        //Añadir Botones
        
        
    }
    
}
extension SeasonDetailViewController: SeasonListViewControllerDelegate{
        func seasonListViewController(_ vc: SeasonListViewController, didSelectSeason season: Season) {
            self.model = season
            syncModel()


  }
}
