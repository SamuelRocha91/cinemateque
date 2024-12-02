require 'rails_helper'

describe 'Usuário acessa página de criar sessões' do 
  it 'e deve estar logado' do
    # Arrange
    movie_theater = MovieTheater.create!(name: 'Iguatemi', city: 'Salvador')
    room = Room.create!(
      name: 'A15',
      movie_theater_id: movie_theater.id,
      capacity: 200
    )

    # Act
    visit new_room_session_path room.id

    # Assert
    expect(current_path).to eq new_user_session_path  
  end

  it 'e criar com sucesso' do
    # Arrange
    user = User.create!(email: 'samuel@email.com', password: '123456789')
    movie_theater = MovieTheater.create!(name: 'Iguatemi', city: 'Salvador')
    room = Room.create!(
      name: 'A15',
      movie_theater_id: movie_theater.id,
      capacity: 200
    )
    Movie.create!(
      title: 'Jurassic Park', 
      year: 1993, 
      director: 'Steven Spielberg', 
      plot:  'Os paleontólogos Alan Grant, Ellie Sattler e o matemático Ian Malcolm fazem parte de um seleto grupo escolhido para visitar uma ilha habitada por dinossauros criados a partir de DNA pré-histórico. O idealizador do projeto e bilionário John Hammond garante a todos que a instalação é completamente segura. Mas após uma queda de energia, os visitantes descobrem, aos poucos, que vários predadores ferozes estão soltos e à caça.'
    )

    movie = Movie.create!(
      title: 'À espera de um milagre', 
      year: 1993, 
      director: 'Steven Spielberg', 
      plot:  'filme legal e emocionante'
    )

    # Act
    login_as user
    visit root_path
    click_on 'Cinemas'
    click_on movie_theater.name
    click_on room.name
    click_on 'Cadastrar Sessão'
    fill_in 'Horário',	with: '08:00'
    select 'Segunda', from: 'Dia da semana'
    select movie.title, from: 'Filme'
    click_on 'Salvar'

    # Assert
    expect(page).to have_content 'Sessão criada com sucesso' 
  end
end