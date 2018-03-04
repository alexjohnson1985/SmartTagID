//
//  SecondViewController.swift
//  SmartTagID
//
//  Created by Alex Johnson on 21/12/2017.
//  Copyright © 2017 Alex Johnson. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var activeItem : [String] = []
    
    @IBAction func signOut2ButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "SignOut2", sender: self)
    }
    @IBOutlet weak var itemTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        itemTableView.delegate = self
        itemTableView.dataSource = self
//        updateActiveItemArray()
        
        itemTableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        updateActiveItemArray()
        print(activeItem)
        
        itemTableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
//    func updateActiveItemArray() {
//        let otherVC = FirstViewController()
//        activeItem = otherVC.activeItemList
//
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        cell.itemName.text = activeItem[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return activeItem.count
        
    }

}

