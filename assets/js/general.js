/*
 * Permite a console.log seguir funcionando en IE
 * */
if (typeof window.console == "undefined" || typeof window.console.log == "undefined") {
	window.console = {
		log  : function() {},
		info : function(){},
		warn : function(){}
	};
}
if(typeof window.console.group == 'undefined' || typeof window.console.groupEnd == 'undefined' || typeof window.console.groupCollapsed == 'undefined') {
	window.console.group = function(){};
	window.console.groupEnd = function(){};
	window.console.groupCollapsed = function(){};
}
if(typeof window.console.markTimeline == 'undefined') {
	window.console.markTimeline = function(){};
}
window.console.clear = function(){};

/*
 * Funciones a tipo de datos
 * */
String.prototype.isValidEmail = function() {
	return utils.isValidEmail(this);
};
String.prototype.isEmpty = function() {
	return (!this || /^\s*$/.test(this));
};

/*
 * Valores defaults para las funciones de utilidad y de la aplicacion
 * */
var defaults={
	toggle:{
		effectShow:'bounceIn',
		effecthide:'flipOutX'
	},
	window:{
		topPosition:{
			marginTop:0
		}
	},
	navegarA:{
		buttons:[],
		idContenedor: 'page-content'
	},
	accordion:{
		idContenedor:function($this){
			var fieldset=$($this).closest('fieldset').children('div');
			return fieldset;
		}
	}
}
/*
 * Funciones de utilidad para el sistema
 * */
var utils={
	isValidEmail:function(emailAddress){
		var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
		 return pattern.test(emailAddress);
	},
	merge:function() {
		var obj, name, copy,
			target = arguments[0] || {},
			i = 1,
			length = arguments.length;
		for (; i < length; i++) {
			if ((obj = arguments[i]) != null) {
				for (name in obj) {
					copy = obj[name];

					if (target === copy) {
						continue;
					}
					else if (copy !== undefined) {
						target[name] = copy;
					}
				}
			}
		}
		return target;
	},
	toggle:function(opciones){
		opciones = utils.merge(defaults.toggle, opciones || {});
		if($(opciones.$idContenedor).hasClass('hidden')){
			$(opciones.$idContenedor).removeClass();
			$(opciones.$idContenedor).addClass('animated '+opciones.effectShow);
		} else {
			$(opciones.$idContenedor).removeClass();
			$(opciones.$idContenedor).addClass('animated '+opciones.effecthide);
			setTimeout(function () {  
				$(opciones.$idContenedor).addClass('hidden');
			}, 500);
		}
	}
};
/*
 * 
 * */
var app={
	window:{
		topPosition:function(opciones){
			opciones = utils.merge(defaults.window.topPosition, opciones || {});
			$(window).scrollTop($('#'+opciones.idComponente).position().top+opciones.marginTop);
		}
	},
	navegarA:function(opciones){
		opciones = utils.merge(defaults.navegarA, opciones || {});
		$.each(opciones.buttons,function(i,item){
			console.log('click '+item.idComponente);
			click({
				idComponente: item.idComponente,
				idContenedor: opciones.idContenedor,
				url: item.url
			});
		});
	},
	accordion:function(opciones){
		opciones = utils.merge(defaults.accordion, opciones || {});
		var $idContenedor=opciones.idContenedor(opciones.$this);
		$(opciones.$this).toggleClass('icon-angle-down');
		utils.toggle({$idContenedor:$idContenedor,effectShow:'rotateIn',effecthide:'rotateOut'});
	},
	mostrar:function(section,show,scroll){
		$('.'+section).hide();
		$('.'+show).show();

		if (scroll == 'yes') {
			$(window).scrollTop($('#actions').position().top-50);
		}
	},
	cerrarBloque:function(section){
		console.log('click ');
		$(section).parent().parent().parent().parent().fadeOut();
	},
	toogleSection:function(section){
		$('#' + section + '_content').toggle('slow');
	}
}
/*
 * Funcion para realizar el binding click a componentes.
 * @param {json} opciones estructura objeto:
 * {"idComponente":"[idComponente]","url","[url]","idContenedor":"[idContenedor]"}
 * donde
 * "[idComponente]" {string} identificador del componente al cual se realizara el binding del evento click
 * "[url]" {string} direccion de la peticion a resolver
 * "[idContenedor]" {string} identificador del contenedor donde se mostrara el contenido de la request a resolver
*/
function click(opciones){
	$('#'+opciones.idComponente).click(function(){
		console.log(opciones.idComponente);
		llamadaAjax({v_url:opciones.url, v_idContenedor:opciones.idContenedor});
	});
}
/*
 * Funcion que realiza la request via AJAX
 * @param {json} opciones estructura objeto:
 * {"v_idContenedor":"[idContenedor]","v_url":"[url]","params","[parametrosRequest]","data","[dataRequest]"
 * ,"callback":"[callback]","type":"[tipoRequest]","callBackBeforeSend":"[callBackBeforeSend]","interval":"[interval]"
 * }
 * donde
 * "[idContenedor]" {string} identificador del contenedor que se utilizara para mostrar la informacion de la request
 * "[url]" {string} direccion de la request a resolver
 * "[parametrosRequest]" {json} objeto de parametros para la request
 * "[dataRequest]" {json} objeto de parametros de la request [POST]
 * "[callback]" {function} funcion a realizar cuando se obtenga respuesta de la request
 * "[tipoRequest]" {String} establece el tipo de peticion a realizar (GET,POST,PUT,etc)
 * "[callBackBeforeSend]" {function} funcion a realizar antes de realizar la request
 * "[interval]" {bool} establece si se debe limpiar el intervalo de tiempo (AutoRefresh)
*/
function llamadaAjax(opciones){
	console.log('llamada ajax'+opciones.v_url);
	if(!opciones.interval){
		//clearTimeout(t);
	}
	if(opciones.data){
		if(!opciones.type){
			opciones.type='GET';
		}
		$.ajax({
			type:opciones.type,
			beforeSend: function() {
				if(opciones.callBackBeforeSend){
					opciones.callBackBeforeSend();
				}
			},
			url:opciones.v_url,
			success:function(result){
				if(opciones.v_idContenedor){
					console.log('success');
					$("#"+opciones.v_idContenedor).html(result);
				}
				if(opciones.callback){
					opciones.callback(result);
				}
			},
			data: opciones.data
		});
	}else{
		var strRandom='random='+(Math.random()*999);
		if(opciones.params === undefined){
			opciones.params='';
			strRandom='?'+strRandom;
		}else{
			opciones.params='?'+opciones.params;
			strRandom='&'+strRandom;
		}
		$.ajax({
			beforeSend: function() {
				if(opciones.callBackBeforeSend){
					opciones.callBackBeforeSend();
				}
			},
			url:opciones.v_url+opciones.params+strRandom,
			success:function(result){
				if(opciones.v_idContenedor){
					console.log('success');
					$("#"+opciones.v_idContenedor).html(result);
				}
				if(opciones.callback){
					opciones.callback(result);
				}
			}
		});
	}
}