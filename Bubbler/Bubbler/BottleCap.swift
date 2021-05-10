//
//  BottleCap.swift
//  Bubbler
//
//  Created by Sam Kirk on 10/05/2021.
//  Converter used: https://quassummanus.github.io/SVG-to-SwiftUI/
//
import SwiftUI

struct BottleCap: Shape {
    func path(in rect: CGRect) -> Path {
            var path = Path()
            let width = rect.size.width
            let height = rect.size.height
            path.move(to: CGPoint(x: 0.2283*width, y: 0.9132*height))
            path.addCurve(to: CGPoint(x: 0.11415*width, y: 0.8157*height), control1: CGPoint(x: 0.23781*width, y: 0.85375*height), control2: CGPoint(x: 0.16647*width, y: 0.80024*height))
            path.move(to: CGPoint(x: 0.11891*width, y: 0.81451*height))
            path.addCurve(to: CGPoint(x: 0.03924*width, y: 0.68728*height), control1: CGPoint(x: 0.14507*width, y: 0.75981*height), control2: CGPoint(x: 0.09275*width, y: 0.68847*height))
            path.move(to: CGPoint(x: 0.04281*width, y: 0.68728*height))
            path.addCurve(to: CGPoint(x: 0.00357*width, y: 0.54221*height), control1: CGPoint(x: 0.08442*width, y: 0.64328*height), control2: CGPoint(x: 0.0547*width, y: 0.55886*height))
            path.move(to: CGPoint(x: 0.00832*width, y: 0.54459*height))
            path.addCurve(to: CGPoint(x: 0.01427*width, y: 0.39477*height), control1: CGPoint(x: 0.06064*width, y: 0.51486*height), control2: CGPoint(x: 0.05707*width, y: 0.42568*height))
            path.move(to: CGPoint(x: 0.01665*width, y: 0.39715*height))
            path.addCurve(to: CGPoint(x: 0.06659*width, y: 0.25565*height), control1: CGPoint(x: 0.0761*width, y: 0.38407*height), control2: CGPoint(x: 0.09869*width, y: 0.29845*height))
            path.move(to: CGPoint(x: 0.06897*width, y: 0.25922*height))
            path.addCurve(to: CGPoint(x: 0.15815*width, y: 0.13793*height), control1: CGPoint(x: 0.12961*width, y: 0.26397*height), control2: CGPoint(x: 0.17598*width, y: 0.18906*height))
            path.move(to: CGPoint(x: 0.15815*width, y: 0.14269*height))
            path.addCurve(to: CGPoint(x: 0.27943*width, y: 0.05351*height), control1: CGPoint(x: 0.21403*width, y: 0.16528*height), control2: CGPoint(x: 0.28181*width, y: 0.10702*height))
            path.move(to: CGPoint(x: 0.27943*width, y: 0.05826*height))
            path.addCurve(to: CGPoint(x: 0.42093*width, y: 0.00832*height), control1: CGPoint(x: 0.32699*width, y: 0.09631*height), control2: CGPoint(x: 0.40785*width, y: 0.06064*height))
            path.move(to: CGPoint(x: 0.41974*width, y: 0.01308*height))
            path.addCurve(to: CGPoint(x: 0.56956*width, y: 0.00713*height), control1: CGPoint(x: 0.45422*width, y: 0.06302*height), control2: CGPoint(x: 0.54221*width, y: 0.05351*height))
            path.move(to: CGPoint(x: 0.56599*width, y: 0.0107*height))
            path.addCurve(to: CGPoint(x: 0.71106*width, y: 0.04994*height), control1: CGPoint(x: 0.58383*width, y: 0.06897*height), control2: CGPoint(x: 0.67063*width, y: 0.08561*height))
            path.move(to: CGPoint(x: 0.70749*width, y: 0.05232*height))
            path.addCurve(to: CGPoint(x: 0.83472*width, y: 0.13199*height), control1: CGPoint(x: 0.70749*width, y: 0.11296*height), control2: CGPoint(x: 0.78597*width, y: 0.15458*height))
            path.move(to: CGPoint(x: 0.83115*width, y: 0.13317*height))
            path.addCurve(to: CGPoint(x: 0.92866*width, y: 0.24732*height), control1: CGPoint(x: 0.81332*width, y: 0.19144*height), control2: CGPoint(x: 0.87515*width, y: 0.25327*height))
            path.move(to: CGPoint(x: 0.9239*width, y: 0.24614*height))
            path.addCurve(to: CGPoint(x: 0.98335*width, y: 0.38407*height), control1: CGPoint(x: 0.88942*width, y: 0.29608*height), control2: CGPoint(x: 0.93103*width, y: 0.37455*height))
            path.move(to: CGPoint(x: 0.97979*width, y: 0.38288*height))
            path.addCurve(to: CGPoint(x: 0.99643*width, y: 0.53151*height), control1: CGPoint(x: 0.93222*width, y: 0.42093*height), control2: CGPoint(x: 0.94887*width, y: 0.50773*height))
            path.move(to: CGPoint(x: 0.99405*width, y: 0.52913*height))
            path.addCurve(to: CGPoint(x: 0.96671*width, y: 0.67658*height), control1: CGPoint(x: 0.93817*width, y: 0.55172*height), control2: CGPoint(x: 0.92747*width, y: 0.63853*height))
            path.move(to: CGPoint(x: 0.96314*width, y: 0.6742*height))
            path.addCurve(to: CGPoint(x: 0.89298*width, y: 0.80737*height), control1: CGPoint(x: 0.9025*width, y: 0.67895*height), control2: CGPoint(x: 0.86683*width, y: 0.75981*height))
            path.move(to: CGPoint(x: 0.89061*width, y: 0.80262*height))
            path.addCurve(to: CGPoint(x: 0.78478*width, y: 0.90844*height), control1: CGPoint(x: 0.83115*width, y: 0.78954*height), control2: CGPoint(x: 0.77408*width, y: 0.85612*height))
            path.move(to: CGPoint(x: 0.78478*width, y: 0.90369*height))
            path.addCurve(to: CGPoint(x: 0.65161*width, y: 0.97384*height), control1: CGPoint(x: 0.73246*width, y: 0.87396*height), control2: CGPoint(x: 0.65755*width, y: 0.92033*height))
            path.move(to: CGPoint(x: 0.65279*width, y: 0.97027*height))
            path.addCurve(to: CGPoint(x: 0.50535*width, y: 0.99762*height), control1: CGPoint(x: 0.61118*width, y: 0.92628*height), control2: CGPoint(x: 0.52675*width, y: 0.94887*height))
            path.move(to: CGPoint(x: 0.50773*width, y: 0.99405*height))
            path.addCurve(to: CGPoint(x: 0.3591*width, y: 0.97741*height), control1: CGPoint(x: 0.48157*width, y: 0.93936*height), control2: CGPoint(x: 0.39358*width, y: 0.93579*height))
            path.move(to: CGPoint(x: 0.36147*width, y: 0.97503*height))
            path.addCurve(to: CGPoint(x: 0.22354*width, y: 0.91558*height), control1: CGPoint(x: 0.35196*width, y: 0.91558*height), control2: CGPoint(x: 0.26873*width, y: 0.88585*height))
            return path
        }
    }
