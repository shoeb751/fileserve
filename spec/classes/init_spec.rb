require 'spec_helper'

describe 'fileserve', :type => 'class' do


  context "including the modules should not fail" do
    it { is_expected.to compile }
    it { is_expected.to compile.with_all_deps }

  end

  context "Creating directories should work" do 
    let(:title) { 'fileserve' }

    it { is_expected.to compile }
    it { is_expected.to compile.with_all_deps }

    it "Directory with defaults in hiera" do
      is_expected.to contain_file('/tmp/work/app')
        .with(ensure: 'directory')
        .with(mode: '0755')
        .with(owner: 'shoeb.c')
        .with(group: 'shoeb.c')
    end
  end

  context "Creating files should work" do 
    let(:title) { 'fileserve' }

    it { is_expected.to compile }
    it { is_expected.to compile.with_all_deps }
    it "File with content" do
      is_expected.to contain_file('/tmp/work/hosts')
        .with(content: 'Hello World')
        .with(ensure: 'present')
        .with(mode: '0644')
        .with(owner: 'shoeb.c')
        .with(group: 'shoeb.c')
    end

    it "File with source" do
      is_expected.to contain_file('/tmp/work/hosts_source')
        .with(source: 'puppet://module/fileserve/host')
        .with(ensure: 'present')
        .with(mode: '0644')
        .with(owner: 'shoeb.c')
        .with(group: 'shoeb.c')
    end
  end
end
