require "spec_helper"

describe Maxmind::GeoIp::Configuration do
  subject { Maxmind::GeoIp::Configuration.new }

  describe 'default options for' do
    describe '.host' do
      it 'defaults to an empty string' do
        expect(subject.host).to eq('')
      end
    end

    describe '.license' do
      it 'defaults to an empty string' do
        expect(subject.license).to eq('')
      end
    end

    describe '.user_id' do
      it 'defaults to an empty string' do
        expect(subject.user_id).to eq('')
      end
    end

    describe '.version' do
      it 'defaults to a value' do
        expect(subject.version).not_to eq('')
      end
    end
    
  end

  describe 'overwriting defaults for' do
    describe '.host' do
      before { subject.host = 'example.com' }

      it 'assigns correctly' do
        expect(subject.host).to eq('example.com')
      end
    end

    describe '.license' do
      before { subject.license = 'this-is-my-key' }

      it 'assigns correctly' do
        expect(subject.license).to eq('this-is-my-key')
      end
    end

    describe '.user_id' do
      before { subject.user_id = 'abcd1234' }

      it 'assigns correctly' do
        expect(subject.user_id).to eq('abcd1234')
      end
    end

    describe '.version' do
      before { subject.version = '2.0' }

      it 'assigns correctly' do
        expect(subject.version).to eq('2.0')
      end
    end
  end
end
