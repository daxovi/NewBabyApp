import SwiftUI
import AVFoundation

struct WaveformView: View {
    let samples: [Float]
    let progress: Double
    let onSeek: (Double) -> Void
    let onSeekUpdate: (Double) -> Void
    let isPlaceholder: Bool
    let numberOfBars: Int // počet barů
    
    @State private var localProgress: Double? = nil
    @State private var placeholderSamples: [Float] = []
    
    private var currentSamples: [Float] {
        let baseSamples = samples.isEmpty ? placeholderSamples : samples
        return downsample(samples: baseSamples, targetCount: numberOfBars)
    }
    
    var body: some View {
        GeometryReader { geo in
            TimelineView(.animation) { timeline in
                let now = timeline.date.timeIntervalSinceReferenceDate
                let phase = CGFloat(now * 2) // rychlost posunu sinusovky
                
                ZStack(alignment: .leading) {
                    waveformPath(
                        width: geo.size.width,
                        height: geo.size.height,
                        color: isPlaceholder ? .gray.opacity(0.3) : .gray,
                        progress: 0,
                        phase: isPlaceholder ? phase : 0
                    )
                    
                    if !isPlaceholder {
                        waveformPath(
                            width: geo.size.width,
                            height: geo.size.height,
                            color: .pink,
                            progress: CGFloat(currentProgress(geo: geo)),
                            phase: 0
                        )
                    }
                }
            }
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
//                        guard !isPlaceholder else { return }
                        let rel = min(max(0, value.location.x / geo.size.width), 1)
                        localProgress = Double(rel)
                        onSeekUpdate(Double(rel))
                    }
                    .onEnded { value in
//                        guard !isPlaceholder else { return }
                        let rel = min(max(0, value.location.x / geo.size.width), 1)
                        localProgress = nil
                        onSeek(Double(rel))
                    }
            )
        }
        .frame(height: 48)
        .onAppear {
            if placeholderSamples.isEmpty {
                placeholderSamples = generatePlaceholderWaveform()
            }
        }
    }
    
    private func currentProgress(geo: GeometryProxy) -> Double {
        localProgress ?? progress
    }
    
    func waveformPath(width: CGFloat, height: CGFloat, color: Color, progress: CGFloat, phase: CGFloat) -> some View {
        let samplesData = currentSamples
        let count = samplesData.count
        let shown = Int(CGFloat(count) * progress)
        
        return Path { path in
            for i in 0..<count {
                let x = CGFloat(i) / CGFloat(count) * width
                var normalized = CGFloat(samplesData[i])
                
                if isPlaceholder {
                    let wave = sin(CGFloat(i) * 0.7 + phase) * 0.2
                    normalized = min(1, max(0, normalized + wave))
                }
                
                let barHeight = pow(normalized, isPlaceholder ? 1.0 : 6.0) * height
                if color == .pink && i >= shown { continue }
                if color == .black && i < shown { continue }
                path.move(to: CGPoint(x: x, y: height/2 - barHeight/2))
                path.addLine(to: CGPoint(x: x, y: height/2 + barHeight/2))
            }
        }
        .stroke(color, lineWidth: max(1, width / CGFloat(samplesData.count * 2)))
    }
    
    private func generatePlaceholderWaveform() -> [Float] {
        (0..<numberOfBars).map { _ in Float.random(in: 0.4...0.9) }
    }
    
    private func downsample(samples: [Float], targetCount: Int) -> [Float] {
        guard targetCount > 0, !samples.isEmpty else { return [] }
        
        let step = Double(samples.count) / Double(targetCount)
        var result: [Float] = []
        
        for i in 0..<targetCount {
            let start = Int(Double(i) * step)
            let end = min(Int(Double(i + 1) * step), samples.count)
            
            guard start < end else {
                result.append(samples[start % samples.count])
                continue
            }
            
            let chunk = samples[start..<end]
            let avg = chunk.reduce(0, +) / Float(chunk.count)
            result.append(avg)
        }
        
        return result
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 20) {
            MenuItemView(menuItem: .podcast(PodcastModel(title: "Ukázkový podcast", source: "Zdroj", fileName: "kojeni")))
        }
        .padding()
    }
    .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 1)
    .background(Color.background)
}
