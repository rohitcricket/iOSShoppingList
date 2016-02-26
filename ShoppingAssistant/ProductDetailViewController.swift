//
//  ProductDetailViewController.swift
//  ShoppingAssistant
//
//  Created by ROHIT GUPTA on 2/25/16.
//  Copyright © 2016 ROHIT GUPTA. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var storeLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var product: Product? = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.text = self.product!.title
        self.storeLabel.text = self.product!.store
        self.imageView!.image = UIImage(data: product!.image! )
        
        
    }



}
