//
//  AppDelegate.swift
//  Free Ruler
//
//  Created by Pascal on 6/9/15.
//  Copyright (c) 2015 Pascal. All rights reserved.
//

import Cocoa

/**

# TODO

√ moving windows
- drawing rulers
√ detecting mouse position
- drawing mousetick
- close button
- resize controls? - probably not needed
- reading/writing preferences
- responding to settings changes?

*/

enum Orientation: Int {
	case horizontal
	case vertical
}


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	@IBOutlet weak var hRulerWindow: RulerWindow!
	@IBOutlet weak var vRulerWindow: RulerWindow!

//    var hRuler: Ruler?
//    var vRuler: Ruler?
	
	var foregroundTimerInterval: TimeInterval = 10 / 1000
	var backgroundTimerInterval: TimeInterval = 100 / 1000
	var currentTimerInterval: TimeInterval?
	var timer: Timer?

	func applicationDidFinishLaunching(_ aNotification: Notification) {
		// Insert code here to initialize your application

//        hRuler = Ruler(length: 200, opacity: 0.9, orientation: .horizontal)
        hRulerWindow.orientation = .horizontal
        hRulerWindow.alphaValue = 0.9
        hRulerWindow.isFloatingPanel = true
        hRulerWindow.minSize.height = 50
        hRulerWindow.maxSize.height = 50
        hRulerWindow.minSize.width = 200
        hRulerWindow.maxSize.width = 5000
        
//        vRuler = Ruler(length: 200, opacity: 0.9, orientation: .vertical)
        vRulerWindow.orientation = .vertical
        vRulerWindow.alphaValue = 0.9
        vRulerWindow.isFloatingPanel = true
        vRulerWindow.minSize.width = 50
        vRulerWindow.maxSize.width = 50
        vRulerWindow.minSize.height = 200
        vRulerWindow.maxSize.height = 5000
	}
	
	func applicationDidBecomeActive(_ notification: Notification) {
		print("active")
		hRulerWindow.alphaValue = 0.9
		vRulerWindow.alphaValue = 0.9
		
		currentTimerInterval = foregroundTimerInterval
		startTimer()

	}
	
	func applicationDidResignActive(_ notification: Notification) {
		print("inactive")
		hRulerWindow.alphaValue = 0.5
		vRulerWindow.alphaValue = 0.5

		currentTimerInterval = backgroundTimerInterval
		startTimer()
		
}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}
	
	func startTimer() {
		timer?.invalidate()
		
		timer = Timer.scheduledTimer(timeInterval: currentTimerInterval!,
			target: self,
			selector: #selector(AppDelegate.onInterval(_:)),
			userInfo: nil,
			repeats: true)
	}
	
	@objc func onInterval(_ timer: Timer) {
		print("onInterval")
		self.queryMouseLocation()
	}
	
	func queryMouseLocation() {
		let mouseLoc = NSEvent.mouseLocation
		hRulerWindow.drawMouseTick(mouseLoc)
		vRulerWindow.drawMouseTick(mouseLoc)
	}

	@IBAction func closeHorizontalRuler(_ sender: AnyObject) {
		hRulerWindow.close()
	}

	@IBAction func closeVerticalRuler(_ sender: AnyObject) {
		vRulerWindow.close()
	}
	
}

