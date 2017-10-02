//
//  ViewController.swift
//  MyApp23
//
//  Created by user22 on 2017/10/2.
//  Copyright © 2017年 Brad Big Company. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    private let lmgr = CLLocationManager()
    
    @IBAction func doTest1(_ sender: Any) {
        
        webView.stringByEvaluatingJavaScript(from: "calcRoute()")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lmgr.requestAlwaysAuthorization()
        lmgr.delegate = self
        lmgr.startUpdatingLocation()
        
        // read html file
        let html = Bundle.main.path(forResource: "brad", ofType: "html")
        let cont = try? String(contentsOfFile: html!)
        webView.loadHTMLString(cont!, baseURL: nil)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){

        for loc in locations {
            let lat = loc.coordinate.latitude
            let lng = loc.coordinate.longitude
            print("\(lat), \(lng)")
            print("----")
            let goJS = "test1(\(lat),\(lng))"
            webView.stringByEvaluatingJavaScript(from: goJS)
        }
        print("=====")
    }
    

}

