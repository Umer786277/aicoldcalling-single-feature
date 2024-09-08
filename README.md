
**Overview**

The Campaigns functionality allows users to create and manage calling campaigns targeting specific leads. Each campaign can target a specific category of leads, and the system automatically initiates calls to these leads using the VAPI API.
Features
•	Create Campaign: Users can create new calling campaigns by specifying the campaign name, the number of target leads, the category of leads, and the call-to-action.
•	Lead Filtering: The system filters leads based on the specified category and initiates calls to valid phone numbers.
•	Automated Calling: The system automatically initiates calls using the VAPI API, handles the conversation, and logs the results.
•	Call Logging: All calls are logged in the database with detailed information, including call summary, analytics, and whether the lead was converted.
•	Campaign Management: Users can view a list of all campaigns and their details.


**Implementation Details**

create_calling_campaign View
This view handles the creation of new calling campaigns and the initiation of calls to the specified leads.
Request Method
•	POST: Handles the creation of a new campaign and initiates calls.
•	GET: Renders the form to create a new campaign.
Request Parameters (POST)
•	name: The name of the campaign.
•	no_of_target_leads: The number of leads to target in this campaign.
•	category: The category of leads to target.
•	call_of_action: The call-to-action for this campaign.



**Workflow**

1.	Create Campaign: The campaign is created and saved in the database using the provided parameters.
2.	Fetch Leads: Leads are fetched based on the specified category, ensuring that only valid phone numbers are selected.
3.	Initiate Calls: For each lead, a call is initiated using the VAPI API. The system cleans up the phone numbers and formats them correctly.
4.	API Request: A POST request is sent to the VAPI API to create a call. The response is checked for success, and call details are extracted.
5.	Log Calls: Call details, including summary and analytics, are logged in the database.
6.	Render Response: The campaign_success.html template is rendered, showing the results of the campaign.
Exception Handling
•	RequestException: Handles generic request errors.
•	HTTPError: Handles HTTP-specific errors.
campaigns_list View
This view displays a list of all existing campaigns.
Request Method
•	GET: Fetches and displays a list of all campaigns.

**Templates**

•	create_calling_compign.html: Form template for creating a new calling campaign.
•	campaign_success.html: Template displayed upon successful campaign creation, showing call logs and campaign details.
•	campaigns_list.html: Template for displaying a list of all campaigns.






**Models**

**Campaign**

Fields:
•	name: The name of the campaign.
•	no_of_target_leads: The number of target leads.
•	category: The category of leads.
•	call_of_action: The call-to-action.

**Call**

Fields:
•	call_id: The ID of the call.
•	phone_number_id: The phone number ID used for the call.
•	created_at: The timestamp when the call was created.
•	status: The status of the call.
•	cost: The cost of the call.
•	customer_name: The name of the customer (lead).
•	phone_number: The phone number of the customer.
•	summary: The summary of the call.
•	analytics: The analytics data for the call.
•	lead_converted: A flag indicating whether the lead was converted.

**Usage**

Creating a Campaign
1.	Go to the "Create Campaign" page.
2.	Fill out the form with the campaign name, number of target leads, category, and call-to-action.
3.	Submit the form to create the campaign and initiate calls.
Viewing Campaigns
1.	Go to the "Campaigns List" page.
2.	View the list of all campaigns with their details.
Dependencies
•	Django: Web framework used for building the application.
•	VAPI API: Used for initiating phone calls and handling conversations.
•	Requests: Python library for sending HTTP requests.
Error Handling
•	No Leads Found (404): If no leads are found for the specified category, the system returns a 404 status with an appropriate message.
•	API Request Failures: The system logs any failures in the API request to VAPI and continues processing other leads.
Logging
•	The system uses the logging module to log debug and error messages, particularly during the API request process.


**How to run**

Clone this repo, head to the root directory, and create a Python Virtual Environment. Then,

 pip install -r requirements.txt
Open 2 different Terminals, from the root folder On first Terminal

cd backend
python app.py
And on another one

cd frontend
npm install
npm start
After this your web application should run on the local host and after capturing the photo it should automatically detect your facial features and on submit, it should redirect to the recommended products page.
