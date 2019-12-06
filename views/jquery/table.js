function draw_table()
{
	$("#results").empty();
	$.getJSONuncached = function (url)
	{
		return $.ajax(
		{
			url: url,
			type: 'GET',
			cache: false,
			success: function (html)
			{
				$("#results").append(html);
				select_row();
			}
		});
	};
	$.getJSONuncached("/get/html")
};

function select_row()
{
	$("#rentTable tbody tr[id]").click(function ()
	{
		$(".selected").removeClass("selected");
		$(this).addClass("selected");
		var cars = $(this).prevAll("tr").children("td[colspan='3']").length - 1;
		var make = $(this).attr("id") - 1;
		delete_row(cars, make);
	})
};

function delete_row(car, mke)
{
	$("#delete").click(function ()
	{
		$.ajax(
		{
			url: "/post/delete",
			type: "POST",
			data:
			{
				cars: car,
				make: mke
			},
			cache: false,
			success: setTimeout(draw_table, 1000)
		})
	})
};

$(document).ready(function ()
{
	draw_table();
});