//  ViewController.swift
//  testTableView
//  Created by d0m on 09/12/2019.
//  Copyright © 2019 d0m. All rights reserved.

import UIKit

// ViewController is a class that inherits from UIViewController
// We also add the UITableViewDataSource protocol to manage
// the data to be displayed into the tableViewCells

class ViewController: UIViewController, UITableViewDataSource {

    // Photos filenames are stored into an array of string
    var photos = [String]()
    
    // The cell identifier is the name of the tableViewCell
    let cell_identifier = "photoCell"
    
    // The segue identifier is the name of the segue between the main view and the detailed view
    let details_identifier = "photoDetails"
    
    // Creation of an IBOutlet on the tableView
    @IBOutlet weak var photoTableView: UITableView!
    
    // viewDidLoad function is called just after the allocation of the view but before the display of the view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1 - We need to find the photos present in the bundle of the app
        // Create a file manager
        let fm = FileManager.default
        // Create the path of the bundle resources of the app
        let path = Bundle.main.resourcePath!
        // Find every file at the path
        let items = try! fm.contentsOfDirectory(atPath: path)
        // for each file, we look for the prefix "photo-"
        for item in items {
            if item.hasPrefix("photo-") {
                // We store the filenames into the array of photos
                photos.append(item)
            }
        }
        photos.sort()
        
        // 2 - We delegate the datasource protocol to the tableView
        // Now, the tableView is able to manage the cell.
        photoTableView.dataSource = self
    }
    
    // 3 - The UITableViewDataSource requires to write the two following functions
    
    // Returns the number of cells = the number of photos
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    // Returns a cell with all the information to be displayed
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Find a reusable cell of the appropriate type.
        // The PhotoTableViewCell is a specific class defined in PhotoTableViewCell.swift
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cell_identifier, for: indexPath) as! PhotoTableViewCell
        // Find the row of the cell
        let row = indexPath.row
        // Attach image and text to the cell
        cell.thumbnail.image = UIImage(named: photos[row])
        cell.photoTitle.text = photos[row]
        // return the cell
        return cell
    }
    
    // Add an horizontal swipe to delete a photo in the tableView
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Find the row of the cell
            let row = indexPath.row
            // First, remove photo from the list
            photos.remove(at: row)
            // Secondly, remove the row into the tableView
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        else if editingStyle == .insert {
            print ("insert")
        }
    }
    
    // For the detailed view, you need to write the prepare(for segue:) function
    // One function prepare(for segue:) for the view.
    // If there is more than one segue, you have to test the identifier of the segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // test the identifier of the segue
        if segue.identifier == details_identifier {
            // We find the destination view controler
            // See DetailsViewController.swift
            let detailViewController = segue.destination as! DetailsViewController
            // We find the row of the tableview on which we have clicked
            let myIndexPath = self.photoTableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            // And we attach the photoInfo variable with the adequate photo
            // We have to do like this and use a temporary variable on the detailViewControler
            // If we try to access the IBOutlets of the detailViewControler, an error occurs because the IBOutlets are available only after the view is displayed. During the prepare(for segue:) the detailView view does not exist.
            detailViewController.photoInfo = photos[row]
        }
    }
    
    // Unwind Action for closing the addPhoto view
    // You need first to declare the unwind Action before creatng an exit segue on the addPhotoView
    // Here, The same action is used for the two buttons cancel and save.
    // So you have to name the two segues.
    
    
    
    @IBAction func unwindToMainVC(_ unwindSegue: UIStoryboardSegue) {
        // We find the addPhoto view controller
        let sourceViewController = unwindSegue.source as! AddPhotoViewController
        // Use data from the view controller which initiated the unwind segue
        
        // Cancel action: Only dismiss the view
        if unwindSegue.identifier == "cancel" {
            sourceViewController.dismiss(animated: true, completion: nil)
        }
        
        // Save action: You have to copy the image into the app, then add it to the list of photos and then reload the tableViewController
        if unwindSegue.identifier == "save" {
            // Only if a photo has been selected
            if let image = sourceViewController.photo.image {
                // We store the jpegData of the UIImage
                if let data = image.jpegData(compressionQuality: 1) {
                    // The path of the bundle
                    let path = Bundle.main.resourcePath!
                    // The full filename
                    let filename = path + "/photo-dg-" + String(photos.count) + ".jpg"
                    // The url
                    let url = URL(fileURLWithPath: filename)
                    // Write the data
                    try? data.write(to: url)
                    // Add the photo to the list
                    photos.append("photo-dg-" + String(photos.count) + ".jpg")
                    // And finally reload the data
                    photoTableView.reloadData()
                }
            }
        }
    }
}

