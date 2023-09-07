//
//  TestSwiftUIView.swift
//  NearTruck
//
//  Created by 윤형찬 on 2023/09/06.
//

import SwiftUI
import iNaviMaps

struct TruckMapViewController: View {
    @ObservedObject var viewModel: TruckMapViewModel
    
    var body: some View {
        VStack {
            topBar
            Spacer()
            VStack {
                Text(viewModel.titleText)
                MapViewRepresentable(viewModel: viewModel)
                                .frame(width: 300, height: 300)
            }
            Spacer()
        }
        .onReceive(viewModel.$toastMessage) { msg in
            iToast.show(msg)
        }
    }
    
    var topBar: some View {
        HStack {
            Button(action: {
                viewModel.goBack()
            }) {
                Image("icon_back")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
            }
            Spacer()
            Text("타이틀")
            Spacer()
            Color.clear
                .frame(width: 30, height: 30)
        }
        .padding()
    }
}

struct TestSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TruckMapViewController(viewModel: TruckMapViewModel())
    }
}
