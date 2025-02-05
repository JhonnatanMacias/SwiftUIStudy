//
//  ViewController.swift
//  Bluetooth
//
//  Created by Jhonnatan Macias on 13/11/24.
//

import CoreBluetooth
import UIKit
import Foundation

class ViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate {
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            central.scanForPeripherals(withServices:nil)
        }
    }
    
    var centralManager: CBCentralManager!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }

    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        guard peripheral.name != nil else { return }
        if peripheral.identifier == UUIDdevice{
            self.centralManager.stopScan()
            self.centralManager.connect(peripheral, options: nil)
            self.peripheral = peripheral
            if let deviceName = self.peripheral?.name{
                lblDeviceName.text = "Device Name : \(deviceName)"
            }
            print("EXPECTED_PERIPHERALS = \(self.peripheral!)")
        }
    }

}

