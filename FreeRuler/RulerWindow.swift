//
//  RulerWindow.swift
//  Free Ruler
//
//  Created by Pascal on 6/10/15.
//  Copyright (c) 2015 Pascal. All rights reserved.
//

import Cocoa

class RulerWindow: NSPanel {
	
	var orientation: Orientation?
	var ruler: Ruler?

    override init(contentRect: NSRect, styleMask aStyle: NSWindow.StyleMask, backing bufferingType: NSWindow.BackingStoreType, defer flag: Bool) {
        super.init(contentRect: contentRect, styleMask: aStyle, backing: bufferingType, defer: flag)
        
        self.isMovableByWindowBackground = true
        self.backgroundColor = NSColor(calibratedRed: 255/255, green: 255/255, blue: 179/255, alpha: 1.0)
    }


//	required init?(coder: NSCoder) {
//	    super.init(coder: coder)
//	}
	
	func drawMouseTick(_ mouseLoc: NSPoint) {
		switch orientation! {
		case .horizontal:
			Swift.print("mouse x: \(mouseLoc.x)")
		case .vertical:
			Swift.print("mouse y: \(mouseLoc.y)")
		}
	}
	
}
