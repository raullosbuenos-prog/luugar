(() => {
 const route=document.querySelector('.route-path');if(!route)return;
 const pins=[...document.querySelectorAll('.route-pin')];
 const reduced=matchMedia('(prefers-reduced-motion: reduce)');let ticking=false;
 function update(){
  const scrollable=document.documentElement.scrollHeight-innerHeight;
  const progress=reduced.matches?1:Math.max(0,Math.min(1,scrollable>0?scrollY/scrollable:0));
  route.style.strokeDashoffset=String(1000*(1-progress));
  document.documentElement.style.setProperty('--skyline-mid-shift',`${reduced.matches?0:-progress*18}px`);
  document.documentElement.style.setProperty('--skyline-front-shift',`${reduced.matches?0:-progress*36}px`);
  pins.forEach((pin,i)=>{if(progress>=.16+i*.19)pin.classList.add('dropped')});ticking=false;
 }
 function queue(){if(!ticking){requestAnimationFrame(update);ticking=true}}
 addEventListener('scroll',()=>{if(!reduced.matches)queue()},{passive:true});addEventListener('resize',queue);reduced.addEventListener('change',queue);update();
})();
