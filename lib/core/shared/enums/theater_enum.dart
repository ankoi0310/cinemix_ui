enum TheaterState { active, closed }

extension TheaterStateX on String {
  TheaterState toTheaterState() {
    switch (toLowerCase()) {
      case 'active':
        return TheaterState.active;
      case 'closed':
        return TheaterState.closed;
      default:
        throw Exception('Invalid TheaterState');
    }
  }
}
