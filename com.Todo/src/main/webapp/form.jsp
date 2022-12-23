
<div class="card p-3 mt-4 ">
	<form action="Addnotes" class="mt-5 w-50  rounded-3" method="POST">
		<div class="mb-3">
			<label for="title" class="form-label">Title</label> <input
				type="text" class="form-control" id="title"
			 name="title">

		</div>
		<div class="mb-3">
		<textarea rows="4" cols="71" id="content" placeholder="Write notes here..." name="content"></textarea>
		</div>

		<button type="submit" class="btn btn-primary">Submit</button>
	</form>
</div>
