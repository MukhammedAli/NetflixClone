//
//  HeroHeaderUIView.swift
//  NetflixClone
//
//  Created by  Mukhammed Ali Khamzayev on 05.02.2023.
//

import UIKit
import SnapKit

class HeroHeaderUIView: UIView {
    
    private let downloadButton: UIButton = {
       let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        return button
    }()

    private let playButton: UIButton = {
       let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
     //   button.tintColor = .white
       // button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let heroImageView: UIImageView = {
       
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "DarkKnight")
        return imageView
    }()
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
        applyConstraints()
    }
    
    private func applyConstraints() {
//        let playButtonConstraints = [
//            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
//            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
//        ]
        playButton.snp.makeConstraints {
            $0.leading.equalTo(70)
            $0.bottom.equalTo(-50)
            $0.width.equalTo(100)
        }
        
        downloadButton.snp.makeConstraints {
            $0.trailing.equalTo(-70)
            $0.bottom.equalTo(-50)
            $0.width.equalTo(100)
        }
//
        //NSLayoutConstraint.activate(playButtonConstraints)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    

    
    required init?(coder: NSCoder) {
        fatalError()
    }

}

