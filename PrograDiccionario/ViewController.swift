//
//  ViewController.swift
//  PrograDiccionario
//
//  Created by Daniel on 05/06/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func buscarPalabra(_ sender: Any) {
        var pal = "\(textField.text!)"
        var buscarPal = pal.replacingOccurrences(of: " ", with: "_")
        print("Se vaa buscar\(buscarPal)" )
        
        var palCompleta: String = "https://es.wikipedia.org/wiki/\(buscarPal)"
        if  let urlBuscar = URL(string: "\(palCompleta)"){
            print("Se vaa buscar\(urlBuscar)" )
            let request = URLRequest(url: urlBuscar)
            print("url es; \(request.url?.absoluteString)")
            if (request.url?.absoluteString == palCompleta){
                
                print("url resultante: \(request.url?.absoluteString)")
                webView.load(request as URLRequest)
                textField.text = ""
            }else{
                textField.text = "El texto introducido no se ha encontrado en wikipedia"
            }
        }else{
            textField.text = "El texto introducido no se ha encontrado en wikipedia"
        }
    }
}

