//
//  RecordedAudio.swift
//  Pitch Perfect 2
//
//  Created by Ronald Morgan on 2/29/16.
//  Copyright © 2016 Ronald Morgan. All rights reserved.
//

import Foundation

    class RecordedAudio: NSObject{
        var filePathUrl: NSURL!
        var title: String!
        
        init(filePathUrl: NSURL!, title: String!) {
            self.filePathUrl = filePathUrl
            self.title = title
        }
}
