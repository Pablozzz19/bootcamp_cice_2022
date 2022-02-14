//
//  PodcastCell.swift
//  MyCiceMusic
//
//  Created by cice on 09/02/2022.
//

import UIKit
import Kingfisher

protocol PodcastCellInputProtocol {
    func setupCell(data: GenericResult)
}

class PodcastCell: UITableViewCell, ReuseIdentifierProtocol {

    // MARK: - IBOutlets
    @IBOutlet weak var podcastImageView: UIImageView!
    @IBOutlet weak var podcastName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension PodcastCell: PodcastCellInputProtocol {
    
    func setupCell(data: GenericResult) {
        
        let url = URL(string: data.artworkUrl100 ?? "")
        let processor = DownsamplingImageProcessor(size: podcastImageView.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 20)
        podcastImageView.kf.indicatorType = .activity
        podcastImageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
        
        self.podcastName.text = data.name
    }
    
}
