/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

struct RGBAColor: Codable, Hashable {
    var r: CGFloat
    var g: CGFloat
    var b: CGFloat
    var a: CGFloat
}

extension Color {
    var r: CGFloat { UIColor(self).colorComponents.red }
    var g: CGFloat { UIColor(self).colorComponents.green }
    var b: CGFloat { UIColor(self).colorComponents.blue }
    var a: CGFloat { UIColor(self).colorComponents.alpha }
    
    var rgbaColor: RGBAColor {
        RGBAColor(r: self.r, g: self.g, b: self.b, a: self.a)
    }
    
    init(_ rgbaColor: RGBAColor) {
        self.init(red: rgbaColor.r, green: rgbaColor.g, blue: rgbaColor.b, opacity: rgbaColor.a)
    }
}

extension UIColor {
    var colorComponents: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)

        return (r, g, b, a)
    }
}


extension Color {
    static let bannerBlue = Color("banner-blue")
    static let bannerOrange = Color("banner-orange")
    static let bannerPink = Color("banner-pink")
    static let bannerYellow = Color("banner-yellow")
    
    static let curveBlue = Color("curve-blue")
    static let curveBrown = Color("curve-brown")
    static let curveOrange = Color("curve-orange")
    static let curveRed = Color("curve-red")
    
    static let darkBrown = Color("dark-brown")
    static let tanBackground = Color("tan-background")
    static let shadow = Color("shadow")
    
    static let paleOrange = Color("pale-orange")
    static let rayCard = Color("ray-card")
    static let curveCard = Color("curve-card")
    static let dotCard = Color("dot-card")
    static let waveCard = Color("wave-card")

    static let dotBrown = Color("dot-brown")
    static let dotGreen = Color("dot-green")
    static let dotYellow = Color("dot-yellow")
    
    static let rayMauve = Color("ray-mauve")
    static let rayOrange = Color("ray-orange")
    static let rayPeach = Color("ray-peach")
    static let rayYellow = Color("ray-yellow")
    
    static let themeBlue = Color("theme-blue")
    static let themeOrange = Color("theme-orange")
    static let themeGreen = Color("theme-green")
    static let themePink = Color("theme-pink")
    static let themeRed = Color("theme-red")
    static let themeTeal = Color("theme-teal")
    

    
    
}
