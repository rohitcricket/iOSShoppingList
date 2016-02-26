//
//  NewProductViewController.swift
//  ShoppingAssistant
//
//  Created by ROHIT GUPTA on 2/25/16.
//  Copyright © 2016 ROHIT GUPTA. All rights reserved.
//

import UIKit
import CoreData

class NewProductViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var storeTextField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: "imageTapped")
        self.imageView.addGestureRecognizer(imageTapRecognizer)
    }
    
    func imageTapped(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            let cameraViewController = UIImagePickerController()
            cameraViewController.sourceType = UIImagePickerControllerSourceType.Camera
            cameraViewController.delegate = self
            
            self.presentViewController(cameraViewController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.imageView.image = image
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }


    @IBAction func cancelTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
   

    @IBAction func saveTapped(sender: AnyObject) {
        
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let product = NSEntityDescription.insertNewObjectForEntityForName("Product", inManagedObjectContext: context) as! Product
        
        product.title = titleTextField.text
        product.store = storeTextField.text
        product.image = UIImagePNGRepresentation(self.imageView!.image!)
        
        do {
            try context.save()
        } catch {
            
        }
        
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
