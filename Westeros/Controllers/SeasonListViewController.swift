//
//  SeasonListViewController.swift
//  Westeros
//
//  Created by Eduardo on 29/9/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

import UIKit


protocol SeasonListViewControllerDelegate{
    
    
    
    
    func seasonListViewController(_ vc: SeasonListViewController, didSelectSeason: Season)
}

class SeasonListViewController: UITableViewController {
    
    
    //Mark: Properties
    let model: [Season]
    var delegate: SeasonListViewControllerDelegate?

    
    //Mark: Initialization
    init(model: [Season]){
        self.model = model
        super.init (style: .plain)
     //   super.init(nibName: nil, bundle: nil)
        title = "Seasons"
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
      
       let cellId = "SeasonCell"
        
        // Descubrimos cual es el season a mostrar
        let season = model[indexPath.row]
        
        // Creamos la celda ( o la dan de cache si existe)
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        // Sicronizar modelo - Vista
        cell?.textLabel?.text = season.name
        
        return cell!
        
    }
  
    //Mark: Delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Averiguar la season
        let season = model[indexPath.row]
        
        // Crear el controlador del detalle
        let seasonDetailViewController = SeasonDetailViewController(model: season)
        
        
        // Push
        navigationController?.pushViewController(seasonDetailViewController, animated: true)
        
     
     //Delegate
        //SIEMPRE emotir la info a travez de DELEGATE & NOTIFICATION
        delegate?.seasonListViewController(self, didSelectSeason:season)
    
        // Enviar una notificacion
        let nc = NotificationCenter.default
        let notification = Notification(name: Notification.Name(SeasonDidChangeNotificationName), object: self, userInfo: [SeasonKey : season])
        nc.post(notification)

        //Guardamos la ultima season seleccionada
  //      saveLastSelectedSeason(at: indexPath.row)

     }
    
}

extension SeasonListViewController: SeasonListViewControllerDelegate{
    func seasonListViewController(_ vc: SeasonListViewController, didSelectSeason season: Season) {
        let seasonDetailViewController = SeasonDetailViewController(model: season)
        
        navigationController?.pushViewController(seasonDetailViewController, animated: true)
    }
}
extension SeasonListViewController {
    
//    func saveLastSelectedSeason(at row: Int){
//    // Aqui vamos a guardar la ultima casa seleccionada por el usuario
//    let userDefaults = UserDefaults.standard
//    //Lo insertamos en un diccionario
//    userDefaults.set(row, forKey: lastHouseKey)
//    // Giuardar
//    userDefaults.synchronize() // Por si acaso
//    }

//func lastSelectSeason() -> Season{
//    let row = UserDefaults.standard.integer(forKey: lastSeasonKey)
//    return season(at: row)
//    }
//func season (at index: Int)-> Season{
//    return season [index]
//    }
}
