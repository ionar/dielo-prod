// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require turbolinks
//= require materialize
//= require materialize-form
//= require highcharts
//= require chartkick
//= require cocoon
//= require_tree .

$(document).on("turbolinks:load", function() {
  // cocoon gem, open new input after existent
  $("#weighings a.add_fields").data("association-insertion-method", 'before').data("association-insertion-node", 'this');

  M.Modal._count = 0;
  $('.modal').modal();
  //M.textareaAutoResize($('.materialize-textarea')); //colocar em cada form
  Waves.displayEffect();
  M.updateTextFields();
  $('.dropdown-button').dropdown(); 
  $('input#input_text, textarea#textarea2').characterCounter();
  $('.dropdown-trigger').dropdown();
  $('select').formSelect();
  $('.dropdown-button').dropdown();
  $('input#input_text, textarea#textarea2').characterCounter();
  $('.sidenav').sidenav();

  $('.abre-calendario').datepicker({
  	selectMonths: true,
  	showDaysInNextAndPreviousMonths: true,
  	showMonthAfterYear: true,
    yearRange: 100,
    autoClose: false,
    container: 'body',
    setDefaultDate: false,
    showClearBtn: true,
    // Formato da data que aparece no input
    ////format: 'yyyy-mm-dd',
    format: 'dd-mm-yyyy',
    allowInputToggle: true,
    formatSubmit: 'dd-mm-yyyy', //configurado ou nao em initilizers/time_formats.rb
    onClose: function() {
      $(document.activeElement).blur()
    },

  	i18n: {
	    today: 'Hoje',
	    clear: 'Limpar',
	    done: 'Ok',
	    nextMonth: 'Próximo mês',
	    previousMonth: 'Mês anterior',
	    weekdaysAbbrev: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'],
	    weekdaysShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb'],
	    weekdays: ['Domingo', 'Segunda-Feira', 'Terça-Feira', 'Quarta-Feira', 'Quinta-Feira', 'Sexta-Feira', 'Sábado'],
	    monthsShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
	    months: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro']
	}
  });  
  
});

// Fix bug with turbolinks and sidenav
document.addEventListener('turbolinks:before-render', () => {
  const elem = document.querySelector('.sidenav');
  const instance = M.Sidenav.getInstance(elem);
  if (instance) {
    instance.destroy();
  }
});	