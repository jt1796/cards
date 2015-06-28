require_relative '../models/account'
require_relative '../models/stack_container'
require_relative '../route_tracker'
require 'rspec'

RSpec.describe Routes do
    describe 'protected or unprotected' do
        it 'contains the wildcard routes' do
            expect(Routes.protected?('/action/put/hi/there/')).to be true
        end
        it 'does not allow empty pieces' do
            expect(Routes.protected?('/action/put///')).to be false
        end
        it 'does not allow longer pieces' do
            expect(Routes.protected?('/action/put/hi/there/jdd')).to be true
        end
        it 'unprotected route' do
            expect(Routes.unprotected?('/login/')).to be true
        end
    end
end

RSpec.describe Account do
  describe '#initialize' do
    it 'makes the account' do
        acc = Account.new 'test', 'test'
    end
  end
  describe '#valid?' do
    it 'correct info' do
        acc = Account.new 'test', 'jjj'
        expect(acc.valid?).to be true
    end
    it 'invalid password' do
        acc = Account.new 'test', 'ffff'
        expect(acc.valid?).to be false
    end
  end
end

RSpec.describe Stack_Container do
    describe '#initialize' do
        it 'makes the stacks' do
            stks = Stack_Container.new 'users/test'
        end
    end
    describe '#bareAccount' do
        it 'has a bare file' do
            IO.write('users/test', %({"test": "jjj"}))
            stks = Stack_Container.new 'users/test'
            data = stks.getJSON()
            expect(data.length).to be 1
        end
        it 'adds one task to ready' do
            stks = Stack_Container.new 'users/test'
            stks.add('ready', 'CS HW', 'do it', 'it is done')
            data = stks.getJSON
            expect(data.length).to be 2
            expect(data['ready']['CS HW']).to eq({'body' => 'do it', 'acceptance' => 'it is done'})
        end
        it 'removes one task from ready' do
            stks = Stack_Container.new 'users/test'
            stks.remove('ready', 'CS HW')
            data = stks.getJSON
            expect(data['ready'].length).to be 0
        end
        it 'transfers a card from ready to progress' do
            stks = Stack_Container.new 'users/test'
            stks.add('ready', 'CS HW', 'do', 'done')
            stks.transfer('ready', 'progress', 'CS HW')
            data = stks.getJSON
            expect(data['ready'].length).to be 0
            expect(data['progress'].length).to be 1
        end
        it 'handles two cards in one stack' do
            stks = Stack_Container.new 'users/test'
            stks.add('progress', 'Physics HW', 'fight', 'die')
            data = stks.getJSON
            expect(data['progress'].length).to be 2
        end
    end
end
