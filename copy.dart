 /*body: Container(
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Center(
                      child: returnAreaStyled(_areaName),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Center(
                      child: returnWeatherStyled(_mainWeather),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      BoxedIcon(
                        _icon,
                        color: Colors.white,
                        size: 64,
                      )
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Center(
                      child: returnTempStyled(_mainTemp),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),*/