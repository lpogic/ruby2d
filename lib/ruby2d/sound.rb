# frozen_string_literal: true

# Ruby2D::Sound

module Ruby2D
  # Sounds are intended to be short samples, played without interruption, like an effect.
  class Sound
    attr_reader :path
    attr_accessor :data

    #
    # Load a sound from a file
    # @param [String] path File to load the sound from
    # @raise [Error] if file cannot be found or music could not be successfully loaded.
    def initialize(path)
      raise Error, "Cannot find audio file `#{path}`" unless File.exist? path

      @path = path
      raise Error, "Sound `#{@path}` cannot be created" unless ext_init(@path)
    end

    # Play the sound
    def play
      ext_play
    end

    # Returns the length in seconds
    def length
      ext_length
    end

    # Get the volume of the sound
    def volume
      ext_get_volume
    end

    # Set the volume of the sound
    def volume=(volume)
      # Clamp value to between 0-100
      ext_set_volume(volume.clamp(0, 100))
    end

    # Get the volume of the sound mixer
    def self.mix_volume
      ext_get_mix_volume
    end

    # Set the volume of the sound mixer
    def self.mix_volume=(volume)
      # Clamp value to between 0-100
      ext_set_mix_volume(volume.clamp(0, 100))
    end
  end
end
