
CREATE SCHEMA IF NOT EXISTS galleria_schema;

CREATE TABLE IF NOT EXISTS galleria_schema.utente (
	username VARCHAR(20),
	passkey varchar(50) NOT NULL,
	dataReg DATE,
	CONSTRAINT pk_utente PRIMARY KEY (username)

);

CREATE TABLE IF NOT EXISTS galleria_schema.luogo (
	codLuogo SERIAL,
	latitudine DOUBLE PRECISION,
	longitudine DOUBLE PRECISION,
	nomeLuogo VARCHAR(50),
	CONSTRAINT pk_luogo PRIMARY KEY (codLuogo),
	CONSTRAINT unq_coord UNIQUE(latitudine, longitudine),
	CONSTRAINT unq_nomeluogo UNIQUE (nomeLuogo)
	
);

CREATE TABLE IF NOT EXISTS galleria_schema.galleria_condivisa(
	codGalleria SERIAL,
	nomeGalleria varchar(50),
	CONSTRAINT pk_galleriaC PRIMARY KEY (codGalleria)

);

CREATE TABLE IF NOT EXISTS galleria_schema.galleria_personale(
	codGalleria SERIAL,
	proprietario VARCHAR(20),
	CONSTRAINT pk_galleriap PRIMARY KEY (codGalleria),
	CONSTRAINT fk_galleriap FOREIGN KEY (proprietario) REFERENCES galleria_schema.utente(username) ON DELETE CASCADE

);



CREATE TABLE IF NOT EXISTS galleria_schema.album(

	codAlbum SERIAL,
	nomeAlbum VARCHAR(20),
	CONSTRAINT pk_album PRIMARY KEY (codAlbum)
	
);

CREATE TABLE IF NOT EXISTS galleria_schema.dispositivo (
	indirizzoMAC CHAR(12),
	modello VARCHAR(30),
	proprietario VARCHAR(20),
	CONSTRAINT pk_disp PRIMARY KEY (indirizzoMAC),
	CONSTRAINT fk_disputente FOREIGN KEY (proprietario) REFERENCES galleria_schema.utente(username) ON DELETE CASCADE

);


CREATE TABLE IF NOT EXISTS galleria_schema.soggettofoto(
	tipo varchar(50),
	CONSTRAINT pk_soggettofoto PRIMARY KEY (tipo)

);

CREATE TABLE IF NOT EXISTS galleria_schema.foto(
	codFoto SERIAL ,
	privata bool,
	rimossa bool,
	dataScatto DATE,
	codAlbum SERIAL,
	codGalleriaP SERIAL,
	autoreScatto VARCHAR(20),
	dispositivo char(12),
	img bytea,
	CONSTRAINT pk_foto PRIMARY KEY (codFoto),
	CONSTRAINT fk_fotogalleria FOREIGN KEY (codGalleriaP) REFERENCES galleria_schema.galleria_personale(codGalleria) ON DELETE CASCADE,
	CONSTRAINT fk_fotoutente FOREIGN KEY (autoreScatto) REFERENCES galleria_schema.utente(username) ON DELETE CASCADE,
	CONSTRAINT fk_fotodispositivo FOREIGN KEY (dispositivo) REFERENCES galleria_schema.dispositivo (indirizzoMAC)
	
	
);

CREATE TABLE IF NOT EXISTS galleria_schema.partecipazione(

	codUtente varchar(20),
	codFoto SERIAL,
	CONSTRAINT pk_part PRIMARY KEY (codUtente, codFoto),
	CONSTRAINT fk_partutente FOREIGN KEY (codUtente) REFERENCES galleria_schema.utente(username) ON DELETE CASCADE,
	CONSTRAINT fk_partfoto FOREIGN KEY (codFoto) REFERENCES galleria_schema.foto(codFoto) ON DELETE CASCADE


);


CREATE TABLE IF NOT EXISTS galleria_schema.tag (

	codFoto SERIAL,
	codUtente VARCHAR(20),
	CONSTRAINT pk_tag PRIMARY KEY (codUtente, codFoto),
	CONSTRAINT fk_tagutente FOREIGN KEY (codUtente) REFERENCES galleria_schema.utente(username) ON DELETE CASCADE,
	CONSTRAINT fk_tagtfoto FOREIGN KEY (codFoto) REFERENCES galleria_schema.foto(codFoto) ON DELETE CASCADE

);


CREATE TABLE IF NOT EXISTS galleria_schema.presenzafoto(

	codGalleriaC SERIAL,
	codFoto SERIAL,
	CONSTRAINT pk_presfoto PRIMARY KEY (codGalleriaC, codFoto),
	CONSTRAINT fk_presfgall FOREIGN KEY (codGalleriaC) REFERENCES galleria_schema.galleria_condivisa(codGalleria) ON DELETE CASCADE,
	CONSTRAINT fk_presffoto FOREIGN KEY (codFoto) REFERENCES galleria_schema.foto(codFoto) ON DELETE CASCADE
	
);

CREATE TABLE IF NOT EXISTS galleria_schema.contenuto (

	soggetto VARCHAR(50),
	codFoto SERIAL,
	CONSTRAINT pk_contenuto PRIMARY KEY (soggetto, codFoto),
	CONSTRAINT fk_contsog FOREIGN KEY (soggetto) REFERENCES galleria_schema.soggettofoto(tipo) ON DELETE CASCADE,
	CONSTRAINT fk_contfoto FOREIGN KEY (codFoto) REFERENCES galleria_schema.foto(codFoto) ON DELETE CASCADE
	




);



