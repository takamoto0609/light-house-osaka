function modal() {
  const modalOpen = document.getElementById("modal_open");
  const modalWindow = document.getElementById("modal_window");
  const emailLogin = document.getElementById("email_login");
  const modalShowRoom2 = document.getElementById("modal_show_room2");
  const modalWindowShowRoom2 = document.getElementById("modal_window_show_room2");
  
  // modalOpen.addEventListener('click', function () {
  //   modalWindow.style.display = 'block';
  // })

  modalShowRoom2.addEventListener('click', function () {
    modalWindowShowRoom2.style.display = 'block';
  })

  // emailLogin.addEventListener('click', function () {
  //   modalWindow.style.display = 'none';
  // })

}
window.addEventListener("load", modal);