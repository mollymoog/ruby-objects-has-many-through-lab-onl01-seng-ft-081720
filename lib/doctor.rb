class Doctor
    attr_accessor :name

    @@all = []

    def initialize (name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def appointments
        Appointment.all.select { |appointment| appointment.doctor == self }
    end

    def new_appointment (date, patient)
        Appointment.new(date, patient, self)
    end

    def patients
        my_patients = []
        Appointment.all.select do |appointment|
            appointment.doctor == self
            my_patients << appointment.patient
        end
        my_patients 
    end


end