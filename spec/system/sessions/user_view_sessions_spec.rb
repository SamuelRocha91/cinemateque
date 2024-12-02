require 'rails_helper'

describe 'Usuário acessa página de listagem de sessões' do 
  it 'e deve estar logado' do
    # Arrange
    movie_theater = MovieTheater.create!(name: 'Iguatemi', city: 'Salvador')
    room = Room.create!(
      name: 'A15',
      movie_theater_id: movie_theater.id,
      capacity: 200
    )

    # Act
    visit room_sessions_path room.id

    # Assert
    expect(current_path).to eq new_user_session_path  
  end

  it ''
end