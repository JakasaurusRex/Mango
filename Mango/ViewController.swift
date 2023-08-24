//
//  ViewController.swift
//  Mango
//
//  Created by Jake Torres on 8/23/23.
//

import UIKit
import SwiftSoup
import WebKit
import Erik

class ViewController: UIViewController {

    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ErikVisit()
    }
    
    func ErikVisit() {
        let browser: () = Erik.visit(url: URL(string: "https://mangasee123.com/read-online/JoJos-Bizarre-Adventure-Part-9-The-JOJOLands-chapter-7.html")!) { document, error in
            // browse HTML element, click, submit form and more
            if let e = error {

                } else if let doc = document {
                    // HTML Inspection
                    var array: [String] = []
                    var set = Set<String>()
                    for link in doc.querySelectorAll("img, img-fluid") {
                        if link["src"]?.contains(".png") == false {
                            continue
                        }
                        if(set.contains(link["src"]!)) {
                            continue
                        }
                        array.append(link["src"]!)
                        set.insert(link["src"]!)
                    }
                    print(array)
                }
        }
        
        
    }


}
