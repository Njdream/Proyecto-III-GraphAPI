<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sigma JS example</title>
	<script src="build/sigma.min.js"></script>
<style>
      html { height:100%;}
      body {height: 100%;}
      #sigma-container { width:100%; height:100%; background-color:#E1E1E1}
    </style>
</head>
<body>
<button>SigmaJS</button>
 <div id='sigma-container'></div>
    <script>
	var urlNodos='http://localhost:9080/GraphAPI/graphs/n';
	var urlEdge='http://localhost:9080/GraphAPI/graphs/e';
   	const Nodos=new XMLHttpRequest();
   	const Edge=new XMLHttpRequest();
   	var txt;
   	var c=0;
   	var n=0;
   	var graph;
    Nodos.open('GET',urlNodos,true);
    Nodos.send();
    Edge.open('GET',urlEdge,true);
    Edge.send();
    
    Edge.onreadystatechange=function(){
    	console.log("edge");
    }
    Nodos.onreadystatechange=function(){
    	
    		
    	if(this.status==200 ){
    		
    		console.log("response: "+this.responseText );
    		
    		txt=this.responseText.toString().split(',');
    		
    		console.log("txt: "+txt[0].substring(1,4));
    		
    	}else{
    		console.log(this.status);
    		console.log(this.readystate);
    	}
    	while(c<txt.length){
    		console.log("t: "+txt[c]);
    		
    		
    		 graph={	
    				nodes:[
    					
    				{id:n, label: "txt[1].toString()",x:n+1, y:n+1, size:3, color:'#008cc2'} ]
    		}
    		 n++;
    		 c++;
    	}
    	
    }
    var s = new sigma(
    		  {
    			 
    		    renderer: {
    		      container: document.getElementById('sigma-container'),
    		      type: 'canvas'
    		    },
    		    settings: {
    		     minEdgeSize: 0.1,
    		     maxEdgeSize: 2,
    		     minNodeSize: 1,
    		     maxNodeSize: 8,
    		    }
    		  }
    		);
    
    		// Create a graph object
    		/*var graph = {
    		  nodes: [
    		    { id: "n0", label: "A node", x: 0, y: 0, size: 3, color: '#008cc2' },
    		    { id: "n1", label: "Another node", x: 3, y: 1, size: 2, color: '#008cc2' },
    		    { id: "n2", label: "And a last one", x: 1, y: 3, size: 1, color: '#E57821' },
    		    {id:"n3",label:"node",x:2,y:2,size:3,color:'#fff'}
    		  ],
    		  edges: [
    		    { id: "e0", source: "n0", target: "n1", color: '#282c34', type:'line', size:0.5 },
    		    { id: "e1", source: "n1", target: "n2", color: '#282c34', type:'curve', size:1},
    		    { id: "e2", source: "n2", target: "n0", color: '#FF0000', type:'line', size:2}
    		  ]
    		}*/
    		// Load the graph in sigma
    		s.graph.read(graph);
    		// Ask sigma to draw it
    		s.refresh();
    </script>

</body>
</html>