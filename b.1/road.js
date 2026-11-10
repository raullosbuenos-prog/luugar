const mapSection = document.querySelector('.city-map');
if (mapSection && 'IntersectionObserver' in window && !window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
  const mapObserver = new IntersectionObserver(entries => {
    for (const entry of entries) {
      if (entry.isIntersecting) {
        entry.target.classList.add('in-view');
        mapObserver.unobserve(entry.target);
      }
    }
  }, { threshold: 0.12 });
  mapObserver.observe(mapSection);
} else if (mapSection) {
  mapSection.classList.add('in-view');
}
