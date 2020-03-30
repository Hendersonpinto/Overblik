import FlatfileImporter from 'flatfile-csv-importer';
import $ from 'jquery';
import currencyCodes from './currency';

FlatfileImporter.setVersion(2);

const robotImporter = new FlatfileImporter('2bda9380-a84c-11e7-8243-1d92e7c67d6d', {
	type: 'Vendor',
	fields: [{
			label: 'Vendor name',
			key: 'name',
			description: 'The name of the vendor',
			validators: [{
					validate: 'required',
					error: 'Please confirm the name of the vendor'
				},
				{
					validate: 'regex_matches',
					regex: '^[\\w ]+$',
					error: 'Must only contain alphanumeric characters or spaces'
				}
			]
		},
		{
			label: 'Vendor\'s website',
			key: 'website',
			description: 'The vendor\'s website URL',
		},
		{
			label: 'Country',
			key: 'country',
			description: 'The country where the vendor is based',
			validators: [{
				validate: 'regex_matches',
				regex: '^[\\w ]+$',
				error: 'Must only contain alphanumeric characters or spaces'
			}]
		},
		{
			label: 'City',
			key: 'city',
			description: 'The city where the vendor is based',
			validators: [{
				validate: 'regex_matches',
				regex: '^[\\w ]+$',
				error: 'Must only contain alphanumeric characters or spaces'
			}]
		},
		{
			label: 'Address',
			key: 'address',
			description: 'The vendor\'s address',
		},
		{
			label: 'Postal Code',
			key: 'postal_zip',
			description: 'The ZIP code',
		}
	],
	disableManualInput: false,
	allowInvalidSubmit: true,
	allowCustom: true,
	managed: true
});


$('#flatfile-vendor').click(function () {
	console.log('this happened');
	robotImporter.setCustomer({
		userId: '1',
		email: 'me@david.gs'
	});

	// console.log("robotImporter: ", robotImporter);

	robotImporter
		.requestDataFromUser()
		.then(function (results) {
			showData(results);
			robotImporter.displaySuccess('Thanks for your data.');
		})
		.catch(function (error) {
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
	fetch('/create_vendor', {
			method: 'post',
			headers: {
				'Content-Type': 'application/json',
				Accept: 'application/json'
			},
			body: JSON.stringify({
				data: importedData
			})
		}).then(response => response.json())
		.then((response) => {
			console.log("This is the then clause of fetch");
			console.log(response);

			if (response.success) {
				window.location.replace(response.redirect_url);
			}
		});
}