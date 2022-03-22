//
//  CustomTableViewCell.swift
//  MockyApp
//
//  Created by Idwall Go Dev 003 on 21/03/22.
//

import UIKit
import Kingfisher

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    
    static let identifier = "CustomTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(with founder: Founder) {
        nameLabel.text = founder.name
        companyLabel.text = founder.company.name
        
        let url = URL(string: founder.photo)
        
        photoImageView.kf.setImage(with: url)
        
        photoImageView.layer.cornerRadius = 35 ;
        photoImageView.clipsToBounds = true;
    }
}
