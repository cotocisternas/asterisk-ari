#------------------------------------------------------------------------------
#
#  WARNING !
#
#  This is a generated file. DO NOT EDIT THIS FILE! Your changes will
#  be lost the next time this file is regenerated.
#
#  This file was generated using asterisk-ari ruby gem.
#
#------------------------------------------------------------------------------

module Ari
  class BridgeMerged < Event

    attr_reader :bridge, :bridge_from

    def bridge=(val)
      @bridge ||= Bridge.new(val)
    end

    def bridge_from=(val)
      @bridge_from ||= Bridge.new(val)
    end


  end
end
