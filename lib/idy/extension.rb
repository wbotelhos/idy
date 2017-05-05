# frozen_string_literal: true

module Idy
  module Extension
    extend ActiveSupport::Concern

    included do
      def idy
        self.class.idy_encode id
      end

      def idy_options
        self.class.idy_options
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
      def find(*args)
        query = [args.first].flatten

        if try(:idy?)
          if query.size == 1
            super idy_decode(query[0].to_s) || query[0]
          else
            super [query].flatten.map { |hash| idy_decode hash }
          end
        else
          super [query].flatten.size == 1 ? query[0] : query
        end
      end

      def idy(options = {})
        @options = options.reverse_merge(salt: idy_default_salt)

        define_singleton_method(:idy?) { true }
      end

      def idy_decode(hash, salt: self.salt)
        encoder(salt).decode(hash).first
      end

      def idy_default_salt
        alphabet = Array('a'..'z')

        indexes = name.downcase.split('').map do |char|
          alphabet.index(char) + 1
        end

        indexes.shift(10).join
      end

      def idy_encode(id, salt: self.salt)
        return unless id

        encoder(salt).encode id
      end

      def idy_options
        @options || { salt: idy_default_salt }
      end

      def salt
        idy_options[:salt]
      end

      private

      def encoder(salt)
        Hashids.new salt.to_s
      end
    end
  end
end
