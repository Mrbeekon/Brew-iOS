//
//  ReadingsGraph.swift
//  Bubbler
//
//  Original code by https://www.raywenderlich.com/6398124-swiftui-tutorial-for-ios-creating-charts
//  adapted by Sam Kirk on 04/05/2021.
//

import SwiftUI

struct ReadingsGraph: View {
    
    let brew: BrewEntity
    
    func readingHeight(_ height: CGFloat, range: Int) -> CGFloat {
      height / CGFloat(range)
    }

    func dayWidth(_ width: CGFloat, count: Int) -> CGFloat {
      width / CGFloat(count)
    }

    func dayOffset(_ date: Date, dWidth: CGFloat) -> CGFloat {
      CGFloat(Calendar.current.ordinality(of: .day, in: .year, for: date)!) * dWidth
    }

    func readingOffset(_ temperature: Double, degreeHeight: CGFloat) -> CGFloat {
      CGFloat(temperature + 10) * degreeHeight
    }
    
    var body: some View {
        GeometryReader { reader in
            ForEach(brew.readings.sorted(by: <), id: \.key) { key, reading in
            // 2
                Path { p in
                    // 3
                    let dWidth = self.dayWidth(reader.size.width, count: 365)
                    let dHeight = self.readingHeight(reader.size.height, range: 110)
                    // 4
                    let dOffset = self.dayOffset(key, dWidth: dWidth)
                    let lowOffset = self.readingOffset(0.001, degreeHeight: dHeight)
                    let highOffset = self.readingOffset(0.001, degreeHeight: dHeight)
                    // 5
                    p.move(to: CGPoint(x: dOffset, y: reader.size.height - lowOffset))
                    p.addLine(to: CGPoint(x: dOffset, y: reader.size.height - highOffset))
                    // 6
                }.stroke()
          }
        }
    }
}
