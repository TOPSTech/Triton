public final class CarRepository {
    private var car = Car(locked: false, id: "my_uuid")
    public func car(callback: (Car) -> Void) {
        callback(car)
    }

    public func updateCar(car: Car, callback: (Car) -> Void) {
        self.car = car
        self.car(callback: callback)
    }
}
