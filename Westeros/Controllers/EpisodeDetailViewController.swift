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
    private var model: Episode
    
    //Mark: Initialization
    init(model: Episode){
        self.model = model
        super.init(nibName: nil, bundle:nil)
        
     
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    //Mark: Cycle-life
    
    override func viewDidLoad() {
        super.viewDidLoad()
        syncModel()
    }

        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            // Baja en la notificación
            let notificationCenter = NotificationCenter.default
            notificationCenter.removeObserver(self)
        }
        
        // Mark: - Notifications
        @objc func seasonDidChange(notification: Notification) {
            navigationController?.popViewController(animated: true)
        }
    
    // Sincronizar Modelo & Vista
 
    func syncModel(){
        titleLabel.text = model.title
      //  dateLabel.text = model.dateRelease
        
        title = model.title
    }

}

extension EpisodeDetailViewController: EpisodeListViewControllerDelegate{
    func episodeListViewController(_ vc: EpisodeListViewController, didSelectEpisode episode: Episode) {
        self.model = episode
        syncModel()
    }
}
