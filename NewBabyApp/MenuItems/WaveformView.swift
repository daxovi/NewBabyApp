import SwiftUI
import AVFoundation

struct WaveformView: View {
    let samples: [Float] // Normalizované hodnoty 0...1
    let progress: Double // 0...1
    let onSeek: (Double) -> Void
    
    @GestureState private var dragLocation: CGFloat? = nil
    @State private var localProgress: Double? = nil
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                // Černá část (nepřehraná)
                waveformPath(width: geo.size.width, height: geo.size.height, color: .gray, progress: 0)
                // Růžová část (přehraná)
                waveformPath(width: geo.size.width, height: geo.size.height, color: .pink, progress: CGFloat(currentProgress(geo: geo)))
            }
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        let rel = min(max(0, value.location.x / geo.size.width), 1)
                        localProgress = Double(rel)
                    }
                    .onEnded { value in
                        let rel = min(max(0, value.location.x / geo.size.width), 1)
                        localProgress = nil
                        onSeek(Double(rel))
                    }
            )
        }
        .frame(height: 48)
    }
    
    private func currentProgress(geo: GeometryProxy) -> Double {
        localProgress ?? progress
    }
    
    func waveformPath(width: CGFloat, height: CGFloat, color: Color, progress: CGFloat) -> some View {
        let count = samples.count
        let shown = Int(CGFloat(count) * progress)
        return Path { path in
            for i in 0..<count {
                let x = CGFloat(i) / CGFloat(count) * width
                let y = (1 - CGFloat(samples[i])) * height / 2
                let barHeight = CGFloat(samples[i]) * height
                if color == .pink && i >= shown { continue }
                if color == .black && i < shown { continue }
                path.move(to: CGPoint(x: x, y: height/2 - barHeight/2))
                path.addLine(to: CGPoint(x: x, y: height/2 + barHeight/2))
            }
        }
        .stroke(color, lineWidth: max(1, width / CGFloat(samples.count * 2)))
    }
}
