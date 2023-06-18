//
//  FilterBanner.swift
//  04myls-Filter-app
//
//  Created by 04myls on R 5/06/18.
//

import Foundation
import SwiftUI
import Combine

struct FilterBannerView: View {
    @Binding var isShowBanner: Bool
    @Binding var applyingFilter: FilterType?
    @State private var selectingFilter: FilterType? = nil
    let bottomSafeAreaInsets: CGFloat
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Spacer()
                VStack {
                    FilterTitleView(title: selectingFilter?.rawValue)
                    if isShowBanner {
                        FilterIconContainerView(selectingFilter: $selectingFilter)
                    }
                    FilterButtonContainerView(isShowBanner: $isShowBanner,
                                              selectingFilter: $selectingFilter,
                                              applyingFilter: $applyingFilter)
                }
                .background(Color.black.opacity(0.8))
                .foregroundColor(.white)
                .offset(x: 0, y: self.isShowBanner ? 0 : geometry.size.height)
                Rectangle()
                    .foregroundColor(Color.black.opacity(0.8))
                    .frame(height: bottomSafeAreaInsets)
                    .edgesIgnoringSafeArea(.bottom)
                    .offset(x: 0, y: self.isShowBanner ? 0 : geometry.size.height)
            }
        }
    }
}

struct FilterPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        FilterBannerView(isShowBanner: .constant(true), applyingFilter: .constant(.gaussianBlur), bottomSafeAreaInsets: 32.0)
            .edgesIgnoringSafeArea(.bottom)
    }
}

struct FilterTitleView: View {
    let title: String?
    var body: some View {
        Text("\(title ?? "フィルターを選択")")
            .font(.title)
            .fontWeight(.bold)
            .padding(.top)
    }
}

struct FilterIconContainerView: View {
    @Binding var selectingFilter: FilterType?
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                FilterImage(filterType: .pixellate, selectingFilter: $selectingFilter)
                FilterImage(filterType: .sepiaTone, selectingFilter: $selectingFilter)
                FilterImage(filterType: .sharpenLuminance, selectingFilter: $selectingFilter)
                FilterImage(filterType: .photoEffectMono, selectingFilter: $selectingFilter)
                FilterImage(filterType: .gaussianBlur, selectingFilter: $selectingFilter)
            }
            .padding([.leading, .trailing], 16)
        }
    }
}

struct FilterButtonContainerView: View {
    @Binding var isShowBanner: Bool
    @Binding var selectingFilter: FilterType?
    @Binding var applyingFilter: FilterType?
    var body: some View {
        HStack {
            Button(action: {
                withAnimation {
                    isShowBanner = false
                    selectingFilter = nil
                }
            }) {
                Image(systemName: "xmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .padding()
            }
            Spacer()
            Button(action: {
                withAnimation {
                    isShowBanner = false
                    applyingFilter = selectingFilter
                    selectingFilter = nil
                }
            }) {
                Image(systemName: "checkmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .padding()
            }
        }
    }
}
