//
//  BarGraph.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/18/20.
//

import SwiftUI

public struct BarGraph<T : ShapeStyle, U: ShapeStyle>: View {
    @State var data : [Double]
    var style : BarStyle<T, U> = BarStyle(strokeColor: Color.red, fillColor: Color.clear) as! BarStyle<T, U>
    
    public var body: some View {
        GeometryReader { geometry in
            HStack {
                ForEach(self.data, id: \.self){ item in
                    Bar(height: self.getSize(point: item, geometry: geometry))
                }
            }
        }
        
    }
    
    private func getSize(point: Double, geometry : GeometryProxy) -> CGFloat {
        return geometry.size.height * CGFloat(point / data.max()!)
    }
}

struct BarGraph_Previews: PreviewProvider {
    @State static var points = [10.0, 1.0, 6.0, 9.5, 5.0, 10.0]
    
    static var previews: some View {
        BarGraph<Color, Color>(data: points)
            .padding(30)
            .background(Color.blue)
            .frame(height: 300)
    }
}
