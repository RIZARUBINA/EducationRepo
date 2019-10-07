//
//  ImageTableViewCell.swift
//  GCD_TableView
//
//  Created by Margarita Zarubina on 01/10/2019.
//  Copyright © 2019 Margarita Zarubina. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var tImage: UIImageView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var imageURL: URL? {
        didSet{
            tImage?.image = nil
            updateUI()
        }
    }
    
    private func updateUI(){
        if let url = imageURL {
            spinner?.startAnimating()
            DispatchQueue.global(qos: .userInitiated).async {
                let contentsOfUrl = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    if let imageData = contentsOfUrl {
                        self.tImage?.image = UIImage(data: imageData)
                    }
                    self.spinner?.stopAnimating()
                }
            }
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
