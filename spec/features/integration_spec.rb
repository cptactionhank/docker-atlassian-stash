require 'uri'
require 'timeout'
require 'docker'

describe "Atlassian Stash acceptance" do

  let(:regex_severe)  { /SEVERE|FATAL/  }
  let(:regex_warn)    { /WARNING|WARN/  }
  let(:regex_error)   { /ERROR/         }
  let(:regex_startup) { /Server startup in \d+ ms/  }
  let(:regex_filter)  { /no defaultDS datasource/   }

  before(:all) do
    @uri = URI.parse Docker.url
    @info = Docker::Container.get($container.id).info rescue nil
    expect(@info).to_not be_nil
  end

  context "when container is running" do

    it "has the container running" do
      expect(@info["State"]).to include("Running" => true)
    end

    it "has port 7990 (web) mapped" do
      port = @info["NetworkSettings"]["Ports"]["7990/tcp"].first["HostPort"] rescue nil
      expect(port).to_not be_nil
    end

    it "has port 7999 (ssh) mapped" do
      port = @info["NetworkSettings"]["Ports"]["7999/tcp"].first["HostPort"] rescue nil
      expect(port).to_not be_nil
    end

  end

  context "when Atlassian Stash is running" do

    it "has started" do
      expect {wait_stdout regex_startup}.not_to raise_error
    end

    it "has no severe in the stdout" do
      expect(scan_stdout regex_severe).to be_empty
    end

    it "has no warning in the stdout" do
      expect((scan_stdout regex_warn).select{|v| v !~ regex_filter}).to be_empty
    end

    it "has no error in the stdout" do
      expect(scan_stdout regex_error).to be_empty
    end

  end

  context "when Atlassian Stash is shut down" do

    it "has shut down" do
      # send term signal and expect container to shut down
      $container.kill
      # give the container up to 60 seconds to successfully shutdown
      expect($container.wait 60).to including("StatusCode" => 0, "StatusCode" => -1)
    end

    it "has no severe in the stdout" do
      expect(scan_stdout regex_severe).to be_empty
    end

    it "has no warning in the stdout" do
      expect((scan_stdout regex_warn).select{|v| v !~ regex_filter}).to be_empty
    end

    it "has no errors in the stdout" do
      expect(scan_stdout regex_error).to be_empty
    end

  end

end
