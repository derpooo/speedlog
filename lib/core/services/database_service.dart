import '../models/driver_model.dart';

class DatabaseService {
  List<Driver> getDrivers() {
    return [
      Driver(name: "João Pedro", vehicle: "Volkswagen Gol", categories: ["Mercado", "Saúde"]),
      Driver(name: "Ana Souza", vehicle: "Fiat Strada", categories: ["Pets", "Móveis/Eletrodomésticos"]),
    ];
  }
}
