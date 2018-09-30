//
//  EpisodeDetailViewController.swift
//  Westeros
//
//  Created by Eduardo on 29/9/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {
    
    

    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var xlabel: UILabel!
    
    //Mark: Properties
    var model: Episode
    
    //Mark: Initialization
    init(model: Episode){
        self.model = model
        
        super.init(nibName: nil, bundle:nil)
        
        title = model.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    //Mark: Cycle-life
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
// Sincronizar Modelo & Vista
        syncModel()
        
        
    }
    func syncModel(){
        titleLabel.text = "\(model.title)"
        dateLabel.text = "\(model.dateRelease)"
        
        title = model.title
    }


}

extension EpisodeDetailViewController: EpisodeListViewControllerDelegate{
    func episodeListViewController(_ vc: EpisodeListViewController, didSelectEpisode episode: Episode) {
        self.model = episode
        syncModel()
    }
}
