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
  class StasisStart < Event

    attr_reader :args, :channel, :replace_channel

    def channel=(val)
      @channel ||= Channel.new(val)
    end

    def replace_channel=(val)
      @replace_channel ||= Channel.new(val)
    end


  end
end
