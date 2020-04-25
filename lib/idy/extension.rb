# frozen_string_literal: true

module Idy
  module Extension
    extend ActiveSupport::Concern

    included do
      def idy
        self.class.idy_encode id
      end

      def salt
        self.class.salt
      end

      def to_param
        return super unless self.class.respond_to?(:idy?)

        self.class.idy_encode id
      end
    end

    module ClassMethods
      def findy(hash)
        find_by id: idy_decode(hash)
      end

      def findy!(hash)
        record = find_by(id: idy_decode(hash))

        not_found!(hash) if record.nil?

        record
      end

      def idy(options = {})
        @idy_options = options.reverse_merge(salt: idy_default_salt)

        define_singleton_method(:idy?) { true }
      end

      def idy_decode(hash, salt: self.salt)
        encoder(salt).decode(hash).first
      end

      def idy_default_salt
        alphabet = Array('a'..'z')

        indexes = name.downcase.split('').map do |char|
          index = alphabet.index(char)
          index ? index + 1 : nil
        end

        indexes.compact.shift(10).join
      end

      def idy_encode(id, salt: self.salt)
        return unless id

        encoder(salt).encode id
      end

      def idy_options
        @idy_options || { salt: idy_default_salt }
      end

      def salt
        idy_options[:salt]
      end

      private

      def encoder(salt)
        Hashids.new salt.to_s
      end

      def not_found!(hash)
        raise ActiveRecord::RecordNotFound, "Couldn't find User with 'idy'=#{hash.inspect}"
      end
    end
  end
end
