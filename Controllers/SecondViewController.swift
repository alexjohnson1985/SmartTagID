//
//  SecondViewController.swift
//  SmartTagID
//
//  Created by Alex Johnson on 21/12/2017.
//  Copyright © 2017 Alex Johnson. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func signOut2ButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "SignOut2", sender: self)
    }
    @IBOutlet weak var itemTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        itemTableView.delegate = self
        itemTableView.dataSource = self
        
        itemTableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        itemTableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        
        cell.itemNameLabel?.text = activeItemList?[indexPath.row]
        cell.dateStampLabel?.text = dateStampArray?[indexPath.row]
        cell.timeStampLabel?.text = timeStampArray?[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let activeItem = activeItemList {
            return activeItem.count
        } else {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            activeItemList?.remove(at: indexPath.row)
            dateStampArray?.remove(at: indexPath.row)
            timeStampArray?.remove(at: indexPath.row)
            
            itemTableView.reloadData()
        }
    }

}

