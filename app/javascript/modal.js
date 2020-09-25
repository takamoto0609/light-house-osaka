function modal() {
  const modalOpen = document.getElementById("modal_open");
  const modalWindow = document.getElementById("modal_window");
  const emailLogin = document.getElementById("email_login");

  modalOpen.addEventListener('click', function () {
    modalWindow.style.display = 'block';
  })

  // emailLogin.addEventListener('click', function () {
  //   modalWindow.style.display = 'none';
  // })

}
window.addEventListener("load", modal);