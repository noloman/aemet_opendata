# AemetOpendata

[![Gem Version](https://badge.fury.io/rb/aemet_opendata.svg)](https://rubygems.org/gems/aemet_opendata)
[![Build Status](https://travis-ci.org/noloman/aemet_opendata.svg?branch=master)](https://travis-ci.org/noloman/aemet_opendata)
[![Code Climate](https://codeclimate.com/github/noloman/aemet_opendata/badges/gpa.svg)](https://codeclimate.com/github/noloman/aemet_opendata)

### Información elaborada por la [Agencia Estatal de Meteorología](https://www.aemet.es)

Gem that fetches meteorological information from https://opendata.aemet.es, the OpenData web portal from spanish meteorological agency, [AEMET](https://www.aemet.es)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aemet_opendata'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aemet_opendata

## Usage

First, you need to have a valid API key for making requests. Just go to https://opendata.aemet.es/centrodedescargas/altaUsuario and get one.

Once you have a valid API key, you can enter it as in the following example:
```
AemetOpendata.configure do |config|
  config.api_key = 'api-key'
end
```
Then after you have entered your API key, just `AemetOpendata.fetch_city(city_name)` where `city_name` is the name of the city you want to fetch.
The result should be something similar to:
```
[ 
    {
      "idema" : "5783",
      "lon" : -5.879167,
      "fint" : "2018-09-28T13:00:00",
      "prec" : 0.0,
      "alt" : 34.0,
      "vmax" : 7.2,
      "vv" : 3.3,
      "dv" : 100.0,
      "lat" : 37.416668,
      "dmax" : 120.0,
      "ubi" : "SEVILLA/SAN PABLO",
      "pres" : 1013.6,
      "hr" : 36.0,
      "stdvv" : 0.9,
      "ts" : 35.1,
      "pres_nmar" : 1017.1,
      "tamin" : 29.7,
      "ta" : 31.4,
      "tamax" : 31.6,
      "tpr" : 14.5,
      "stddv" : 20.0,
      "inso" : 54.0
    },
]
```

The metadata for the aforementioned result should be:
```{
	"unidad_generadora": "Servicio de Observación",
	"periodicidad": "continuamente",
	"formato": "application/json",
	"copyright": "© AEMET. Autorizado el uso de la información y su reproducción citando a AEMET como autora de la misma.",
	"notaLegal": "http://www.aemet.es/es/nota_legal",
	"campos": [{
			"id": "idema",
			"descripcion": "Indicativo climatógico de la estación meteorológia automática",
			"tipo_datos": "string",
			"requerido": true
		},
		{
			"id": "lon",
			"descripcion": "Longitud de la estación meteorológica (grados)",
			"tipo_datos": "float",
			"requerido": true
		},
		{
			"id": "lat",
			"descripcion": "Latitud de la estación meteorológica (grados)",
			"tipo_datos": "float",
			"requerido": true
		},
		{
			"id": "alt",
			"descripcion": "Altitud de la estación en metros",
			"tipo_datos": "float",
			"requerido": true
		},
		{
			"id": "ubi",
			"descripcion": "Ubicación de la estación. Nombre de la estación",
			"tipo_datos": "string",
			"requerido": true
		},
		{
			"id": "fint",
			"descripcion": "Fecha hora final del período de observación, se trata de datos del periodo de la hora anterior a la indicada por este campo (hora UTC)",
			"tipo_datos": "string (AAAA-MM-DDTHH:MM:SS)",
			"requerido": false
		},
		{
			"id": "prec",
			"descripcion": "Precipitación acumulada, medida por el pluviómetro, durante los 60 minutos anteriores a la hora indicada por el período de observación 'fint' (mm, equivalente a l/m2)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "pacutp",
			"descripcion": "Precipitación acumulada, medida por el disdrómetro, durante los 60 minutos anteriores a la hora indicada por el período de observación 'fint' (mm, equivalente a l/m2)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "pliqtp",
			"descripcion": "Precipitación líquida acumulada durante los 60 minutos anteriores a la hora indicada por el período de observación 'fint' (mm, equivalente a l/m2)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "psolt",
			"descripcion": "Precipitación sólida acumulada durante los 60 minutos anteriores a la hora indicada por el período de observación 'fint' (mm, equivalente a l/m2)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "vmax",
			"descripcion": "Velocidad máxima del viento, valor máximo del viento mantenido 3 segundos y registrado en los 60 minutos anteriores a la hora indicada por el período de observación 'fint' (m/s)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "vv",
			"descripcion": "Velocidad media del viento, media escalar de las muestras adquiridas cada 0,25 ó 1 segundo en el período de 10 minutos anterior al indicado por 'fint' (m/s)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "vmaxu",
			"descripcion": "Velocidad máxima del viento (sensor ultrasónico), valor máximo del viento mantenido 3 segundos y registrado en los 60 minutos anteriores a la hora indicada por el período de observación 'fint' (m/s)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "vvu",
			"descripcion": "Velocidad media del viento (sensor ultrasónico), media escalar en el periódo de 10 minutos anterior al indicado por 'fint' de las muestras adquiridas cada 0,25 ó 1 segundo (m/s)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "dv",
			"descripcion": "Dirección media del viento, en el período de 10 minutos anteriores a la fecha indicada por 'fint' (grados)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "dvu",
			"descripcion": "Dirección media del viento (sensor ultrasónico), en el período de 10 minutos anteriores a la fecha indicada por 'fint' (grados)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "dmax",
			"descripcion": "Dirección del viento máximo registrado en los 60 minutos anteriores a la hora indicada por 'fint' (grados)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "dmaxu",
			"descripcion": "Dirección del viento máximo registrado en los 60 minutos anteriores a la hora indicada por 'fint' por el sensor ultrasónico (grados)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "stdvv",
			"descripcion": "Desviación estándar de las muestras adquiridas de velocidad del viento durante los 10 minutos anteriores a la fecha dada por 'fint' (m/s)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "stddv",
			"descripcion": "Desviación estándar de las muestras adquiridas de la dirección del viento durante los 10 minutos anteriores a la fecha dada por 'fint' (grados)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "stdvvu",
			"descripcion": "Desviación estándar de las muestras adquiridas de velocidad del viento durante los 10 minutos anteriores a la fecha dada por 'fint' obtenido del sensor ultrasónico de viento instalado junto al convencional (m/s)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "stddvu",
			"descripcion": "Desviación estándar de las muestras adquiridas de la dirección del viento durante los 10 minutos anteriores a la fecha dada por 'fint' obtenido del sensor ultrasónico de viento instalado junto al convencional (grados)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "hr",
			"descripcion": "Humedad relativa instantánea del aire correspondiente a la fecha dada por 'fint' (%)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "inso",
			"descripcion": "Duración de la insolación durante los 60 minutos anteriores a la hora indicada por el período de observación 'fint' (horas)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "pres",
			"descripcion": "Presión instantánea al nivel en el que se encuentra instalado el barómetro y correspondiente a la fecha dada por 'fint' (hPa)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "pres_nmar",
			"descripcion": "Valor de la presión reducido al nivel del mar para aquellas estaciones cuya altitud es igual o menor a 750 metros y correspondiente a la fecha indicada por 'fint' (hPa)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "ts",
			"descripcion": "Temperatura suelo, temperatura instantánea junto al suelo y correspondiente a los 10 minutos anteriores a la fecha dada por 'fint' (grados Celsius)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "tss20cm",
			"descripcion": "Temperatura subsuelo 20 cm, temperatura del subsuelo a una profundidad de 20 cm y correspondiente a los 10 minutos anteriores a la fecha dada por 'fint' (grados Celsius)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "tss5cm",
			"descripcion": "Temperatura subsuelo 5 cm, temperatura del subsuelo a una profundidad de 5 cm y correspondiente a los 10 minutos anteriores a la fecha dada por 'fint' (grados Celsius)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "ta",
			"descripcion": "Temperatura instantánea del aire correspondiente a la fecha dada por 'fint' (grados Celsius)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "tpr",
			"descripcion": "Temperatura del punto de rocío calculado correspondiente a la fecha 'fint' (grados Celsius)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "tamin",
			"descripcion": "Temperatura mínima del aire, valor mínimo de los 60 valores instantáneos de 'ta' medidos en el período de 60 minutos anteriores a la hora indicada por el período de observación 'fint' (grados Celsius)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "tamax",
			"descripcion": "Temperatura máxima del aire, valor máximo de los 60 valores instantáneos de 'ta' medidos en el período de 60 minutos anteriores a la hora indicada por el período de observación 'fint' (grados Celsius)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "vis",
			"descripcion": "Visibilidad, promedio de la medida de la visibilidad correspondiente a los 10 minutos anteriores a la fecha dada por 'fint' (Km)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "geo700",
			"descripcion": "Altura del nivel de la superficie de referencia barométrica de 700 hPa calculado para las estaciones con altitud mayor de 2300 metros y correspondiente a la fecha indicada por 'fint' (m geopotenciales)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "geo850",
			"descripcion": "Altura del nivel de la superficie de referencia barométrica de 850 hPa calculado para las estaciones con altitud mayor de 1000 metros y menor o igual a 2300 metros y correspondiente a la fecha indicada por 'fint' (m geopotenciales)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "geo925",
			"descripcion": "Altura del nivel de la superficie barométrica de 925 hPa calculado para las estaciones con altitud mayor de 750 metros y y menor o igual a 1000 metros correspondiente a la fecha indicada por 'fint' (m geopotenciales)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "rviento",
			"descripcion": "Recorrido del viento durante los 60 minutos anteriores a la fecha indicada por 'fint' (Hm)",
			"tipo_datos": "float",
			"requerido": false
		},
		{
			"id": "nieve",
			"descripcion": "Espesor de la capa de nieve medid en los 10 minutos anteriores a la a la fecha indicada por 'fint' (cm)",
			"tipo_datos": "float",
			"requerido": false
		}
	]
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/noloman/aemet_opendata. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the AemetOpendata project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/aemet_opendata/blob/master/CODE_OF_CONDUCT.md).
