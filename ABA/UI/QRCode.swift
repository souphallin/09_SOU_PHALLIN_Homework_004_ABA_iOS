//
//  QRCode.swift
//  ABA
//
//  Created by Mac on 9/9/25.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct QRGenerator: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View{
        ZStack{
            Color.black.ignoresSafeArea(.all)
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }){
                Image(systemName: "xmark")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .padding(.bottom, 720)
                    .padding(.leading, 300)
                    .frame(alignment: .trailing)
            }
            VStack(alignment: .center){
                HStack{
                    Image("ABALogo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 30)
                    Text("  QR")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding(.bottom, 2)
                
                
                VStack (alignment: .center){
                    Text("ប្រើ QR នេះ ដើម្បីទទួលប្រាក់ពីមិត្តភក្តិ ឬ")
                    HStack{
                        Text("ផ្ទេប្រាក់ពីអេបធនាគារផ្សេងរបស់អ្នក")
                            .padding(1)
                        Image(systemName: "info.circle")
                            .foregroundColor(.cyan)
                    }
                }
                .foregroundColor(.white)
                .padding(10)
                
                
                VStack{
                    ZStack{
                        Image("KHQR")
                            .resizable()
                            .scaledToFill()
//                            .aspectRatio(contentMode: .fill)
//                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .cornerRadius(10)
                                                
                        QRCode()
                            .padding(.top, 130)
                        
                        VStack(alignment: .leading){
                            Text("SOU PHALLIN")
                            Text("$0.00")
                        }
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                        .padding(.bottom, 210)
                        .padding(.trailing, 80)
                    }
                    
                    ZStack{
                        Button(action: {
                            
                        }){
                            HStack{
                                Image(systemName: "plus.circle")
                                Text("បញ្ចូលចំនួនទឹកប្រាក់")
                            }
                        }.padding(.vertical, 10)
                            .padding(.horizontal, 70)
                            .background(.white.opacity(0.15))
                            .cornerRadius(10)
                    }
                    
                    Text("ទទួលទៅ: 003 615 722 | USD")
                        .padding(5)
                }
                .padding(.top, 30)
                .font(.system(size: 17))
                .foregroundColor(.cyan)
                .frame(width: 300, height: 450)
                
                
                HStack(spacing: 50){
                    ButtonInQRView(image: "square.and.arrow.down", text: "ទាញយក")
                    ButtonInQRView(image: "qrcode.viewfinder", text: "ថតអេក្រង់")
                    ButtonInQRView(image: "link", text: "ផ្ញើលីង")
                }
                .foregroundColor(.white)
                .padding(.top, 50)
            }
            .font(.system(size: 20))

        }
    }
}

struct ButtonInQRView: View {
    var image: String
    var text: String
    var body: some View {
        VStack{
            Image(systemName: image)
                .font(.system(size: 30))
                .frame(width: 35, height: 35)
                .padding(10)
                .background(.white.opacity(0.2))
                .cornerRadius(100)
            Text(text)
                .font(.system(size: 15))
        }
    }
}

struct QRCode: View {
    @State private var text = "00020101021130450016abaakhppxxx@abaa01090036157220208ABA Bank40390006abaP2P0112DDCB0F40AAAD02090036157225204000053038405802KH5911SOU PHALLIN6010Phnom Penh6304EDC2"
    
    var body: some View {
        VStack {
            Image(uiImage: UIImage(data: generateQR(text: text)!)!)
                .resizable()
                .frame(width: 200, height: 200)
        }
    }
    func generateQR(text: String) -> Data? {
        let filter = CIFilter.qrCodeGenerator()
        guard let data = text.data(using: .ascii, allowLossyConversion: false) else { return nil }
        filter.message = data
        guard let ciimage = filter.outputImage else { return nil }
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledCIImage = ciimage.transformed(by: transform)
        let uiimage = UIImage(ciImage: scaledCIImage)
        return uiimage.pngData()!
    }
}

#Preview{
//    ProfileInfo()
    QRGenerator()
}
