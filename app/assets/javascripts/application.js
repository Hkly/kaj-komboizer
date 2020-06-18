function toggleFilters() {
  var filterOptions = document.querySelector('.filter-options');
  var filterToggle = document.querySelector('.filter-toggle');

  filterOptions.classList.toggle('hide');
  if(filterOptions.classList.contains('hide')) {
    // hidden
    filterToggle.innerHTML = 'Filters &or;';
  } else {
    filterToggle.innerHTML = 'Filters &and;';
  }
};

document.addEventListener("DOMContentLoaded", function(event) {
  var checkedBoxes = document.querySelectorAll('input[type="checkbox"]:checked');
  if(checkedBoxes.length > 0) {
    toggleFilters();
  }
  document.querySelector('.filter-toggle').addEventListener('click', toggleFilters)
});
