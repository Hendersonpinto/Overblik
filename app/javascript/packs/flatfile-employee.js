import FlatfileImporter from 'flatfile-csv-importer';
import $ from 'jquery';
import currencyCodes from './currency';

FlatfileImporter.setVersion(2);

const robotImporter = new FlatfileImporter('2bda9380-a84c-11e7-8243-1d92e7c67d6d', {
	type: 'Employees',
	fields: [
		{
			label: "Employee's company name",
			key: 'company_name',
			description: 'The name of the company to which the user belongs',
			validators: [
				{
					validate: 'required',
					error: 'Please confirm the name of the company'
				},
				{
					validate: 'regex_matches',
					regex: '^[\\w ]+$',
					error: 'Must only contain alphanumeric characters or spaces'
				}
			]
		},
		{
			label: "Employee department's name",
			key: 'department_name',
			description: 'The name of the department to which the user belongs',
			validators: [
				{
					validate: 'required',
					error: 'Please confirm the name of the department'
				},
				{
					validate: 'regex_matches',
					regex: '^[\\w ]+$',
					error: 'Must only contain alphanumeric characters or spaces'
				}
			]
		},
		{
			label: "Employee's first name",
			key: 'first_name',
			description: "The user's first name"
		},
		{
			label: "Employee's last name",
			key: 'last_name',
			description: "The user's last name"
		},
		{
			label: "Employee's email",
			key: 'email',
			description: "The user's email"
		},
		{
			label: "Employee's role within the company",
			key: 'role'
		},
		{
			label: 'Note',
			key: 'note'
		}
	],
	disableManualInput: false,
	allowInvalidSubmit: true,
	allowCustom: true,
	managed: true
});

$('#flatfile-employee').click(function() {
	console.log('this happened');
	robotImporter.setCustomer({
		userId: '1',
		email: 'me@david.gs'
	});

	// console.log("robotImporter: ", robotImporter);

	robotImporter
		.requestDataFromUser()
		.then(function(results) {
			showData(results);
			robotImporter.displaySuccess('Thanks for your data.');
		})
		.catch(function(error) {
			console.info(error || 'window close');
		});
});

function showData(results) {
	const importedData = results.allData;
	console.log(importedData);
	console.log(typeof importedData);
	importedData.forEach((element) => {
		console.table(element);
	});
	fetch('/create_employee', {
		method: 'post',
		headers: {
			'Content-Type': 'application/json',
			Accept: 'application/json'
		},
		body: JSON.stringify({
			data: importedData
		})
	})
		.then((response) => response.json())
		.then((response) => {
			console.log('This is the then clause of fetch');
			console.log(response);

			if (response.success) {
				window.location.replace(response.redirect_url);
			}
		});
}
