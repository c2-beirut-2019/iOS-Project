//
//  AHTabbedView.swift
//  Animal House
//
//  Created by Roy Geagea on 8/14/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct AHTabbedView: View {
    @State private var selection = 1
     
    @State var selectedDoctor = ""
    
     var body: some View {
            TabView {
                NewsListPage(viewModel: NewsListViewViewModel())
                .tabItem {
                    Image("news")
                    Text("News")
                }
                PetsToAdoptListPage(viewModel: PetsToAdoptListViewModel())
                .tabItem {
                    Image("dog")
                    Text("Pets")
                }
                DoctorsListPage(viewModel: DoctorsListViewViewModel(), selectedDoctor: self.$selectedDoctor)
                .tabItem {
                    Image("doc")
                    Text("Doctors")
                }
                AppointmentsListPage(viewModel: ApointmentsListViewViewModel())
                .tabItem {
                    Image("calendar")
                    Text("Appointments")
                }
                if UserDefaultsManager.shared.isUserADoctor() {
                    DoctorProfilePage(viewModel: DoctorPageViewModel())
                    .tabItem {
                        Image("profile")
                        Text("My Profile")
                    }
                }
                else {
                    ClientProfilePage(viewModel: ProfilePageViewModel())
                    .tabItem {
                        Image("profile")
                        Text("My Profile")
                    }
                }
            }
            .accentColor(.green)
            .edgesIgnoringSafeArea(.top)
     }
}

#if DEBUG
struct AHTabbedView_Previews: PreviewProvider {
    static var previews: some View {
        AHTabbedView()
    }
}
#endif
