import FlatfileImporter from 'flatfile-csv-importer';
import $ from 'jquery';
import currencyCodes from './currency';

FlatfileImporter.setVersion(2);

const robotImporter = new FlatfileImporter('2bda9380-a84c-11e7-8243-1d92e7c67d6d', {
	type: 'SaaS Licenses',
	fields: [{
			label: 'Total purchase',
			key: 'total_purchase_price',
			description: 'The total of the transaction',
			validators: [{
				validate: 'required',
				error: 'Please confirm the total amount of the transaction'
			}, ]
		},
		{
			label: 'Purchase date',
			key: 'purchase_date',
			validators: [{
				validate: 'required',
				error: 'required'
			}]
		},
		{
			label: 'Expiry date',
			key: 'expiry_date',
			validators: [{
				validate: 'required',
				error: 'required'
			}]
		},
		{
			label: 'Transaction Price',
			key: 'total_purchase_price',
			validators: [{
				validate: 'required',
				error: 'required'
			}]
		},
		{
			label: 'Owner first name',
			key: 'owner_first_name',
			description: 'The first name of the person who bought the license',
			validators: [{
					validate: 'required',
					error: 'Please confirm the name of the portfolio in question'
				},
				{
					validate: 'regex_matches',
					regex: '^[\\w ]+$',
					error: 'Must only contain alphanumeric characters or spaces'
				}
			]
		},
		{
			label: 'Owner last name',
			key: 'owner_last_name',
			description: 'The last name of the person who bought the license',
			validators: [{
					validate: 'required',
					error: 'Please confirm the last name of the person who bought the license'
				},
				{
					validate: 'regex_matches',
					regex: '^[\\w ]+$',
					error: 'Must only contain alphanumeric characters or spaces'
				}
			]
		},
		{
			label: 'Plan name',
			key: 'plan_name',
			description: 'The name of the license (f.x: Slack Enterprise)',

		},
		{
			label: 'Vendor',
			key: 'vendor_name',
			description: 'The name of the vendor who provide the SaaS',
			validators: [{
					validate: 'required',
					error: 'Please confirm the name of the portfolio in question'
				},
				{
					validate: 'regex_matches',
					regex: '^[\\w ]+$',
					error: 'Must only contain alphanumeric characters or spaces'
				}
			]
		},
		{
			label: "Owner's name",
			key: 'owner_last_name',
			description: 'The full name of the person who bought the license',
			validators: [{
					validate: 'required',
					error: 'Please confirm the name of the portfolio in question'
				},
				{
					validate: 'regex_matches',
					regex: '^[\\w ]+$',
					error: 'Must only contain alphanumeric characters or spaces'
				}
			]
		},
		{
			label: 'Transaction Identifier',
			key: 'license_transaction_id',
			validators: [{
					validate: 'unique',
					error: 'This must be a unique value'
				},
				{
					validate: 'required',
					error: 'required'
				}
			]
		},
		{
			label: 'Users capacity',
			key: 'amount_users',
			validators: [{
					validate: 'required',
					error: 'required'
				},
				{
					validate: 'regex_matches',
					regex: '^[-]?[0-9]+$',
					error: 'Must be a whole number'
				}
			]
		},
		{
			label: 'License type',
			key: 'license_type',
			validators: [{
				validate: 'required',
				error: 'required'
			}]
		},
		{
			label: 'License category',
			key: 'license_category',
			validators: [{
				validate: 'required',
				error: 'required'
			}]
		},
		{
			label: 'License Logo',
			key: 'license_logo',
			validators: [{
					validate: 'required',
					error: 'required'
				},
				{
					validate: 'regex_matches',
					regex: '^[\\w ]+$',
					error: 'Must be a valid format'
				}
			]
		},
		{
			label: 'Transaction Currency',
			key: 'transaction_currency',
			validators: [{
				validate: 'required',
				error: 'required'
			}]
		},
		{
			label: 'Notes',
			key: 'license_notes',
			validators: [{
				validate: 'required',
				error: 'required'
			}]
		}
	],
	disableManualInput: false,
	allowInvalidSubmit: true,
	allowCustom: true,
	managed: true
});

robotImporter.registerRecordHook((record, index) => {
	const out = {};

	if (record.total_purchase_price && record.total_purchase_price.includes('.')) {
		try {
			let decimalIndex = record.total_purchase_price.indexOf('.') + 1;
			if (record.total_purchase_price.length - decimalIndex < 2) {
				out.total_purchase_price = {
					value: record.total_purchase_price + '0',
					info: [{
						message: 'padded with zeros',
						level: 'info'
					}]
				};
			}
		} catch (e) {
			console.error('ERROR! : ', e);
		}
	} else if (record.total_purchase_price) {
		try {
			out.total_purchase_price = {
				value: record.total_purchase_price + '.00',
				info: [{
					message: 'padded with zeros',
					level: 'info'
				}]
			};
		} catch (e) {
			console.error('ERROR! : ', e);
		}
	}

	if (record.transaction_currency && currencyCodes.includes(record.transaction_currency.toUpperCase())) {
		try {
			out.transaction_currency = {
				value: record.transaction_currency.toUpperCase()
			};
		} catch (e) {
			console.error('ERROR! : ', e);
		}
	} else {
		try {
			out.transaction_currency = {
				info: [{
					message: 'Please make sure your currency code is ISO format',
					level: 'warning'
				}]
			};
		} catch (e) {
			console.error('ERROR! : ', e);
		}
	}
	if (record.commission_currency && currencyCodes.includes(record.commission_currency.toUpperCase())) {
		try {
			out.commission_currency = {
				value: record.commission_currency.toUpperCase()
			};
		} catch (e) {
			console.error('ERROR! : ', e);
		}
	} else if (record.commission_currency === '') {
		// do nothing
	} else {
		try {
			out.commission_currency = {
				info: [{
					message: 'Please make sure your currency code is ISO format',
					level: 'warning'
				}]
			};
		} catch (e) {
			console.error('ERROR! : ', e);
		}
	}
	if (record.commission && record.commission.includes('.')) {
		try {
			let decimalIndex = record.commission.indexOf('.') + 1;
			if (record.commission.length - decimalIndex < 2) {
				out.commission = {
					value: record.commission + '0',
					info: [{
						message: 'padded with zeros',
						level: 'info'
					}]
				};
			}
		} catch (e) {
			console.error('ERROR! : ', e);
		}
	} else if (record.commission) {
		try {
			out.commission = {
				value: record.commission + '.00',
				info: [{
					message: 'padded with zeros',
					level: 'info'
				}]
			};
		} catch (e) {
			console.error('ERROR! : ', e);
		}
	}
	if (record.other_fees_currency && currencyCodes.includes(record.other_fees_currency.toUpperCase())) {
		try {
			out.other_fees_currency = {
				value: record.other_fees_currency.toUpperCase()
			};
		} catch (e) {
			console.error('ERROR! : ', e);
		}
	} else if (record.other_fees_currency === '') {
		// do nothing
	} else {
		try {
			out.other_fees_currency = {
				info: [{
					message: 'Please make sure your currency code is ISO format',
					level: 'warning'
				}]
			};
		} catch (e) {
			console.error('ERROR! : ', e);
		}
	}
	if (record.other_fees && record.other_fees.includes('.')) {
		try {
			let decimalIndex = record.other_fees.indexOf('.') + 1;
			if (record.other_fees.length - decimalIndex < 2) {
				out.other_fees = {
					value: record.other_fees + '0',
					info: [{
						message: 'padded with zeros',
						level: 'info'
					}]
				};
			}
		} catch (e) {
			console.error('ERROR! : ', e);
		}
	} else if (record.other_fees) {
		try {
			out.other_fees = {
				value: record.other_fees + '.00',
				info: [{
					message: 'padded with zeros',
					level: 'info'
				}]
			};
		} catch (e) {
			console.error('ERROR! : ', e);
		}
	}
	if (record.purchase_date) {
		let thisDate = moment(record.purchase_date).format('YYYY-MM-DD');
		if (thisDate !== 'Invalid date') {
			out.purchase_date = {
				value: moment(record.purchase_date).format('YYYY-MM-DD'),
				info: moment(record.purchase_date).isAfter(moment()) ? [{
					message: 'Date cannot be in the future',
					level: 'error'
				}] : []
			};
		} else {
			out.purchase_date = {
				info: [{
					message: 'please check that the date is formatted YYYY-MM-DD',
					level: 'error'
				}]
			};
		}
	}
	return out;
});

$('#launch').click(function () {
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
	fetch('/create_results', {
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