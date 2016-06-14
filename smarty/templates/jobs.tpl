<!DOCTYPE HTML>
<html>
<head>
	<link rel="stylesheet" href="https://js.arcgis.com/4.0/esri/css/main.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <script src="//code.jquery.com/jquery-1.12.3.min.js"></script>
  
  <script src="http://geodevelopers.org/assets/js/jsrender.js"></script>


<!-- ************************ ArcGIS Libraries ************************ -->

  <link rel="stylesheet" href="https://js.arcgis.com/4.0/esri/css/main.css">
  <script src="https://js.arcgis.com/4.0/"></script>

<!-- ************************************************ -->


<!-- ***********BOOTSTRAP LIBRARIES******************* -->

  <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

<!-- **************************************** -->

	<style>
	  html, body, #viewDiv {
	    padding: 0;
	    margin: 0;
	  }
	  #footer{
	  	display: none;
	  }
	  #viewDiv,
	  #main-wrapper,
	  #mapContainer {
	  	height: 100%;
	  }
	  #viewDiv{
	  	position: absolute;
	  	/*position: fixed;*/
	  	width: 100%;
	  }
	  
		.padding10{
		  padding: 10;
	    margin: 0;	
		}
		#miniViewDiv {
      /*position: fixed;*/
      position: absolute;
      right: 15px;
      width: 300px;
      height: 150px;
      bottom: 0px;
      border-top: 5px solid rgba(255, 255, 255, 0.65);
      border-left: 5px solid rgba(255, 255, 255, 0.65);
    }
    #chngViewBtn{
    	position: absolute;
    	z-index: 900;
    	top: 3px;
    	left: 3px;
    }

	</style>
    {include file="header.tpl" title="Comunidad de Geo Developers"}
</head>
<body id="tos">
	{include file="menu.tpl"}
	<div id="main-wrapper">
	<div id= "jobsDiv" class="col-md-4 padding10" >
		<div id="accordion" role="tablist" aria-multiselectable="true" ></div>
	</div>
	<div id="mapContainer" class="col-md-8">
		<div id="viewDiv"></div>

		<div id="miniMapElements">

			<div id="miniViewDiv" simpsons-in-main-view="0" >
				<button id="chngViewBtn" type="button" class="btn btn-default btn-xs">
				  <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
				</button>	
			</div>

		</div>
		
	</div>

	<?php {literal} ?>
	<!-- HERE IS THE TEMPLATE TO GENERATE THE JOBS OFFERS ACCORDION -->
	<script id="theTmpl" type="text/x-jsrender">
	<div>
		  <div class="panel panel-default">
		    <div id="heading-{{:id}}" class="panel-heading" role="tab" >
		      <h4 class="panel-title">
		        <a id="link2Collapse-{{:id}}"  data-toggle="collapse" data-parent="#accordion"  href="#collapse-{{:id}}" aria-expanded="true" aria-controls="collapseOne">
		          <h4>{{:title}}</h4>
		        </a>
		      </h4>
		    </div>
		    <div id="collapse-{{:id}}" job-id="{{:id}}" class="panel-collapse collapse padding10" role="tabpanel" aria-labelledby="headingOne">
		    	<h5 class="text-primary" >Información de contacto</h5>
		    	<span class="text-primary">Empresa: </span>
		    	{{:company_name}}
		    	<br>
		    	<span class="text-primary">Email:  </span>
		    	{{:contact_email}}
		    	<br>
		    	<span class="text-primary">Otra información: </span>
		    	{{:contact_other}}
		    	<br>
		    	<h5 class="text-primary" >Detalles de la oferta</h5>
		    	<span class="text-primary">Tipo de contrato: </span>
		    	{{:contract_type}}
		    	<br>
		    	<span class="text-primary">Salario: </span>
		    	{{:salary_budget}}
		    	<br>
		    	<span class="text-primary">Detalles: </span>
		    	{{:offer_details}}
		    	<br>
		    	<br>
		    	<span class="text-primary">Localización: </span>
		    	{{:location}}
		    	<br>    	
		    </div>
	    </div>
	</div>
	</script>
	<?php {/literal} ?>

	<script>
		require([
		  "esri/Map",
		  "esri/WebMap",
		  "esri/views/MapView",
		  "esri/geometry/Point",
		  "esri/symbols/PictureMarkerSymbol",
		  "esri/Graphic",
		  "dojo/on",
		  "dojo/dom",
		  "dojo/domReady!"
		], function(Map,WebMap,MapView,Point,PictureMarkerSymbol,Graphic,on,dom){
		  var map = new Map({
		    basemap: "streets-night-vector"
		  });
			var simpsonsMap = new WebMap({
	      portalItem: {
	        id: "9ac664557a774a858adee0edbb4f686c"
	      }
	    });

	    var worldView = createView ("viewDiv",map,5,[-3, 40],["zoom","attribution"]);	  
			var simpsonsView = createView ("miniViewDiv",simpsonsMap,6,0,["attribution"]);


		  var symbol = createSymbol("https://raw.githubusercontent.com/Esri/quickstart-map-js/master/images/grey-pin-blank.png");
		  var highlightedSymbol = createSymbol("https://raw.githubusercontent.com/Esri/quickstart-map-js/master/images/grey-pin-star.png");
			var symbolSips = createSymbol("https://raw.githubusercontent.com/Esri/quickstart-map-js/master/images/orange-pin-blank.png");
		  var highlightedSymbolSimps = createSymbol("https://raw.githubusercontent.com/Esri/quickstart-map-js/master/images/orange-pin-star.png");


		  checkViewsThenDraw();

 		  // *********************************
			// PETICION AJAX SIMPSONS POIS
			// *********************************

		  window.GEODEV.jobs = {};
			$.getJSON("/assets/data/simpsonsPOIs.json", function(datos){
				GEODEV.jobs.simpsonsPOIs = datos.POIS;

				// (function () {
				//   for (i = 0; i < GEODEV.jobs.data.length; i++) {
				//   	if (GEODEV.jobs.data[i].on_remote === "yes") {
				// 			var POIIndex = Math.floor(Math.random() * (54-i));
				// 	    var POICoordX = GEODEV.jobs.simpsonsPOIs[POIIndex].geometry.x;	
				// 	    var POICoordY = GEODEV.jobs.simpsonsPOIs[POIIndex].geometry.y;
				// 	    GEODEV.jobs.simpsonsPOIs.splice(POIIndex,1);

				// 	  }
				// 	}
				// })();
			});
		  // *********************************
			// PETICION AJAX JOBS DATA
			// *********************************

			// $.getJSON("http://www.geodevelopers.org/api/jobs?callback=?", function(datos){
			$.getJSON("/api/jobs?callback=?", function(datos){
				GEODEV.jobs.data = datos;
				drawPoints();
				// *********************************
				// RENDERIZE JOBS OBJET IN THE TEMPLATE
				// *********************************
				var template = $.templates("#theTmpl");
				var htmlOutput = template.render(GEODEV.jobs.data);
				$("#accordion").html(htmlOutput);
				// *********************************
				// Setting the viewdivs change
				// *********************************
				var miniViewDiv = dom.byId('miniViewDiv');
				var chngViewBtn = dom.byId('chngViewBtn');
				on(chngViewBtn, "click",changeViews);




				// *********************************
				// BOOTSTRAP ACORDION FUNCTIONS
				//1.Highlight job location
				//2.GoTo Job location
				// *********************************		
				$('.collapse').on('show.bs.collapse', function (e) {

			  	worldView.graphics.removeAll();
			  	simpsonsView.graphics.removeAll();
			  	drawPoints();
			  
			  	var idJob = parseInt(e.target.getAttribute("job-id"));
			  	var simpsonsViewGraphic = simpsonsView.graphics.items;
			  	var worldViewGraphic = worldView.graphics.items;

			  	var isInWorldView = worldViewGraphic.find(isInView);
			  	var isInSimpsonsView = simpsonsViewGraphic.find(isInView);
			  	function isInView (lyr){
			  		return lyr.attributes.id=== idJob;
			  	}

			  	if (isInWorldView) {
			  		isInWorldView.symbol = highlightedSymbol;
	  				worldView.goTo({
		  					target: isInWorldView.geometry,
		  					zoom: 8
		  				},
		  				{
		  					animate: true,
  							duration: 1000,
  							easing: "ease-in-out"
						});

			  	} else {
			  		isInSimpsonsView.symbol = highlightedSymbolSimps;
	  				simpsonsView.goTo({
		  					target: isInSimpsonsView.geometry
		  				},
		  				{
		  					animate: true,
  							duration: 1000,
  							easing: "ease-in-out"
						});
			  	}

				});
			});

			function createSymbol (url){
				return new PictureMarkerSymbol({
				  url: url,
				  width: 15,
				  height: 30,
				  yoffset: 10
				});
			}

			function checkViewsThenDraw () {
			  worldView.then(function(){ 	
			  	drawPoints();
			  }, function(error){
			  	console.log("Imposible cargar el mapa:" + error);
				});
				simpsonsView.then(function(){ 	
			  	drawPoints();
			  }, function(error){
			  	console.log("Imposible cargar el mapa:" + error);
				});	
		  }
			
		  function drawPoints(){
				if (GEODEV.jobs.data && worldView.ready && simpsonsView.ready) {    
				  for (i = 0; i < GEODEV.jobs.data.length; i++) {
				  	var jobID = GEODEV.jobs.data[i].id;
				    if (GEODEV.jobs.data[i].on_remote === "yes") {

					    var POIIndex = Math.floor(Math.random() * (54-i));
					    var POICoordX = GEODEV.jobs.simpsonsPOIs[POIIndex].geometry.x;	
					    var POICoordY = GEODEV.jobs.simpsonsPOIs[POIIndex].geometry.y;
					    GEODEV.jobs.simpsonsPOIs.splice(POIIndex,1);

					    //
					    //
					    //
					    //


					    var point = new Point({
					 			longitude: POICoordX,
					      latitude: POICoordY
					    });
		 			    var pointGraphic = new Graphic({
					      geometry: point,
					      symbol: symbolSips,
					      attributes: {
								  "id": jobID,
								}
					    });
					    simpsonsView.graphics.add(pointGraphic);	
					  }else	{
					  	var lat = GEODEV.jobs.data[i].location_lat;
				  		var long = GEODEV.jobs.data[i].location_lon;
				  		var point = new Point({
					 			longitude: long,
					      latitude: lat
					    });
						  var pointGraphic = new Graphic({
					      geometry: point,
					      symbol: symbol,
					      attributes: {
								  "id": jobID,
								}
					    });
					  	worldView.graphics.add(pointGraphic);
					  }
				  }
				} else{
					console.log('No se han cargado los 3 params');
				}
			}

			function changeViews(callback){
				if (miniViewDiv.getAttribute("simpsons-in-main-view") === "0") {
					worldView = createView ("miniViewDiv",map,6,[-3, 40],["attribution"]);
		  		simpsonsView = createView ("viewDiv",simpsonsMap,6,0,["zoom","attribution"]);
		  		checkViewsThenDraw();
		  		miniViewDiv.setAttribute("simpsons-in-main-view","1");

				}else{
					worldView = createView ("viewDiv",map,6,[-3, 40],["zoom","attribution"]);
		  		simpsonsView = createView ("miniViewDiv",simpsonsMap,6,0,["attribution"]);
		  		checkViewsThenDraw();
		  		miniViewDiv.setAttribute("simpsons-in-main-view","0");
				}
			}

			function createView(viewId,mapToSet,zoomToApply,centerToSet,uiArray){
				return new MapView({
			    container: viewId,  
			    map: mapToSet,
			    zoom: zoomToApply, 
			    center: centerToSet,
			    ui: {
			    	components: uiArray 
			    }
			  });
			}

		});
	</script>

	    {include file="footer.tpl"}
	</div>

</body>
</html>