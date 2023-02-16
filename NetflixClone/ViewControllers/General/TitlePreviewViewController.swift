//
//  TitlePreviewViewController.swift
//  NetflixClone
//
//  Created by  Mukhammed Ali Khamzayev on 14.02.2023.
//

import UIKit
import WebKit



class TitlePreviewViewController: UIViewController {
    
   
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Harry potter"
        label.numberOfLines = 0
        return label
    }()
    
    private let overviewLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.numberOfLines = 0
        label.text = "This is the best movie ever to watch as a kid!"
        return label
    }()
    
    
    private let downloadButton: UIButton = {
       let button = UIButton()
       button.backgroundColor = .red
        button.setTitle("Download", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
       return button
    }()
    
    private let webView: WKWebView =  {
       let webView = WKWebView()
        return webView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        view.addSubview(titleLabel)
        view.addSubview(overviewLabel)
        view.addSubview(downloadButton)
        
        configureConstraints()
        
    }
    
    func configureConstraints() {
        webView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(webView.snp.bottom).inset(-20)
            $0.left.right.equalToSuperview().inset(20)
        
            
        }
        
        overviewLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).inset(-15)
            $0.left.right.equalToSuperview().inset(20)
        }
        
        downloadButton.snp.makeConstraints {
            $0.top.equalTo(overviewLabel.snp.bottom).inset(-20)
            $0.left.right.equalToSuperview().inset(20)
            $0.width.equalTo(140)
            $0.height.equalTo(40)
        }
    }
    
    func configure(with model: TitlePreviewViewModel) {
        titleLabel.text = model.title
        overviewLabel.text = model.titleOverview
        
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else { return }
        
        webView.load(URLRequest(url: url))
    }
    

   
    

}
