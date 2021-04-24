//
//  TableViewController.swift
//  Course2Week3Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var photoTableView: UITableView!
    var identifier = "PhotoTVCell"
    
    let photosForTV = PhotoProvider().photos()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        photoTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        
        photoTableView.dataSource = self
        photoTableView.delegate = self
        
        photoTableView.separatorInset = UIEdgeInsets(top: 0, left: 150.0, bottom: 0, right: 0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photosForTV.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.imageView?.image = photosForTV[indexPath.row].image
        cell.textLabel?.text = photosForTV[indexPath.row].name
        cell.accessoryType = .detailButton
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        photoTableView.deselectRow(at: indexPath, animated: true)
        print ("Row selected")
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        print("Accessory selected")
    }
}
