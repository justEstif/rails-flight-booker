class Flight < ApplicationRecord
  before_validation :calculate_duration, on: %i[create update]

  validates :end_time, presence: true
  validates :start_time, presence: true
  validate :validate_end_time_is_after_start_time
  validate :validate_departure_and_arrival_airports_are_different

  belongs_to :departure_airport, class_name: 'Airport', foreign_key: 'departure_airport_id'
  belongs_to :arrival_airport, class_name: 'Airport', foreign_key: 'arrival_airport_id'

  def self.search(search)
    return [] unless search.present?

    flights = Flight.all
    departure_airport = search[:departure_airport]
    arrival_airport = search[:arrival_airport]
    date_time = search[:date_time]

    flights = flights.where(departure_airport:) if departure_airport.present?
    flights = flights.where(arrival_airport:) if arrival_airport.present?
    flights = flights.where('start_time >= ?', DateTime.parse(date_time)) if date_time.present?
    flights
  end

  private

  def validate_departure_and_arrival_airports_are_different
    return unless departure_airport_id == arrival_airport_id

    errors.add(:departure_airport, 'must not be the same as the arrival airport')
  end

  def validate_end_time_is_after_start_time
    errors.add(:end_time, 'must be after the start time') unless end_time.after?(start_time)
  end

  def calculate_duration
    return if start_time.nil? || end_time.nil?

    self.duration = (end_time - start_time).to_i
  end
end
