require 'rails_helper'

RSpec.describe TaskAdaptor do
  subject { task_adaptor_instance.build }

  before { WebMock.disable_net_connect! }

  let(:task_adaptor_instance) { described_class.new(user) }

  context 'when there is task associated with a user' do
    let(:user) { build_stubbed(:user) }

    it { is_expected.to be_empty }
  end

  context 'when there is task associated with a user' do
    let(:user) { create(:location).user }
    let!(:task) { create(:task, user: user) }
    let(:expected_response) do
      [{
        title: task.title,
        description: task.description,
        due_date: task.due_date.strftime('%d/%m/%Y'),
        weather: data,
      }]
    end

    context 'when open weather api returns no data' do
      before do
        allow(WeatherService).to receive(:fetch).and_return({ 'data' => [] })
      end

      let(:data) { {} }
      it { is_expected.to eql(expected_response) }
    end

    context 'when open weather api returns data' do
      before do
        allow(task_adaptor_instance).to receive(:fetch_weather_details).and_return(data)
      end

      let(:data) do
        { 'temp' => 8.92, 'humidity' => 94, 'wind_speed' => 3.44 }
      end

      it { is_expected.to eql(expected_response) }
    end
  end
end
