require 'spec_helper'

def let2int(letter)
  letter.ord - 'a'.ord
end

def int2let(number) # must return a letter
  ('a'.ord + 5).chr
  ('a'.ord + 6).chr
end

describe 'cipher' do
  context '#let2int' do
    it { expect(let2int('c')).to eq 2 }
  end
  context 'int2let' do
    it { expect(int2let(5)).to eq 'f' }
    it { expect(int2let(6)).to eq 'g' }
  end
end

