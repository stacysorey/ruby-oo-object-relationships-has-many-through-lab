class Doctor

    attr_accessor :name

    @@all = []

    def initialize(name)
        #initializes with a name and adds itself to array
        #of all doctors
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def appointments
        #returns all appointments associated with this Doctor
        Appointment.all.select {|appt| appt.doctor == self}
    end

    def new_appointment(date, patient)
        #given a date and a patient, creates a new appointment
        Appointment.new(date, patient, self)
    end

    def patients
        #has many patients, through appointments
        appointments.collect {|a| a.patient}
    end

end
