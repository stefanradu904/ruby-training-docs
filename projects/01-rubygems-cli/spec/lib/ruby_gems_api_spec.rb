require 'spec_helper'
require './lib/ruby_gems_api'

RSpec.describe RubyGemsApi do
  subject(:api) { described_class }

  describe '.get_gem_info' do
    subject(:get_gem_info) { api.get_gem_info(gem_name) }

    context 'when the gem exists' do
      let(:gem_name) { 'rspec' }
      it 'returns rpsec info' do
        result = RubyGemsApi.get_gem_info(gem_name)
        expect(result['name']).to eq "rspec"
        expect(result['info']).to eq "BDD for Ruby"
      end
    end

    context 'when the gem does not exist' do
      let(:gem_name) { 'not_existing_gem' }
      it 'raises GemNotFound' do
        expect {get_gem_info}.to raise_error(GemNotFound)
      end
    end
  end

  describe 'Search valid keyword' do
    let(:keyword) { "ana" }
    it 'returns array of 30 gems found' do
      result = RubyGemsApi.search_gems(keyword)
      expect(result.size).to eq 30
    end
  end

  describe 'Search an invalid keyword' do
    let(:keyword) { "invalid_keyword" }
    it 'returns empty array' do
      result = RubyGemsApi.search_gems(keyword)
      expect(result.size).to eq 0
    end
  end
end