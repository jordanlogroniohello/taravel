<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class ApiController extends Controller
{   

    private $openWeatherApi         = '94fbbe4d6de4e2f081b1becaa608665b';
    private $foursquareClientID     = 'SZP323302M0C2TVSD501WDZEHVCMQPRWPOSAPTMY5LK4QQW5';
    private $foursquareClientSecret = 'YFB1LCZYKW5LONIDF13XDI1SN4DVBUVWFXHH1ANBULSVGLHP';

    private $openWeatherUrl         = 'https://api.openweathermap.org/data/2.5/forecast';
    private $foursquareUrl          = 'https://api.foursquare.com/v2/venues/search';

    public function getDestinations() 
    {
        $data = [
            "Tokyo", "Yokohama", "Kyoto", "Osaka", "Sapporo", "Nagoya"
        ];

        return response()->json($data);
    }

    public function getDestination(Request $request) 
    {
        
        $data = [
            'q' => $request->q , 
            'appid' => $this->openWeatherApi,
            'cnt' => 20
        ];
        $response = Http::get($this->openWeatherUrl,$data);

        if($response->failed())
            return response()->json(['error' => true, 'message' => "Something went wrong."]);

        return $response->body();//response()->json();
    }

    public function getVenues(Request $request) 
    {
        
        $data = [
            'near'          => $request->near , 
            'client_id'     => $this->foursquareClientID, 
            'client_secret' => $this->foursquareClientSecret, 
            'v'             => date("Ymd"),
            'limit'         => 10 
        ];

        $response = Http::get($this->foursquareUrl,$data);

        if($response->failed())
            return response()->json(['error' => true, 'message' => "Something went wrong."]);

        return $response->body();
    }



}
