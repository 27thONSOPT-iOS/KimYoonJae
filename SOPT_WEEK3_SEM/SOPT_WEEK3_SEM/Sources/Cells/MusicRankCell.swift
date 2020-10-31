//
//  MusicRankCell.swift
//  SOPT_WEEK3_SEM
//
//  Created by Yunjae Kim on 2020/10/31.
//

import UIKit

class MusicRankCell: UITableViewCell {

    static let identifier = "MusicRankCell"
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setCell(rank : Int, music : Music){
        albumImageView.image = music.makeAlbumImage()
        titleLabel.text = music.title
        singerLabel.text = music.singer
        
        rankLabel.text = "\(rank+1)"
        
        
    }

}
