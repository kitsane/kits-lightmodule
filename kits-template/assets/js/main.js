$(function() {
  var mySwiper = new Swiper ('.swiper-container-normal', {
    loop: true,
    autoplay: 5000,
    speed: 2000,
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
});
