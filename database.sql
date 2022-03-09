create table news (
    id int not null AUTO_INCREMENT,
    titulo varchar(255) not null,
    linkMateria varchar(255) not null ,
    urlImage varchar(255) not null,
    subtitulo varchar(255) not null
)

create table leitores (
    id int not null AUTO_INCREMENT,
    name varchar(255) not null,
    email varchar(255) not null,
    password varchar(200)
)


WITH teste_json ( doc ) AS (
VALUES (
'[
    {
      "titulo": "Em meio a ataques, moradores são retirados dos subúrbios de Kiev",
      "linkMateria": "https://g1.globo.com/mundo/ao-vivo/guerra-ucrania-russia-putin-invasao.ghtml?postId=1f4590a3-14b9-4466-9919-0aa8ac4821a1",
      "urlImage": "https://s2.glbimg.com/SVwglsaozwp4N3qOZCWcWhkB_og=/0x0:6001x3376/540x304/smart/filters:max_age(3600)/https://i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2022/k/C/1PZ75wRUWNhBBv1f5zJw/ap22067489059075.jpg",
      "subtitulo": ""
    },
    {
      "titulo": "Mísseis e jatos: veja quais armas o Ocidente tem fornecido à Ucrânia",
      "linkMateria": "https://g1.globo.com/mundo/ucrania-russia/noticia/2022/03/09/veja-quais-armas-o-ocidente-tem-fornecido-a-ucrania-e-como-elas-chegam-ate-o-destino.ghtml",
      "urlImage": "https://s2.glbimg.com/ux-HdD5aDjk7H1N69dNziiH1LjA=/0x136:4066x2423/540x304/smart/filters:max_age(3600)/https://i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2022/B/3/VaSTZPRvKpzB7oheWfAw/2022-03-09t133919z-1162650278-rc2xys9eb2ah-rtrmadp-3-ukraine-crisis-kyiv-defence.jpg",
      "subtitulo": ""
    },
    {
      "titulo": "Bovespa fecha em alta de 2,43%; dólar cai a R$ 5,01",
      "linkMateria": "https://g1.globo.com/economia/noticia/2022/03/09/bovespa.ghtml",
      "subtitulo": "Mercado financeiro"
    },
    {
      "titulo": "Empresas podem exigir máscaras em cidades que tiraram obrigatoriedade?",
      "linkMateria": "https://g1.globo.com/trabalho-e-carreira/noticia/2022/03/09/empresas-exigencia-mascara.ghtml",
      "urlImage": "https://s2.glbimg.com/U8-ZWtJcCGnxQ33Dv3ykR3cMI9g=/0x312:3000x2000/540x304/smart/filters:max_age(3600)/https://i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2022/l/2/i8sfqxQGO4c8vwQndyRw/fup20220309058.jpg",
      "subtitulo": "Proteção contra Covid"
    },
    {
      "titulo": "Aneurisma cerebral: o que é a complicação descoberta por Juliette",
      "linkMateria": "https://g1.globo.com/saude/noticia/2022/03/09/aneurisma-cerebral-entenda-o-que-e-a-complicacao-descoberta-por-juliette.ghtml",
      "urlImage": "https://s2.glbimg.com/qMTi0QVbqtFAEiys2kOqcdqGijs=/85x74:953x563/540x304/smart/filters:max_age(3600)/https://i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2022/6/g/rAluBEQNi5okqq13mJYg/juliette.jpg",
      "subtitulo": "Saúde"
    },
  ]'::json))


INSERT INTO  noticias ( titulo, linkMateria, urlImage, subtitulo )
  SELECT
    rec.titulo, rec.linkMateria, rec.urlImage, rec.subtitulo
  FROM
    teste_json AS tj
  CROSS JOIN 
     json_populate_recordset( NULL::noticias, doc ) AS rec;


-- -- Create users table
-- CREATE TABLE noticias (
--     id int NOT NULL AUTO_INCREMENT,
--     name varchar(255) NOT NULL,
--     email varchar(255) NOT NULL,
--     personalDocument varchar(14) NOT NULL,
--     birthday DATE NOT NULL,
--     password varchar(200),
--     PRIMARY KEY (id),
--     CONSTRAINT UC_users_email UNIQUE (email),
--     CONSTRAINT UC_users_personalDocument UNIQUE (personalDocument)
-- );


-- INSERT INTO categories (id, name) VALUES (1, 'Ação');
-- INSERT INTO categories (id, name) VALUES (2, 'Comédia');
-- INSERT INTO categories (id, name) VALUES (3, 'Aventura');
-- INSERT INTO categories (id, name) VALUES (4, 'Terror');
-- INSERT INTO categories (id, name) VALUES (5, 'Romance');