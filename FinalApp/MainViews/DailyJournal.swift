import SwiftUI

struct CalendarView: View {
    @Binding var UserID: String
    @State private var color: Color = .blue
    @State private var date = Date.now
    @State var RedDays = [Date().startOfDay]
    @State var GreenDays = [Date]()
    let daysOfWeek = Date.capitalizedFirstLettersOfWeekdays
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    @State private var days: [Date] = []
    var body: some View {
        NavigationView{
            VStack {
                LabeledContent("Calendar Color") {
                    ColorPicker("", selection: $color, supportsOpacity: false)
                }
                LabeledContent("Date/Time") {
                    DatePicker("", selection: $date, displayedComponents: [.date])
                }
                HStack {
                    ForEach(daysOfWeek.indices, id: \.self) { index in
                        Text(daysOfWeek[index])
                            .fontWeight(.black)
                            .foregroundStyle(color)
                            .frame(maxWidth: .infinity)
                    }
                }
                LazyVGrid(columns: columns) {
                    ForEach(days, id: \.self) { day in
                        //for none days of the month
                        if day.monthInt != date.monthInt {
                            NavigationLink(destination:DailyJournalNotes(day: day)){
                                Text(day.formatted(.dateTime.day()))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.black.opacity(0.6))
                                    .frame(maxWidth: .infinity, minHeight: 40)
                                    .background(
                                        Circle()
                                            .foregroundStyle(
                                                .black.opacity(0.3)
                                            )
                                    )
                            }
                        } else {
                            NavigationLink(destination:DailyJournalNotes(day: day)){
                                Text(day.formatted(.dateTime.day()))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.secondary)
                                    .frame(maxWidth: .infinity, minHeight: 40)
                                    .background(
                                        Circle()
                                            .foregroundStyle(
                                                //will allow for changing of colors
                                                RedDays.contains(day.startOfDay)
                                                ? .red.opacity(0.3)
                                                : .blue.opacity(0.3)
//                                                Date.now.startOfDay == day.startOfDay
//                                                ? .red.opacity(0.3)
//                                                :  color.opacity(0.3)
                                            )
                                    )
                            }
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .onAppear {
                days = date.calendarDisplayDays
            }
            .onChange(of: date) {
                days = date.calendarDisplayDays
            }
        }
    }
    
}

//#Preview {
//    CalendarView()
//}
