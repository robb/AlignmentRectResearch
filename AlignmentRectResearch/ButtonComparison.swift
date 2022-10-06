import SwiftUI

struct ButtonComparison: View {
    var body: some View {
        VStack {
            HStack {
                Button {} label: {
                    Label("Copy", systemImage: "doc.on.doc")
                }
                .background(Color.blue.opacity(0.4))

                Button {} label: {
                    Label("More", systemImage: "ellipsis")
                }
                .background(Color.red.opacity(0.4))
            }

            HStack {
                ButtonView(label: "Copy", systemImage: "doc.on.doc")
                    .fixedSize()
                    .background(Color.blue.opacity(0.4))

                ButtonView(label: "More", systemImage: "ellipsis")
                    .fixedSize()
                    .background(Color.red.opacity(0.4))
            }
        }
    }
}

struct ButtonView: UIViewRepresentable {
    var label: String

    var systemImage: String

    func makeUIView(context: Context) -> UIButton {
        var config = UIButton.Configuration.plain()
        config.title = label
        config.image = UIImage(systemName: systemImage)?.applyingSymbolConfiguration(.init(textStyle: .body))
        config.imagePadding = 16

        return UIButton(configuration: config)
    }

    func updateUIView(_ button: UIButton, context: Context) {

    }
}


struct ButtonComparison_Previews: PreviewProvider {
    static var previews: some View {
        ButtonComparison()
    }
}
