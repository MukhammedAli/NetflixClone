//
//  TitleTableViewCell.swift
//  NetflixClone
//
//  Created by  Mukhammed Ali Khamzayev on 11.02.2023.
//

import UIKit
import SnapKit
import SDWebImage

class TitleTableViewCell: UITableViewCell {

    
    
    
    
    static let identifier = "TitleTableViewCell"
    
    private let playTitleButton: UIButton = {
       let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
        
        
    }()
    
    private let titlesPosterUIImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds  = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlesPosterUIImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playTitleButton)
        
        applyConstraints()
       // contentView.addSubview()
    }
    
    
    private func applyConstraints() {
        titlesPosterUIImageView.snp.makeConstraints {
            $0.left.equalToSuperview().inset(15)
            $0.top.equalToSuperview().inset(30)
            $0.bottom.equalToSuperview().inset(30)
            $0.width.equalTo(100)
            $0.height.equalTo(140)
        }
        
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(titlesPosterUIImageView.snp.right).inset(-30)
            $0.top.bottom.equalToSuperview()
            $0.right.equalTo(playTitleButton.snp.left)
//            $0.top.bottom.equalToSuperview()
            
        }
        
        playTitleButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            
            $0.top.bottom.equalToSuperview()
        }
    }
    
     func configure(with model: TitleViewModel) {
       
         
         guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {return}
        titlesPosterUIImageView.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName 
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}






