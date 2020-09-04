class Patient
    attr_accessor :name

    @@all = []

    def initialize (name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment (date, doctor)
        Appointment.new(date, self, doctor)
    end

    def appointments
        Appointment.all.select { |appointment| appointment.patient == self }
    end

    def doctors
        my_doctors = []
        Appointment.all.select do |appointment|
            appointment.patient == self
            my_doctors << appointment.doctor
        end
        my_doctors
    end
     

end