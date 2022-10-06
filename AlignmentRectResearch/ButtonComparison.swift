import SwiftUI

struct ButtonComparison: View {
    var body: some View {
        VStack {
            HStack {
                Button {} label: {
                    Label("Copy", systemImage: "doc.on.doc")
                }

                Button {} label: {
                    Label("More", systemImage: "ellipsis")
                }
                .tint(.red)
            }

            HStack {
                ButtonView(label: "Copy", systemImage: "doc.on.doc")
                    .fixedSize()

                ButtonView(label: "More", systemImage: "ellipsis", tint: .red)
                    .fixedSize()
            }
        }
        .buttonStyle(.borderedProminent)
    }
}

struct ButtonView: UIViewRepresentable {
    var label: String

    var systemImage: String

    var tint: UIColor?

    func makeUIView(context: Context) -> UIButton {
        var config = UIButton.Configuration.borderedProminent()
        config.title = label
        config.image = UIImage(systemName: systemImage)?.applyingSymbolConfiguration(.init(textStyle: .body))
        config.imagePadding = 8
        config.preferredSymbolConfigurationForImage = .init(scale: .medium)

        return UIButton(configuration: config)
    }

    func updateUIView(_ button: UIButton, context: Context) {
        button.tintColor = tint
    }
}


struct ButtonComparison_Previews: PreviewProvider {
    static var previews: some View {
        ButtonComparison()
    }
}
