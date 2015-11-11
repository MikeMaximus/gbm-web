function buttonpressdown(ele)
{

	ele.style.borderStyle="inset";
}

function buttonpressup(ele)
{
	ele.style.borderStyle="outset";
}


function expandcollapse(id,ele)
{
   //Expand or collapse a section
   if(document.getElementById(id))
   {
       var esection = document.getElementById(id);
       if(esection.style.display=="none")
       {
           esection.style.display="block";
       }
       else
       {
           esection.style.display="none";
       }
   }
   //Change the callers value
   if(ele.innerHTML=="+")
   {
      ele.innerHTML="-"
   }
   else
   {
      ele.innerHTML="+"
   }
}