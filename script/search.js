$(document).ready(function(){
    $("input[name=searchbox]").keyup(function(e) {
        //console.log(e.target.value);
        let query = e.target.value;
        console.log(query);
        //each game has it's own row
        $("tr:has(label)").each(function(){
            let that = this;
            //this should be just one one element
            $(this).find('label').each(function(){
                //compare strings case insensitive
                if($(this).text().toLowerCase().indexOf(query.toLowerCase()) != -1){
                    $(that).css('display', '');
                }else{
                    $(that).css('display', 'none');
                }
            });
        })
    });
});