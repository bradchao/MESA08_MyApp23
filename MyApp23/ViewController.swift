//
//  ViewController.swift
//  MyApp23
//
//  Created by user22 on 2017/10/2.
//  Copyright © 2017年 Brad Big Company. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    @IBAction func doTest1(_ sender: Any) {
        
        webView.stringByEvaluatingJavaScript(from: "test1(24.155858,120.661695)")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // read html file
        let html = Bundle.main.path(forResource: "brad", ofType: "html")
        let cont = try? String(contentsOfFile: html!)
        webView.loadHTMLString(cont!, baseURL: nil)
        
    }

}

