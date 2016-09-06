require './spec/spec_helper'
require 'rack/lint'

module SeoNoindex
  describe Middleware do

    subject do
      Middleware.new(nil).send(:check_noindex, env)
    end

    let :env do
      {'REQUEST_URI' => url}
    end

    describe 'without robots file' do
      let(:url){ '/lorem/ipsum/dolor' }
      it { is_expected.to be false }
    end

    describe 'with robots txt' do

      before :each do
        allow(File).to receive(:read).and_return("
          Allow: /lorem
          Disallow: /ipsum
          Disallow: /*?dolor
          Disallow: /*&sit=
        ")
      end

      indexed = %w{
        /lorem/indexed
        /noindexed/lorem
        /indexed/ipsum
        /indexed?a=b&dolor=true
        /indexed?option=sit
      }

      noindexed = %w{
        /ipsum/no_indexed
        /no_indexed?dolor=false
        /indexed?a=b&sit=false
      }

      indexed.each do |current_url|
        context "for #{current_url} indexed" do
          let(:url){ current_url }
          it{ is_expected.to be false }
        end
      end

      noindexed.each do |current_url|
        context "for #{current_url} no indexed" do
          let(:url){ current_url }
          it{ is_expected.to be true }
        end
      end

    end
  end
end
