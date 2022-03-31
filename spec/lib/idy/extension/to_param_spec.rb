# frozen_string_literal: true

RSpec.describe Clean, '.to_param' do
  context 'when object does not acts as idy' do
    it 'behaves as default' do
      expect(described_class.new(id: 1).to_param).to eq '1'
    end
  end

  context 'when object acts as idy' do
    context 'with no given salt' do
      let!(:model_1) { Article.new(id: 1) }

      it 'generates a hash' do
        expect(model_1.to_param).to eq 'My'
      end

      context 'with comparison' do
        let!(:model_2) { Post.new }

        context 'with other object with same id' do
          before { model_2.id = 1 }

          it 'generates different hash' do
            expect(model_1.to_param).not_to eq model_2.to_param
          end
        end
      end

      context 'when object is not persisted' do
        context 'when has no id' do
          it { expect(Article.new.to_param).to be_nil }
        end

        context 'when has id' do
          it 'generates a hash' do
            expect(model_1.to_param).to eq 'My'
          end
        end
      end
    end
  end
end
