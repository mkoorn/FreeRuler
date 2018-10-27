//
//  RulerView.swift
//  Free Ruler
//
//  Created by Pascal on 6/10/15.
//  Copyright (c) 2015 Pascal. All rights reserved.
//

import Cocoa

class RulerView: NSView {
	
	override var mouseDownCanMoveWindow: Bool {
		get {
			return true
		}
	}

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
		
    }
	
	override func mouseDown(with theEvent: NSEvent) {
		// println(theEvent.deltaX)
	}

}
