require "spec_helper"

describe Maxmind::GeoIp::Country, as: :model do
  let(:params) { {} }
  let(:locale) { '' }
  subject { Maxmind::GeoIp::Country.new(params, locale) }

  describe 'method' do
    let(:params) { {"continent"=>{"code"=>"EU", "geoname_id"=>6255148, "names"=>{"es"=>"Europa", "fr"=>"Europe", "ja"=>"ヨーロッパ", "pt-BR"=>"Europa", "ru"=>"Европа", "zh-CN"=>"欧洲", "de"=>"Europa", "en"=>"Europe"}}, "country"=>{"is_in_european_union"=>true, "iso_code"=>"GB", "geoname_id"=>2635167, "names"=>{"fr"=>"Royaume-Uni", "ja"=>"イギリス", "pt-BR"=>"Reino Unido", "ru"=>"Великобритания", "zh-CN"=>"英国", "de"=>"Vereinigtes Königreich", "en"=>"United Kingdom", "es"=>"Reino Unido"}}, "maxmind"=>{"queries_remaining"=>19994}, "registered_country"=>{"is_in_european_union"=>true, "iso_code"=>"GB", "geoname_id"=>2635167, "names"=>{"en"=>"United Kingdom", "es"=>"Reino Unido", "fr"=>"Royaume-Uni", "ja"=>"イギリス", "pt-BR"=>"Reino Unido", "ru"=>"Великобритания", "zh-CN"=>"英国", "de"=>"Vereinigtes Königreich"}}, "traits"=>{"ip_address"=>"82.10.114.252"}} }

    describe '#initialize' do
      # todo - Load from support file
      context 'with params and no locale' do
        it 'sets params correctly' do
          expect(subject.params).to eq(params)
        end

        it 'defaults locale' do
          expect(subject.locale).to eq('en')
        end
      end

      context 'with params and locale' do
        let(:locale) { 'es' }

        it 'sets params correctly' do
          expect(subject.params).to eq(params)
        end

        it 'defaults locale' do
          expect(subject.locale).to eq(locale)
        end
      end

      context 'with locale and no params' do
        let(:locale) { 'es' }
        let(:params) { {} }

        it 'sets params correctly' do
          expect(subject.params).to eq(params)
        end

        it 'defaults locale' do
          expect(subject.locale).to eq(locale)
        end
      end
    end

    describe '#continent' do
      context 'with localisation' do
        context 'for en' do
          it 'returns the correct version' do
            expect(subject.continent).to eq('Europe')
          end
        end

        context 'for es' do
          let(:locale) { 'es' }
          it 'returns the correct version' do
            expect(subject.continent).to eq('Europa')
          end
        end
      end
    end
  end
end
