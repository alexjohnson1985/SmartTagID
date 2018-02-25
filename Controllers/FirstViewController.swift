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
    
    var nfcSession: NFCNDEFReaderSession!
    var initialInstruction = "Tap 'Scan' button below to start tagging"
    var activeItemList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scannedItemID.text = initialInstruction
        pushArray()
    }
    
    func pushArray() {
        let otherVC = SecondViewController()
        activeItemList = otherVC.activeItem
    }
    
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
                print(detectedItemName)
                
            }
            
            DispatchQueue.main.async {
                self.activeItemList.append(detectedItemName)
                print(self.activeItemList)
                self.scannedItemID.text = self.activeItemList.last! + " now in use"
                
            }
            
        }
    }
}
