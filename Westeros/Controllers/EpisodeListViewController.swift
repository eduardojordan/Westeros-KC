//
//  EpisodeListViewController.swift
//  Westeros
//
//  Created by Eduardo on 29/9/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

import UIKit

protocol EpisodeListViewControllerDelegate{
    
    
    
    
    
    func episodeListViewController (_ vc: EpisodeListViewController, didSelectEpisode: Episode)
}

class EpisodeListViewController: UITableViewController {
    
    
    //Mark: Properties
    let model: [Episode]
    var delegate: EpisodeListViewControllerDelegate?
    
    //Mark: Initialization
    init(model:[Episode]){
        self.model = model
        super.init (style: .plain)
        // super.init(nibName: nil, bundle:nil
        title = "Episodes"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   

//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()

      
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return model.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "EpisodeCell"
        //descubrir el item
        let episode = model[indexPath.row]
        
        //crear celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .default,reuseIdentifier: cellId)
        }
        //Sincronizar view & model
       cell?.textLabel?.text = "\(episode) \(episode.title)"
        
        //Devolver celda
        return cell!
    }

}


