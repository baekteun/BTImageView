//
//  ViewController.swift
//  BTImageView
//
//  Created by baekteun on 02/07/2022.
//  Copyright (c) 2022 baekteun. All rights reserved.
//

import UIKit
import BTImageView

class ViewController: UIViewController {
    
    @IBOutlet weak var iv: BTImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        iv.aligns = [2,3,2]
        iv.axis = .vertical
        iv.setImages(images: [
            .init(systemName: "1.circle") ?? .init(),
            .init(systemName: "2.circle") ?? .init(),
            .init(systemName: "3.circle") ?? .init(),
            .init(systemName: "4.circle") ?? .init(),
            .init(systemName: "5.circle") ?? .init(),
            .init(systemName: "6.circle") ?? .init(),
            .init(systemName: "7.circle") ?? .init(),
            .init(systemName: "8.circle") ?? .init(),
            .init(systemName: "9.circle") ?? .init(),
        ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

