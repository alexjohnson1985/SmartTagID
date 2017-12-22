//
//  FirstViewController.swift
//  SmartTagID
//
//  Created by Alex Johnson on 21/12/2017.
//  Copyright © 2017 Alex Johnson. All rights reserved.
//

import UIKit
import CoreNFC

// Reference the found NFC messages
var nfcMessages: [[NFCNDEFMessage]] = []

class FirstViewController: UIViewController, NFCNDEFReaderSessionDelegate {
    
    @IBOutlet weak var scannedTagID: UILabel!
    
    var nfcSession: NFCNDEFReaderSession!
    var scannedTagIDText = "Tap 'Scan' button below then place tag behind top of phone to read"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scannedTagID.text = scannedTagIDText
    }
    
    @IBAction func scanButtonPressed(_ sender: UIButton) {
        self.nfcSession = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        // A custom description that helps users understand how they can use NFC reader mode in your app.
        self.nfcSession.alertMessage = "Hold item behind top of phone to detect"
        self.nfcSession.begin()
        self.scannedTagID.text = "Scanning..."
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        
        self.nfcSession.alertMessage = "Item detected"
        
        for message in messages {
            for record in message.records {
                print((record.payload.advanced(by: 3) = encoding: .utf8))
            
            }
        }
    }
}
