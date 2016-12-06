$(function() {
  var mySwiper = new Swiper ('.swiper-container-normal', {
    loop: true,
    autoplay: 5000,
    speed: 1000,
    pagination: '.swiper-pagination',
    paginationClickable: true,
    effect: 'fade',
  })

  var galleryTop = new Swiper('.swiper-container-gallery', {
    nextButton: '.swiper-button-next',
    prevButton: '.swiper-button-prev',
    autoHeight: true,
  });

  var galleryThumbs = new Swiper('.swiper-container-gallery-thumbs', {
      spaceBetween: 15,
      centeredSlides: true,
      slidesPerView: 'auto',
      touchRatio: 0.2,
      slideToClickedSlide: true
  });

  galleryTop.params.control = galleryThumbs;
  galleryThumbs.params.control = galleryTop;

  $('.button__toggle').on('click', function() {
    if ($('.nav__mobile').hasClass('open')) {
      $('.nav__mobile').removeClass('open');
      $('body').removeClass('fixed');
    } else {
      $('.nav__mobile').addClass('open')
      $('body').addClass('fixed');
    }
  })
});
