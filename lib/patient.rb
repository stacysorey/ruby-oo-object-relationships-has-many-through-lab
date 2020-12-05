class Patient

    attr_accessor :name

    @@all = []

    def initialize(name)
        #initializes with a name
        @name = name
        @@all << self
    end

    def self.all 
        #knows all patients
        @@all
    end

    def appointments
        #returns all appointments associated with this patient
        Appointment.all.select {|appt| appt.patient == self }
    end

    def doctors
        #has many doctors through appointments
        appointments.collect {|a| a.doctor }
    end 

    def new_appointment(date, doctor)
        #given a date and doctor, creates a new appointment
        #belonging to that patient
        Appointment.new(date, self, doctor)
    end
end