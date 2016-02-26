//
//  ViewController.swift
//  ShoppingAssistant
//
//  Created by ROHIT GUPTA on 2/23/16.
//  Copyright © 2016 ROHIT GUPTA. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var products : [Product] = []
    
    var selectedProduct: Product? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
       // makeSampleProduct()
        

        
    }
    
    override func viewWillAppear(animated: Bool) {
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let request = NSFetchRequest(entityName: "Product")
        
        var results: [AnyObject]?
        
        do {
            results = try context.executeFetchRequest(request)
        } catch {
            results = nil
        }
        
        if results != nil {
            self.products = results as! [Product]
            
        }
        
        self.tableView.reloadData()
    }

    func makeSampleProduct(){
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let product = NSEntityDescription.insertNewObjectForEntityForName("Product", inManagedObjectContext: context) as! Product
        
        product.title = "Puma shoes"
        product.image = UIImageJPEGRepresentation(UIImage(named: "puma.jpg")!, 1)
        
        do {
            try context.save()
        } catch {
            
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let product = self.products[indexPath.row]
        cell.textLabel!.text = product.title
        cell.imageView!.image = UIImage(data: product.image!)
        return cell
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.selectedProduct = self.products[indexPath.row]
        performSegueWithIdentifier("tableViewToDetailSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "tableViewToDetailSegue" {
            let detailVC = segue.destinationViewController as! ProductDetailViewController
            detailVC.product = self.selectedProduct
        }

    }


}

