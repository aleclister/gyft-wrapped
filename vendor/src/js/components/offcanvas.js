/**
 * Offcanvas toggler
*/

const offcanvas = (() => {

  const offcanvasTogglers = document.querySelectorAll('[data-bs-toggle="offcanvas"]'),
        offcanvasDismissers = document.querySelectorAll('[data-bs-dismiss="offcanvas"]'),
        offcanvas = document.querySelectorAll('.offcanvas'),
        docBody = document.body,
        fixedElements = document.querySelectorAll('[data-fixed-element]'),
        hasScrollbar = window.innerWidth > docBody.clientWidth;
  
  // Creating backdrop
  const backdrop = document.createElement('div');
  backdrop.classList.add('offcanvas-backdrop');

  // Open offcanvas function
  const offcanvasOpen = (offcanvasID, toggler) => {

    let backdropContainer = document.querySelector(offcanvasID).parentNode;

    backdropContainer.appendChild(backdrop);
    setTimeout(() => {
      backdrop.classList.add('show');
    }, 20);
    document.querySelector(offcanvasID).setAttribute('data-offcanvas-show', true);
    if (hasScrollbar) {
      docBody.style.paddingRight = '15px';
      if (fixedElements.length) {
        for (let i = 0; i < fixedElements.length; i++) {
          fixedElements[i].classList.add('right-15');
        }
      }
    }
    docBody.classList.add('offcanvas-open');
  };

  // Close offcanvas function
  const offcanvasClose = () => {
    for (let i = 0; i < offcanvas.length; i++) {
      offcanvas[i].removeAttribute('data-offcanvas-show');
    }
    backdrop.classList.remove('show');
    setTimeout(() => {
      backdrop.parentNode.removeChild(backdrop);
    }, 250);
    if (hasScrollbar) {
      docBody.style.paddingRight = 0;
      if (fixedElements.length) {
        for (let i = 0; i < fixedElements.length; i++) {
          fixedElements[i].classList.remove('right-15');
        }
      }
    }
    docBody.classList.remove('offcanvas-open');
  }

  // Open offcanvas event handler
  for (let i = 0; i < offcanvasTogglers.length; i++) {
    offcanvasTogglers[i].addEventListener('click', (e) => {
      e.preventDefault();
      offcanvasOpen(e.currentTarget.dataset.bsTarget, e.currentTarget);
    });
  }

  // Close offcanvas event handler
  for (let i = 0; i < offcanvasDismissers.length; i++) {
    offcanvasDismissers[i].addEventListener('click', (e) => {
      e.preventDefault();
      offcanvasClose();
    });
  }

  // Close offcanvas by clicking on backdrop
  document.addEventListener('click', (e) => {
    if (e.target.classList[0] === 'offcanvas-backdrop') {
      offcanvasClose();
    }
  });
  
})();

export default offcanvas;
