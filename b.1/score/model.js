/* Modelo experimental: pesos são hipóteses de produto, não previsão de risco. */
(function(root){
 const weights=[450,250,200,100];
 function average(a){const values=a.filter(v=>v!==null&&Number.isFinite(v));return values.length?values.reduce((a,b)=>a+b,0)/values.length:null}
 function calculate(ratios,months){
  if(!Number.isInteger(months)||months<0||months>24)throw new RangeError('Período inválido');
  if(!Array.isArray(ratios)||ratios.length!==weights.length||ratios.some(v=>v!==null&&(!Number.isFinite(v)||v<0||v>1)))throw new RangeError('Categorias inválidas');
  if(months===0)return{score:null,coverage:0,months,earned:0};
  const coverage=ratios.reduce((s,v,i)=>s+(v===null?0:weights[i]),0);
  const earned=ratios.reduce((s,v,i)=>s+(v===null?0:v*weights[i]),0);
  return{score:coverage?Math.round(earned/coverage*1000):null,coverage,months,earned};
 }
 const api={weights,average,calculate};root.ScoreModel=api;if(typeof module!=='undefined')module.exports=api;
})(globalThis);
