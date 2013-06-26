/**
 * Created with JetBrains RubyMine.
 * User: mverapino
 * Date: 6/26/13
 * Time: 4:34 PM
 * To change this template use File | Settings | File Templates.
 */

$(document).ready(function()
    {
        $("#myTable").tablesorter({
            scrollHeight: 300,
            widgets: ['default','scroller']
        })
        $("#li3sta").tablesorter()
    }

)
function addToList(id,bool)
{
      if(bool)      {var amount =$('#amount_'+id+' option:selected').val()}
      else          {var amount =$('#amount_'+id).val()}
    if (isNaN(amount)) return;
    if(amount <= 0) return;
    var lista =  $('#lista tbody');
    var index= lista.children().length
    var cloth = $('#cloth_'+id)
    var clothName= cloth.find('.clothName').text()
    var clothItem = $('#clothItem_'+id);
    if(clothItem.length==0)
    {

        lista.append("<tr id='clothItem_"+id+"'>" +
            "<td class='itemName'> "+ clothName +"</td>" +
            "<td class='itemAmount'> "+amount +"</td>" +
            "<td class='listActions'>"   +
            "<button class='btn' onClick=delete_list_item("+id+")>Eliminar</button>"+"</td>" +
            "<input id='inputCloth_"+id+"' name='items["+index+"][cloth_id]' value='"+id+"' type='hidden'>" +
            "<input id='inputClothAmount_"+id+"'name='items["+index+"][amount]' value='"+amount+"' type='hidden'></tr>")
    }
    else
    {
        clothItem.find('.itemAmount').text(parseInt(ClothItem.find('.itemAmount').text()) )
        $('#inputClothAmount_'+id).val(parseInt($('#inputClothAmount_'+id).val()))

    }
}
function delete_list_item(id){

    $('#clothItem_'+id).remove();
    event.preventDefault();
}