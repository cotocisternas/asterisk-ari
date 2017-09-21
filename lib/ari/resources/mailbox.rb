#------------------------------------------------------------------------------
#
#  WARNING !
#
#  This is a generated file. DO NOT EDIT THIS FILE! Your changes will
#  be lost the next time this file is regenerated.
#
#  This file was generated using asterisk-ari-client ruby gem.
#
#------------------------------------------------------------------------------

module Ari
  class Mailbox < Resource

    attr_reader :name, :old_messages, :new_messages


    # GET /mailboxes
    #
    # Mailboxes
    #
    #
    def self.list(options = {})
      path = '/mailboxes'
      response = client(options).get(path, options).body
      response.map { |hash| Mailbox.new(hash.merge(client: options[:client])) }
    end

    # GET /mailboxes/%{mailboxName}
    #
    # Mailbox state
    #
    #
    # Parameters:
    #
    # mailboxName (required) - Name of the mailbox
    #
    def self.get(options = {})
      raise ArgumentError.new("Parameter mailboxName must be passed in options hash.") unless options[:mailboxName]
      path = '/mailboxes/%{mailboxName}' % options
      response = client(options).get(path, options).body
      Mailbox.new(response.merge(client: options[:client]))
    end

    def get(options = {})
      self.class.get(options.merge(mailboxId: self.id, client: @client))
    end

    # PUT /mailboxes/%{mailboxName}
    #
    # Mailbox state
    #
    #
    # Parameters:
    #
    # mailboxName (required) - Name of the mailbox
    # oldMessages (required) - Count of old messages in the mailbox
    # newMessages (required) - Count of new messages in the mailbox
    #
    def self.update(options = {})
      raise ArgumentError.new("Parameter mailboxName must be passed in options hash.") unless options[:mailboxName]
      raise ArgumentError.new("Parameter oldMessages must be passed in options hash.") unless options[:oldMessages]
      raise ArgumentError.new("Parameter newMessages must be passed in options hash.") unless options[:newMessages]
      path = '/mailboxes/%{mailboxName}' % options
      response = client(options).put(path, options).body
    end

    def update(options = {})
      self.class.update(options.merge(mailboxId: self.id, client: @client))
    end

    # DELETE /mailboxes/%{mailboxName}
    #
    # Mailbox state
    #
    #
    # Parameters:
    #
    # mailboxName (required) - Name of the mailbox
    #
    def self.delete(options = {})
      raise ArgumentError.new("Parameter mailboxName must be passed in options hash.") unless options[:mailboxName]
      path = '/mailboxes/%{mailboxName}' % options
      response = client(options).delete(path, options).body
    rescue Ari::RequestError => e
      raise unless e.code == '404'
    end

    def delete(options = {})
      self.class.delete(options.merge(mailboxId: self.id, client: @client))
    end


  end
end

Ari::Client.send :define_method, 'mailboxes' do
  Ari::ListResource.new(self, Ari::Mailbox)
end
