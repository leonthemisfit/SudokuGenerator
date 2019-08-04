# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'sudoku_generator'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = 'Add-on library for SudokuBoard to add board generation'
  s.author = 'leonthemisfit'
  s.email = 'leonthemisfit@gmail.com'
  s.files = [
    'lib/sudoku_generator.rb',
    'lib/board.rb'
  ]
  s.add_runtime_dependency 'sudoku_board', '~> 0.0', '>= 0.0.1'
end
