//
//  FirstViewController.swift
//  SmartTagID
//
//  Created by Alex Johnson on 21/12/2017.
//  Copyright © 2017 Alex Johnson. All rights reserved.
//

import UIKit
import CoreNFC

class FirstViewController: UIViewController, NFCNDEFReaderSessionDelegate {
    
    @IBOutlet weak var scannedItemID: UILabel!
    @IBOutlet weak var scanButton: UIButton!
    @IBAction func resetScannedItemID(_ sender: Any) {
        scannedItemID.text = initialInstruction
    }
    @IBAction func signOut1ButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "SignOut1", sender: self)
    }
    
    var nfcSession: NFCNDEFReaderSession!
    var initialInstruction = "Tap 'Scan' below to start"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scanButton.layer.cornerRadius = 7
        scannedItemID.text = initialInstruction
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        scannedItemID.text = initialInstruction
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let TableView = segue.destination as! SecondViewController
//        TableView.activeItem = activeItemList
//
//    }

    @IBAction func scanButtonPressed(_ sender: UIButton) {
        
        self.nfcSession = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        // A custom description that helps users understand how they can use NFC reader mode in your app.
        self.nfcSession.alertMessage = "Hold item behind top of phone to detect"
        self.nfcSession.begin()
        scannedItemID.text = "Scanning..."
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        
        var detectedItemName = ""
        
        for message in messages {
            for record in message.records {
                
                detectedItemName+=String.init(data: record.payload.advanced(by: 3), encoding: .utf8)!
                activeItemList?.append(detectedItemName)
                
                print(detectedItemName)
                print(activeItemList!)
                
            }
            
            DispatchQueue.main.async {

                self.scannedItemID.text = (detectedItemName) + " now in use"
                
//                self.performSegue(withIdentifier: "segue", sender: self)

            }
            
        }
        
    }
    
}
