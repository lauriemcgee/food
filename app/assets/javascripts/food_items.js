/* global Vue */

document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      showApps: false,
      showMains: false,
      showSides: false,
      showDesserts: false
    },
    
    methods: {
      clearSetting: function() {
        this.showApps = false;
        this.showMains = false;
        this.showSides = false;
        this.showDesserts = false;
      },
      toggleApps: function() {
        this.clearSetting();
        this.showApps = !this.showApps;
      },
      toggleMains: function() {
        this.clearSetting();
        this.showMains = !this.showMains;
      },
      toggleSides: function() {
        this.clearSetting();
        this.showSides = !this.showSides;
      },
      toggleDesserts: function() {
        this.clearSetting();
        this.showDesserts = !this.showDesserts;
      }
    }
  });
});