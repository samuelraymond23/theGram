//
// 
//  theGram
//
//  Created by student on 4/15/18.
//  Copyright © 2018 student. All rights reserved.
//


import UIKit
import Parse

class PhotoCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    
    
    var post: PFObject! {
        didSet {
            if let pic = post.object(forKey: "media") as? PFFile {
                pic.getDataInBackground(block: { (image: Data?, error: Error?) in
                    if (error == nil) {
                        let instaImage = UIImage(data: image!)
                        self.postImageView.image = instaImage
                    }
                })
            }
            captionLabel.text = post.object(forKey: "caption") as? String
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
