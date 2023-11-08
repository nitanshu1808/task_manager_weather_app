require 'rails_helper'

RSpec.describe WeatherService do
  describe 'CONSTANTS' do
    subject { described_class::WEATHER_API_URL }

    let(:ap_url) do
      'https://api.openweathermap.org/data/3.0/onecall/timemachine'.freeze
    end

    it { is_expected.to eql(ap_url) }
  end

  describe '.fetch' do
    subject { described_class.fetch({}) }

    context 'when triggering a request to open weather' do
      let(:response_body) do
        [{ 'temp' => 8.92, 'humidity' => 94, 'wind_speed' => 3.44 }]
      end

      before do
        allow(described_class).to receive(:get).and_return(double(
          code: 200, parsed_response: response_body, success?: true
        ))
      end

      it { is_expected.to eql(response_body) }
    end
  end
end
