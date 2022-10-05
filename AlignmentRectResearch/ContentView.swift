import SwiftUI

struct ContentView: View {
    @State var uiImageView: Bool = false

    var body: some View {
        let uiImage = UIImage(named: "test")!

        VStack {
            let insets = uiImage.alignmentRectInsets

            Image("test")
                .overlay(alignment: .topLeading) {
                    Rectangle().stroke(.red)
                }
                .overlay(alignment: .topLeading) {
                    Text("`Image`")
                        .background(Rectangle().fill(.red))
                        .foregroundColor(.white)
                        .font(.caption)
                }

            Spacer()

            Toggle("Use `UIImageView`", isOn: $uiImageView)
                .padding()

            Spacer()

            if uiImageView {
                ImageView()
                    .fixedSize()
                    .overlay(alignment: .topLeading) {
                        Rectangle().stroke(.green)
                    }
                    .overlay(alignment: .topLeading) {
                        Text("`UIImageView`")
                            .background(Rectangle().fill(.green))
                            .foregroundColor(.white)
                            .font(.caption)
                    }
            } else {
                Image(uiImage: uiImage)
                    .padding(EdgeInsets(
                        top:      -insets.top,
                        leading:  -insets.left,
                        bottom:   -insets.bottom,
                        trailing: -insets.right
                    ))
                    .overlay(alignment: .topLeading) {
                        Rectangle().stroke(.orange)
                    }
                    .overlay(alignment: .topLeading) {
                        Text("`Image + padding`")
                            .background(Rectangle().fill(.orange))
                            .foregroundColor(.white)
                            .font(.caption)
                    }
            }

            Spacer()
        }
    }
}

struct ImageView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIImageView {
        UIImageView()
    }

    func updateUIView(_ uiView: UIImageView, context: Context) {
        uiView.image = UIImage(named: "test")
        uiView.frame.size = uiView.intrinsicContentSize
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
