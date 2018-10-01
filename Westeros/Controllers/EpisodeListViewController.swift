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
        var model: [Episode]
        var delegate: EpisodeListViewControllerDelegate?
    
    //Mark: Initialization
        init(model:[Episode]){
        self.model = model
        super.init(nibName: nil, bundle:nil)
        title = "Episodes"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        

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
        cell?.textLabel?.text = episode.title
    //Devolver celda
        return cell!
    }

    // MARK: - Table View Controller
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
    // Se averigua la celda
        let episode = model[indexPath.row]
        
    // Se crea el controlador
        let episodeVC = EpisodeDetailViewController(model: episode)

    //Push
        navigationController?.pushViewController(episodeVC,animated: true)
        
        delegate?.episodeListViewController(self, didSelectEpisode: episode)
        
        // Enviar una notificacion
        let nc = NotificationCenter.default
        let notification = Notification(name: Notification.Name(EpisodeDidChangeNotificationName), object: self, userInfo: [EpisodeKey : episode])
        nc.post(notification)
    }
}

extension EpisodeListViewController{

    func saveLastselectedEpisode(at row: Int){
    let userDefaults = UserDefaults.standard
     userDefaults.set(row, forKey: lastEpisodeKey)
    userDefaults.synchronize()
}

    func lastSelectEpisode()-> Episode{
      let row = UserDefaults.standard.integer(forKey: lastEpisodeKey)
        return episode(at: row)
    }
    
    func episode (at index: Int)-> Episode{
        return model[index]
    }

}
