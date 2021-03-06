class Patient

  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name

    @@all << self
  end

  def new_appointment(doctor, date)
    Appointment.new(date, doctor, self)
  end

  def appointments
    Appointment.all.select do |appointment|
      appointment.patient = self
    end
  end

  def doctors
    self.appointments.map do |appointment|
      appointment.doctor
    end
  end

  def self.all
    @@all
  end

end
