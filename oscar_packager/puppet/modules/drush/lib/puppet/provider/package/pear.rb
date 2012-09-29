# Puppet PHP PEAR Package support
#
# Originally forked from https://gist.github.com/305778 by jvc26
#
# == Instructions for use:
#     This file should be put within {module}/lib/puppet/provider/package/pear.rb
#
#     In order for it to be loaded, you require pluginsync=true set within your puppet.conf

require 'puppet/provider/package'

# PHP PEAR support.
Puppet::Type.type(:package).provide :pear, :parent => Puppet::Provider::Package do
  desc "PHP PEAR support. By default uses the installed channels, but you
        can specify the path to a pear package via ``source``."
  
  has_feature :versionable
  has_feature :upgradeable
  
  commands :pearcmd => "pear"

  def self.pearlist(hash)
    command = [command(:pearcmd), "list", "-a"]

    begin
      list = execute(command).collect do |set|
        if hash[:justme]
          if  set =~ /^hash[:justme]/
            if pearhash = pearsplit(set)
              pearhash[:provider] = :pear
              pearhash
            else
              nil
            end
          else
            nil
          end
        else
          if pearhash = pearsplit(set)
            pearhash[:provider] = :pear
            pearhash
          else
            nil
          end
        end

      end.reject { |p| p.nil? }
    rescue Puppet::ExecutionFailure => detail
      raise Puppet::Error, "Could not list pears: %s" % detail
    end

    if hash[:justme]
      return list.shift
    else
      return list
    end
  end

  def self.pearsplit(desc)
    case desc
    when /^INSTALLED/: return nil
    when /^=/: return nil
    when /^PACKAGE/: return nil
    when /^$/: return nil
    when /^\(no packages installed\)$/: return nil
    when /^(\S+)\s+([.\d]+)\s+\S+\n/
      name = $1
      version = $2
      return {
        :name => name,
        :ensure => version
      }
    else
      Puppet.warning "Could not match %s" % desc
      nil
    end
  end

  def self.instances
    pearlist(:local => true).collect do |hash|
      new(hash)
    end
  end
  
  def self.channellist
    command = [command(:pearcmd), "list-channels"]
    list = execute(command).collect do |set|
      if channelhash = channelsplit(set)
        channelhash
      else
        nil
      end
    end.reject { |p| p.nil? }
    list
  end
  
  def self.channelsplit(desc)
    case desc
    when /^Registered/: return nil
    when /^=/: return nil
    when /^Channel/: return nil
    when /^\s+/: return nil
    when /^(\S+)/
      $1
    else
      Puppet.warning "Could not match %s" % desc
      nil
    end
  end

  def install(useversion = true)
    
    command = ["upgrade", "--force"]
    
    # Channel provided
    if source = @resource[:source]
      
      match = source.match(/^([^\/]+)(?:\/(.*))?$/)
      
      if match
        channel = match[1]
        package = match[2]
      end
      
      # Check if channel is available, if not, discover
      if match and !self.class.channellist().include?(channel)
        execute([command(:pearcmd), "channel-discover", channel])
      end
      
      # Check if package is named in source, if not, use hash and append
      if match and (package.nil? or package.empty?) and (! @resource.should(:ensure).is_a? Symbol) and useversion
        source = source + "/#{@resource[:name]}-#{@resource.should(:ensure)}"
      end
      
      command << source

    # Default channel
    else
      if (!@resource.should(:ensure).is_a? Symbol) and useversion
        command << "#{@resource[:name]}-#{@resource.should(:ensure)}"
      else
        command << @resource[:name]
      end
    end

    pearcmd(*command)
  end

  def latest
    # This always gets the latest version available.
    version = ''
    command = [command(:pearcmd), "remote-info", @resource[:name]]
      list = execute(command).collect do |set|
      if set =~ /^Latest/
        version = set.split[1]
      end
    end
    return version
  end

  def query
    self.class.pearlist(:justme => @resource[:name])
  end

  def uninstall
    output = pearcmd "uninstall", @resource[:name]
    if output =~ /^uninstall ok/
    else
      raise Puppet::Error, output
    end
  end

  def update
    self.install(false)
  end
end
