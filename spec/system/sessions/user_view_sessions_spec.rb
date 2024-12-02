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

  it 'e recebe feedback caso não existam sessões criadas' do 
    # Arrange
    user = User.create!(email: 'samuel@email.com', password: '123456789')
    movie_theater = MovieTheater.create!(name: 'Iguatemi', city: 'Salvador')
    room = Room.create!(
      name: 'A15',
      movie_theater_id: movie_theater.id,
      capacity: 200
    )

    # Act
    login_as user
    visit root_path
    click_on 'Cinemas'
    click_on movie_theater.name
    click_on room.name

    # Assert
    expect(page).to have_content room.name
    expect(page).to have_content 'Capacidade: 200'
    expect(page).to have_content 'Não existem ainda sessões cadastradas'
    expect(page).to have_link 'Cadastrar Sessão'   
  end

  it 'e lista as sessões cadastradas' do 
    # Arrange
    user = User.create!(email: 'samuel@email.com', password: '123456789')
    movie_theater = MovieTheater.create!(name: 'Iguatemi', city: 'Salvador')
    room = Room.create!(
      name: 'A15',
      movie_theater_id: movie_theater.id,
      capacity: 200
    )
    movie = Movie.create!(
      title: 'Jurassic Park', 
      year: 1993, 
      director: 'Steven Spielberg', 
      plot:  'Os paleontólogos Alan Grant, Ellie Sattler e o matemático Ian Malcolm fazem parte de um seleto grupo escolhido para visitar uma ilha habitada por dinossauros criados a partir de DNA pré-histórico. O idealizador do projeto e bilionário John Hammond garante a todos que a instalação é completamente segura. Mas após uma queda de energia, os visitantes descobrem, aos poucos, que vários predadores ferozes estão soltos e à caça.'
    )
    session_one = Session.create!(
      movie_id: movie.id,
      day_of_week: 1,
      hour: "08:00",
      room_id: room.id
    )
    session_two = Session.create!(
      movie_id: movie.id,
      day_of_week: 1,
      hour: "09:00",
      room_id: room.id
    )

    # Act
    login_as user
    visit root_path
    click_on 'Cinemas'
    click_on movie_theater.name
    click_on room.name

    # Assert
    expect(page).not_to have_content 'Não existem ainda sessões cadastradas'
    expect(page).to have_content "Sessão: #{session_one.hour}"
    expect(page).to have_content "Filme: #{movie.title}"
    expect(page).to have_content "Sessão: #{session_two.hour}"
  end
end