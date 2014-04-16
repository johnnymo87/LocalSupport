require_relative '../../app/services/associations'

describe Associations, '#belongs_to?' do
  let(:receiver) { Object.new }
  let(:yours) { double :yours }
  let(:yours_stringified) { double :yours_stringified }

  before do
    receiver.extend(Associations)
    yours.stub_chain(:class, :to_s, :underscore) { yours_stringified }
    receiver.stub(:respond_to?) { false }
  end

  it 'receiver properly includes the module' do
    receiver.is_a?(Associations).should be true
  end

  it 'stringifies yours' do
    yours.should_receive(:class) { yours }
    yours.should_receive(:to_s) { yours }
    yours.should_receive(:underscore)
    receiver.belongs_to?(yours)
  end

  context 'receiver responds to your type' do
    let(:one) { double :one }
    before { receiver.stub(:respond_to?) { true } }

    it 'sees if you have one of your type and if it is equal to yours' do
      receiver.should_receive(:respond_to?).with(yours_stringified) { true }
      receiver.should_receive(:send).with(yours_stringified) { one }
      one.should_receive(:==).with(yours)
      receiver.belongs_to?(yours)
    end

    context 'and it has one' do
      before { receiver.stub(:send).with(yours_stringified) { one } }

      it 'and that one is equal to yours' do
        one.stub(:==).with(yours) { true }
        receiver.belongs_to?(yours).should be true
      end

      it 'but that one is NOT equal to yours' do
        one.stub(:==).with(yours) { false }
        receiver.belongs_to?(yours).should be false
      end
    end

    context 'but it does not have one' do
      it 'is false' do
        receiver.stub(:send) { nil }
        receiver.belongs_to?(yours).should be false
      end
    end
  end

  context 'receiver does not respond to your type' do
    it 'is false' do
      receiver.belongs_to?(yours).should be false
    end
  end
end
