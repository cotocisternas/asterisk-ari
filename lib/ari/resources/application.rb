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
  class Application < Resource

    attr_reader :name, :channel_ids, :bridge_ids, :endpoint_ids, :device_names


    # GET /applications
    #
    # Stasis applications
    #
    #
    def self.list(options = {})
      path = '/applications'
      response = client(options).get(path, options)
      response.map { |hash| Application.new(hash.merge(client: options[:client])) }
    end

    # GET /applications/%{applicationName}
    #
    # Stasis application
    #
    #
    # Parameters:
    #
    # applicationName (required) - Application's name
    #
    def self.get(options = {})
      raise ArgumentError.new("Parameter applicationName must be passed in options hash.") unless options[:applicationName]
      path = '/applications/%{applicationName}' % options
      response = client(options).get(path, options)
      Application.new(response.merge(client: options[:client]))
    end

    def get(options = {})
      self.class.get(options.merge(applicationName: self.id, client: @client))
    end

    # POST /applications/%{applicationName}/subscription
    #
    # Stasis application
    #
    #
    # Parameters:
    #
    # applicationName (required) - Application's name
    # eventSource (required) - URI for event source (channel:{channelId}, bridge:{bridgeId}, endpoint:{tech}[/{resource}], deviceState:{deviceName}
    #
    def self.subscribe(options = {})
      raise ArgumentError.new("Parameter applicationName must be passed in options hash.") unless options[:applicationName]
      raise ArgumentError.new("Parameter eventSource must be passed in options hash.") unless options[:eventSource]
      path = '/applications/%{applicationName}/subscription' % options
      response = client(options).post(path, options)
      Application.new(response.merge(client: options[:client]))
    end

    def subscribe(options = {})
      self.class.subscribe(options.merge(applicationName: self.id, client: @client))
    end

    # DELETE /applications/%{applicationName}/subscription
    #
    # Stasis application
    #
    #
    # Parameters:
    #
    # applicationName (required) - Application's name
    # eventSource (required) - URI for event source (channel:{channelId}, bridge:{bridgeId}, endpoint:{tech}[/{resource}], deviceState:{deviceName}
    #
    def self.unsubscribe(options = {})
      raise ArgumentError.new("Parameter applicationName must be passed in options hash.") unless options[:applicationName]
      raise ArgumentError.new("Parameter eventSource must be passed in options hash.") unless options[:eventSource]
      path = '/applications/%{applicationName}/subscription' % options
      response = client(options).delete(path, options)
      Application.new(response.merge(client: options[:client]))
    rescue Ari::RequestError => e
      raise unless e.code == '404'
    end

    def unsubscribe(options = {})
      self.class.unsubscribe(options.merge(applicationName: self.id, client: @client))
    end


  end
end

Ari::Client.send :define_method, 'applications' do
  Ari::ListResource.new(self, Ari::Application)
end
