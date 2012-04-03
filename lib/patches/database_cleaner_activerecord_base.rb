# https://github.com/bmabey/database_cleaner/issues/22
require 'database_cleaner'
require "database_cleaner/base"
require "database_cleaner/active_record/base"

module DatabaseCleaner

  class Base

    attr_accessor :model

    alias :old_initialize :initialize
    def initialize(orm, opts = {})
      old_initialize(orm, opts)
      @model = opts[:model]
    end

    alias :old_strategy= :strategy=
    def strategy=(args)
      self.old_strategy= args

      @strategy.model = self.model
      @strategy
    end

    alias :old_compare :==
    def ==(other)
      old_compare(other) && self.model == other.model
    end

  end

  module ActiveRecord
    module Base

      attr_accessor :model

      def connection_klass
        model.constantize
      end

    end
  end
end