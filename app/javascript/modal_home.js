function modal() {
  const modalOpen = document.getElementById("modal_open");
  const modalWindow = document.getElementById("modal_window");
  const emailLogin = document.getElementById("email_login");
  const modalNewRoom = document.getElementById("modal_new_room");
  const modalWindowNewRoom = document.getElementById("modal_window_new_room");
  const modalShowRoom = document.getElementById("modal_show_room");
  const modalWindowShowRoom = document.getElementById("modal_window_show_room");
  const modalShowProfile = document.getElementById("modal_show_profile");
  const modalWindowShowProfile = document.getElementById("modal_window_show_profile");

  // modalOpen.addEventListener('click', function () {
  //   modalWindow.style.display = 'block';
  // })

  modalNewRoom.addEventListener('click', function () {
    modalWindowNewRoom.style.display = 'block';
  })

  modalShowRoom.addEventListener('click', function () {
    modalWindowShowRoom.style.display = 'block';
  })

  // emailLogin.addEventListener('click', function () {
  //   modalWindow.style.display = 'none';
  // })

}
window.addEventListener("load", modal);