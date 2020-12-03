//
//  DetailsViewController.swift
//  testTableView
//
//  Created by d0m on 09/12/2019.
//  Copyright © 2019 d0m. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // A variable to store the filename of the photo to be displayed
    // This variable is used to transfer data from the viewControler to this detailViewControler
    var userInfo: User?

    // The two IBOutlets of the view
    @IBOutlet weak var photoTitle: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // if you have data into userInfo, you can download the photo
        // and display the text into the IBOutlets
        if let user = userInfo {
            // Displays the description
            photoTitle.text = user.description
            // Creates a task that retrieves the contents of the specified URL
            let session = URLSession.shared
            let url = URL(string: user.picture)!
            let task = session.dataTask(with: url) { data, response, error in
                guard let imageData = data, error == nil else {
                    return
                }
                // Everything is ok
                DispatchQueue.main.async() {
                    self.photo.image = UIImage(data: imageData)
                }
            }
            task.resume()
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
