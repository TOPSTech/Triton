public struct CarLockUseCase {
    private let repository: CarRepository

    init(repository: CarRepository) {
        self.repository = repository
    }

    public func lockMainCar(callback: (Bool) -> Void) {
        self.repository.car { car in
            self.lockCar(car: car) { newCar in
                callback(newCar.locked)
            }
        }
    }

    public func unlockMainCar(callback: (Bool) -> Void) {
        self.repository.car { car in
            self.unlockCar(car: car) { newCar in
                callback(newCar.locked == false)
            }
        }
    }

    public func lockCar(car: Car, callback: (Car) -> Void) {
        var car = car
        car.locked = true
        self.repository.updateCar(car: car, callback: callback)
    }

    public func unlockCar(car: Car, callback: (Car) -> Void) {
        var car = car
        car.locked = false
        self.repository.updateCar(car: car, callback: callback)
    }
}
