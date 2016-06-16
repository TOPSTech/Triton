public struct TritonKitModule {
    public init() {}

    public lazy var carLockUseCase: CarLockUseCase = {
        return CarLockUseCase(repository: self.carRepository)
    }()

    private lazy var carRepository: CarRepository = {
        return CarRepository()
    }()
}
