//
//  ViewController.swift
//  TextureExample
//
//  Created by jinsu on 2021/02/22.
//

import UIKit
import AsyncDisplayKit

class ViewController: ASDKViewController<ASDisplayNode> {

    private let imageNode: ASImageNode = {
        let node = ASImageNode()
        node.image = UIImage.init(systemName: "trash.slash")
        node.borderColor = UIColor.gray.cgColor
        node.borderWidth = 1.0
        node.cornerRadius = 15.0
        node.contentMode = .scaleAspectFit
        return node
      }()
    
    private let titleNode: ASTextNode = {
        let node = ASTextNode()
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        node.attributedText = NSAttributedString(
          string: "Welcome to Texture-KR",
          attributes: [
            .font: UIFont.boldSystemFont(ofSize: 15.0),
            .foregroundColor: UIColor.gray,
            .paragraphStyle: paragraphStyle
          ]
        )
        return node
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


}

