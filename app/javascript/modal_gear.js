function modal() {
  const modalGear = document.getElementById("modal_gear");
  const modalWindowGear = document.getElementById("modal_window_gear");

  modalGear.addEventListener('click', function () {
    modalWindowGear.style.display = 'block';
  })

}
window.addEventListener("load", modal);