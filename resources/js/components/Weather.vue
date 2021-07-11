<template>

<div>
    <div>
        <div class="app-home-img-background"  v-bind:style="{ 'background-image': 'url(' + image + ')' }" >  
            <div class="app-home-img-background-text-container" > 
                    <div> Exploring Japan </div>
            </div> 
        </div>
    </div>

    <div class="container">



        <h3 class="mt-3">SELECT DESTINATION:</h3>
        <select class='form-control' v-model="destination" @change="getDestination()" name="destinations" id="destinations">
            <option v-for="data in destinations" v-bind:key="data" v-bind:value="data" >{{ data }}</option>
        </select>

        <div>

            <div v-if="destinationDetails">
                <h3  class="mt-3">WEATHER FORECAST:</h3>

                <div class="card mt-3 mb-3">
                    <div class="card-body">

                        <div class="row"> 

                            <div class="col-md-6">

                                <h5 class="card-title">
                                    {{ destinationDetails.city.name + ' ' + destinationDetails.city.country  }}       
                                </h5>
                                <h6 class="card-subtitle mb-2 text-muted"> population: {{ destinationDetails.city.population }} </h6>
                                <p class="card-text"> <i>timezone:</i> {{  destinationDetails.city.timezone }}</p>

                                <h6>WIND</h6>
                                <p class="card-text"> Speed:  {{ destinationDetails.list[0].wind.speed }}  </p>
                                <p class="card-text"> Deg:  {{ destinationDetails.list[0].wind.deg }}  </p>
                                <p class="card-text"> Gust: {{ destinationDetails.list[0].wind.gust }}  </p>

                            </div>
                            <div class="col-md-6">
                                <img style="width: 200px;" :src="weatherIcon(destinationDetails.list[0].weather[0].icon,4)">
                                <h5 class="card-title"> {{destinationDetails.list[0].weather[0].description}}</h5>
                                <h6 class="card-subtitle mb-2 text-muted"> {{ destinationDetails.list[0].dt_txt | formatDate }} </h6>
                            </div>
                            
                        </div>

                    </div>
                </div>

                <div style=" display: flex;overflow-x: scroll;">  

                    <div class="card-body m-2" style="width:200px" v-for="(value, key) in destinationDetails.list" v-bind:key="key" >
                        <img class="card-img-top" :src="weatherIcon(value.weather[0].icon)">
                        <h5 class="card-title"> {{value.weather[0].description}}</h5>
                        <h6 class="card-subtitle mb-2 text-muted"> {{ value.dt_txt | formatDate }} </h6>
                        <!-- <div class="row">
                            <div class="col-6">
                                <h6>WIND</h6>
                                    <p class="card-text"> Speed:  {{ value.wind.speed }}  </p>
                                    <p class="card-text"> Deg:  {{ value.wind.deg }}  </p>
                                    <p class="card-text"> Gus: {{ value.wind.gust }}  </p>
                            </div>
                            <div class="col-6">
                                <h6>MAIN</h6>
                                    <p class="card-text"> Temp: {{value.main.temp}} </p>
                                    <p class="card-text"> Feels like:" {{value.main.feels_like}} </p>
                                    <p class="card-text"> Temp min: {{value.main.temp_min}} </p>
                                    <p class="card-text"> Temp max: {{value.main.temp_max}} </p>
                                    <p class="card-text"> Pressure: {{value.main.pressure}} </p>
                                    <p class="card-text"> Sea level: {{value.main.sea_level}} </p>
                                    <p class="card-text"> Grnd level: {{value.main.grnd_level}} </p>
                                    <p class="card-text"> Humidity: {{value.main.humidity}} </p>
                                    <p class="card-text"> Temp kf: {{value.main.temp_kf}} </p>
                            </div>
                        </div> -->
                    </div>

                </div>

            </div>
            

            <div v-if="venues">
                <h3 class="mt-3">VENUES AVAILABLE:</h3>

                <div class="row">
                    <div class="col-6 mt-3" v-for="(value, key) in venues.response.venues" v-bind:key="key" >
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">{{ value.name }}</h5>
                                <h6 class="card-subtitle mb-2 text-muted">
                                    {{ value.location.address +', '+ value.location.city +', '+ value.location.state +', '+ value.location.country +' '+ value.location.postalCode }} </h6>
                                <p class="card-text"> <i>category:</i> {{value.categories[0].name}}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

</template>
<script>
    export default {

        data() {
            return {
                destinations : [],
                destination: "",
                destinationDetails : null,
                venues: null,
                image: "/images/Japan.jpg"
            }
        },
        methods:{
            getDestinations: function() {
              axios.get('/api/destinations')
              .then(function (response) {

                  if(response?.error) {
                      alert(response.message);
                  }
                  else {
                      this.destinations = response.data;
                  }
                 
              }.bind(this));

            },
            
            getDestination: function() {
              axios.post('/api/destination',{q : this.destination})
              .then(function (response) {

                  if(response?.error) {
                      alert(response.message);
                  }
                  else {
                      this.destinationDetails = response.data;
                      this.getVenues();
                      this.image = ("/images/"+this.destination + ".jpg").toLowerCase();
                  }
              }.bind(this));
            },

            getVenues: function() {
              axios.post('/api/venues',{near : this.destination})
              .then(function (response) {

                  if(response?.error) {
                      alert(response.message);
                  }
                  else {
                      this.venues = response.data;
                  }
              }.bind(this));
            },

            weatherIcon: function(data,size=2) {
                return "http://openweathermap.org/img/wn/"+data+"@"+size+"x.png";
            }

        },
        created: function() {
            this.getDestinations();
        }
        
    }
</script> 