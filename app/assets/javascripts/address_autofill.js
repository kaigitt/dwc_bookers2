/*global $*/
$(function() {
  return $('#postcode').jpostal({
    postcode : ['#postcode'],
    address : {
      '#prefecture_name': '%3',
      '#address_city': '%4',
      '#address_street': '%5%6%7',
    },
  });
});
