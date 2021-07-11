@extends('layout')

@section('content')
    
    <div>
        <div class="app-home-img-background">  
            <div class="app-home-img-background-text-container"> 
                    <div> Exploring Japan </div>
            </div> 
        </div>
    </div>
    
    <div class="container mt-3">

        <h3 class="text-center">About Tara-vel</h3>
        <div class="row"> 
            <div class="col-md-4 center"> 
                <img class="app-logo" src="{{ url('images/taravellogo.png') }}" alt="tara-vel logo">
            </div>
            <div class="col-md-8"> 
                <p> Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. </p>
            </div>
        </div>

        <hr>

        <h3 class="text-center mt-3">Destinations</h3>
        <h6 class="text-center">Best of Japan</h6>

        <div id="carouselDestinations" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselDestinations" data-slide-to="0" class="active"></li>
                <li data-target="#carouselDestinations" data-slide-to="1"></li>
                <li data-target="#carouselDestinations" data-slide-to="2"></li>
                <li data-target="#carouselDestinations" data-slide-to="3" ></li>
                <li data-target="#carouselDestinations" data-slide-to="4"></li>
                <li data-target="#carouselDestinations" data-slide-to="5"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="{{ url('images/tokyo.jpg') }}" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="{{ url('images/kyoto.jpg') }}" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="{{ url('images/osaka.jpg') }}" alt="Third slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="{{ url('images/nagoya.jpg') }}" alt="Fourth slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="{{ url('images/sapporo.jpg') }}" alt="Fifth slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="{{ url('images/yokohama.jpg') }}" alt="Six slide">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselDestinations" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselDestinations" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
    </div>
        
    <div class="text-center mt-5">
        <h5>You want to know about venues and weather on every destinations ? go click search  </h5>
        <a class="btn btn-outline-primary" style="font-size:20px" href="{{ url('/destinations') }}">SEARCH</a>
    </div>


    
@endsection



