//
//  RulerView.swift
//  Free Ruler
//
//  Created by Pascal on 6/10/15.
//  Copyright (c) 2015 Pascal. All rights reserved.
//

import Cocoa

class RulerView: NSView {

    // IB: use the adapter
    @IBInspectable var rulerOrientation:Int {
        get {
            return self.orientation.rawValue
        }
        set( newValue) {
            self.orientation = Orientation(rawValue: newValue) ?? .horizontal
        }
    }
    
    var orientation: Orientation!
    
    override var mouseDownCanMoveWindow: Bool {
        get {
            return true
        }
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        let context = NSGraphicsContext.current!.cgContext
        context.saveGState()
        context.setLineWidth(1.0)
        context.setStrokeColor(NSColor.black.cgColor)
        
        if self.orientation == .horizontal {
            self.drawHorizontal(rect: dirtyRect, context: context)
        } else {
            self.drawVertical(rect: dirtyRect, context: context)
        }
        
        context.strokePath()
        context.restoreGState()
        
    }
    
    func drawHorizontal(rect: NSRect, context: CGContext) {
        
        stride(from: 0, to: rect.size.width, by: 2).forEach { x in
            
            var length: CGFloat = 4.0
            if (Int(x)) % 10 == 0 {
                length = 10.0
            }
            if (Int(x)) % 50 == 0 {
                length = 15.0
                
                if x != 0 {
                    let numberText:NSString = NSString(string: "\(Int(x))")
                    let textRect = numberText.boundingRect(with: NSSize(width: 0, height: 0), options: [], attributes: nil)
                    numberText.draw(at: NSPoint(x: x - (textRect.size.width * 0.5) - 1, y: 20), withAttributes: nil)
                }
            }
            context.move(to: CGPoint(x: x - 1, y: 0))
            context.addLine(to: CGPoint(x: x - 1, y: length))
        }
    }
    
    func drawVertical(rect: NSRect, context: CGContext) {
        
        stride(from: 0, to: rect.size.height, by: 2).forEach { y in
            
            var length: CGFloat = 4.0
            if (Int(y)) % 10 == 0 {
                length = 10.0
            }
            context.move(to: CGPoint(x: 0, y: y))
            context.addLine(to: CGPoint(x: length, y: y))
        }
    }
    
    override func mouseDown(with theEvent: NSEvent) {
        //         println(theEvent.deltaX)
    }
    
}
