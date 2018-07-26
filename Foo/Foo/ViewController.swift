//
//  ViewController.swift
//  Foo
//
//  Created by Jonathan Lehr on 7/26/18.
//  Copyright © 2018 About Objects. All rights reserved.
//

import UIKit
import Model

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let store = ReadingListStore("BooksAndAuthors")
        let readingList = store.fetchedReadingList
        print(readingList)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

