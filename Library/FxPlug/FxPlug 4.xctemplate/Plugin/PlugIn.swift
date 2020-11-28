//___FILEHEADER___

@objc(___PACKAGENAMEASIDENTIFIER___PlugIn) class ___PACKAGENAMEASIDENTIFIER___PlugIn : NSObject, FxTileableEffect {
    
    let _apiManager : PROAPIAccessing!
    
    required init?(apiManager: PROAPIAccessing) {
        _apiManager = apiManager
    }
    
    func addParameters() throws {
        let paramAPI = _apiManager!.api(for: FxParameterCreationAPI_v5.self) as! FxParameterCreationAPI_v5
        
        paramAPI.addFloatSlider(withName: "Brightness", parameterID: 1, defaultValue: 1.0, parameterMin: 0.0, parameterMax: 100.0, sliderMin: 0.0, sliderMax: 5.0, delta: 0.1, parameterFlags: FxParameterFlags(kFxParameterFlag_DEFAULT))
    }
    
    func properties(_ properties: AutoreleasingUnsafeMutablePointer<NSDictionary>?) throws {
        let swiftProps = [
            kFxPropertyKey_IsThreadSafe : NSNumber(booleanLiteral: true),
            kFxPropertyKey_MayRemapTime : NSNumber(booleanLiteral: false),
            kFxPropertyKey_PixelTransformSupport : NSNumber(value: kFxPixelTransform_Full),
            kFxPropertyKey_VariesWhenParamsAreStatic: NSNumber(booleanLiteral: false)
        ]
        let props = NSDictionary(dictionary: swiftProps)
        properties?.pointee = props
    }
    
    func pluginState(_ pluginState: AutoreleasingUnsafeMutablePointer<NSData>?, at renderTime: CMTime, quality qualityLevel: UInt) throws {
        let paramAPI = _apiManager!.api(for: FxParameterRetrievalAPI_v6.self) as! FxParameterRetrievalAPI_v6
        
        var brightness = 1.0
        paramAPI.getFloatValue(UnsafeMutablePointer<Double>(&brightness), fromParameter: 1, at: renderTime)
        
        pluginState?.pointee = NSData.init(bytes: &brightness, length: MemoryLayout.size(ofValue: brightness))
    }
    
    func destinationImageRect(_ destinationImageRect: UnsafeMutablePointer<FxRect>, sourceImages: [FxImageTile], destinationImage: FxImageTile, pluginState: Data?, at renderTime: CMTime) throws {
        destinationImageRect.pointee = sourceImages[0].imagePixelBounds
    }
    
    func sourceTileRect(_ sourceTileRect: UnsafeMutablePointer<FxRect>, sourceImageIndex: UInt, sourceImages: [FxImageTile], destinationTileRect: FxRect, destinationImage: FxImageTile, pluginState: Data?, at renderTime: CMTime) throws {
        sourceTileRect.pointee = destinationTileRect;
    }
    
    func renderDestinationImage(_ destinationImage: FxImageTile, sourceImages: [FxImageTile], pluginState: Data?, at renderTime: CMTime) throws {
        // Get the brightness from our plug-in state
        let brightness  = pluginState!.withUnsafeBytes { (ptr: UnsafePointer<Double>) -> Double in
            return ptr.pointee
        }
        
        let deviceCache = MetalDeviceCache.deviceCache
        let pixelFormat = MetalDeviceCache.FxMTLPixelFormat(for: destinationImage)
        let commandQueue = deviceCache.commandQueue(with: sourceImages[0].deviceRegistryID, pixelFormat: pixelFormat)!

        let commandBuffer = commandQueue.makeCommandBuffer()!
        commandBuffer.label = "___PACKAGENAMEASIDENTIFIER___ Command Buffer"
        commandBuffer.enqueue()
        
        let inputTexture = sourceImages[0].metalTexture(for: deviceCache.device(with: sourceImages[0].deviceRegistryID))
        let outputTexture = destinationImage.metalTexture(for: deviceCache.device(with: destinationImage.deviceRegistryID))
        
        let colorAttachmentDescriptor = MTLRenderPassColorAttachmentDescriptor.init()
        colorAttachmentDescriptor.texture = outputTexture
        colorAttachmentDescriptor.clearColor = MTLClearColorMake(1.0, 0.5, 0.0, 1.0)
        colorAttachmentDescriptor.loadAction = MTLLoadAction.clear
        let renderPassDescriptor = MTLRenderPassDescriptor.init()
        renderPassDescriptor.colorAttachments [ 0 ] = colorAttachmentDescriptor
        let commandEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDescriptor)!
        
        // Do rendering
        let outputWidth = destinationImage.tilePixelBounds.right - destinationImage.tilePixelBounds.left
        let outputHeight = destinationImage.tilePixelBounds.top - destinationImage.tilePixelBounds.bottom
        var vertices = [
            Vertex2D(position: vector_float2(Float(outputWidth) / 2.0, Float(-outputHeight) / 2.0), textureCoordinate: vector_float2(1.0, 1.0)),
            Vertex2D(position: vector_float2(Float(-outputWidth) / 2.0, Float(-outputHeight) / 2.0), textureCoordinate: vector_float2(0.0, 1.0)),
            Vertex2D(position: vector_float2(Float(outputWidth) / 2.0, Float(outputHeight) / 2.0), textureCoordinate: vector_float2(1.0, 0.0)),
            Vertex2D(position: vector_float2(Float(-outputWidth) / 2.0, Float(outputHeight) / 2.0), textureCoordinate: vector_float2(0.0, 0.0))
        ]
        
        let viewport = MTLViewport(originX: 0, originY: 0, width: Double(outputWidth), height: Double(outputHeight), znear: -1.0, zfar: 1.0)
        commandEncoder.setViewport(viewport)
        
        let pipelineState = deviceCache.pipelineState(with: sourceImages[0].deviceRegistryID, pixelFormat: pixelFormat)
        commandEncoder.setRenderPipelineState(pipelineState!)
        
        commandEncoder.setVertexBytes(&vertices, length: MemoryLayout<Vertex2D>.size * 4, index: Int(BVI_Vertices.rawValue))
        
        var viewportSize = simd_uint2(UInt32(outputWidth), UInt32(outputHeight))
        commandEncoder.setVertexBytes(&viewportSize, length: MemoryLayout.size(ofValue: viewportSize), index: Int(BVI_ViewportSize.rawValue))
        
        commandEncoder.setFragmentTexture(inputTexture, index: Int(BTI_InputImage.rawValue))
        
        var fragmentBrightness = Float(brightness)
        commandEncoder.setFragmentBytes(&fragmentBrightness, length: MemoryLayout.size(ofValue: fragmentBrightness), index: Int(BFI_Brightness.rawValue))
        
        commandEncoder.drawPrimitives(type: MTLPrimitiveType.triangleStrip, vertexStart: 0, vertexCount: 4)
        
        // Clean up
        commandEncoder.endEncoding()
        commandBuffer.commit()
        commandBuffer.waitUntilCompleted()
        
        deviceCache.returnCommandQueueToCache(commandQueue: commandQueue)
    }

}

